class StaticPagesController < ApplicationController
  def home
    @calendar = SimpleCalendar::LineCalendar.new(self, {})
    @start_date = Date.today
    @users = User.all
    @workdays = Workday.all
    all_holidays = Holidays.new
    @holidays = all_holidays.holidays
    @preholidays = all_holidays.preholidays
  end
end
