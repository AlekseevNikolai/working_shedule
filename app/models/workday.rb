class Workday < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :shift_code, presence: true
  # after_create :holiday_work

  # С attr_accessor не устанавливаеься date при create
  # attr_accessor :date

  def start_time
    self.date
  end

  # Set cron by whenever in shedule.rb
  def self.update_all_holidays
    all_holidays = Holidays.new

    all_holidays.holidays.each do |holiday|
      day = Workday.find_by(date: Date.parse(holiday))
      if day
        day.update(holiday: true)
      end
    end

    all_holidays.preholidays.each do |preholiday|
      day = Workday.find_by(date: Date.parse(preholiday))
      if day
        day.update(preholiday: true)
      end
    end
  end

  # Костылище
  def holiday_work
    all_holidays = Holidays.new(self.date.to_date.year)
    self.holiday = true if all_holidays.holidays.include? self.date.to_date
    self.preholiday = true if all_holidays.preholidays.include? self.date.to_date
    self
  end

end
