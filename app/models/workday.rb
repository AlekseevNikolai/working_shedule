class Workday < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :shift_code, presence: true

  def start_time
    self.date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
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
end
