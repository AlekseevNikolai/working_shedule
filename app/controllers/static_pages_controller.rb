class StaticPagesController < ApplicationController
  def home
    @calendar = SimpleCalendar::LineCalendar.new(self, {})
    @start_date = Date.today
    @users = User.all
    @workdays = Workday.all
    all_holidays = Holidays.new(@start_date.year)
    @holidays = all_holidays.holidays
    @weekends = all_holidays.weekends
    @preholidays = all_holidays.preholidays
  end
end
