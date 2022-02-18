class Statistic
  require 'open-uri'
  require 'nokogiri'
  #binding.pry

  attr_reader :user
  attr_accessor :date_range

  def initialize(user, date_range)
    @user = find_user(user)
    @date_range = date_range
    @workdays = set_workdays(user, workdays_date_range(@date_range))
    @all_holidays = Holidays.new(date_range.last.year)
    @date_with_working_hours = set_date_with_working_hours(create_date_hash(@date_range))
  end

  def fact_hours
    @date_with_working_hours.values.sum - holiday_hours - @workdays.select {|workday| workday[:preholiday] == true}.count
  end

  def plan_hours
    short_day = @workdays.select {|workday| workday[:preholiday] == true}
    (@date_range.to_a - @all_holidays.weekends).count * 8 - short_day.count
  end

  def holiday_hours
    # (@workdays.map {|i| i.date.to_date} & @all_holidays.holidays).count
    hours = []
    holidays = @date_with_working_hours.keys & @all_holidays.holidays
    if holidays.any?
      holidays.each do |day|
        hours << @date_with_working_hours[day]
      end
    end
    hours.sum
  end

  def overworking_hours
    plan_hours - fact_hours
  end

  private
  def find_user(user)
    @user ||= User.find(user.id) 
  end

  #Должен учитываться день до 1го дня рассчета на случай наличия суточной смены
  def workdays_date_range(date_range)
    (date_range.begin - 1 .. date_range.max)
  end

  def shift_code_to_hours(workday)
    if workday.shift_code == ("ГН24" || "ОТП")
      return [8]
    elsif workday.shift_code == "Н048"
      return [14, 9]
    else
      raise "Ошибка данных"
    end
  end

  #Создает хэш: key - дата, value - отработанные в эту дату часы
  def create_date_hash(date_range)
    date_hash = {}
    date_range.to_a.each do |day|
      date_hash[day] = 0
    end
    date_hash
  end

  #Заполняет хэш create_date_hash часами из рабочих дней в этот период, проверяет наличие суточной смены за день до этого
  def set_date_with_working_hours(date_hash)
    night_before_date_range = workdays_date_range(@date_range).first
    if workday = @workdays.select {|workday| workday[:date] == night_before_date_range}.first
      hours = shift_code_to_hours(workday)
      date_hash[night_before_date_range + 1] += hours[1] if hours[1]
    end

    date_hash.each_key do |day|
      if workday = @workdays.select {|workday| workday[:date] == day}.first
        hours = shift_code_to_hours(workday)
        date_hash[day] += hours[0]
        date_hash[day + 1] += hours[1] if (hours[1] && day != @date_range.last)
      end
    end

    date_hash
  end

  def set_workdays(user, date_range)
    @workdays ||= user.workdays.where(date: date_range)
  end

  def calculate_weekdays(date_range)
    result = 0
    date_range.each do |day|
      unless day.saturday? || day.sunday? || @all_holidays.holidays.include?(day.to_s)
        result += 1
      end
    end
    result
  end

  def is_start_of_month?(day)
    day["date"] == day["date"].start_of_month
  end

  def is_end_of_month?(day)
    day["date"] == day["date"].end_of_month
  end
  
end