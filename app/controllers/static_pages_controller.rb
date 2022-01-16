class StaticPagesController < ApplicationController
    def home
        @calendar = SimpleCalendar::LineCalendar.new(self, {})
        @start_date = Date.today
        @users = User.all
        @user = User.find(2)
        # @workdays = @user.workdays.where(date: Date.today.at_beginning_of_month .. Date.today.end_of_month)
        @workdays = @user.workdays.all
    end
end
