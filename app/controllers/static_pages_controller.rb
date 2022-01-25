class StaticPagesController < ApplicationController
    def home
        @calendar = SimpleCalendar::LineCalendar.new(self, {})
        @start_date = Date.today
        @users = User.all
    end
end
