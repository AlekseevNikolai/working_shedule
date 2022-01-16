class WorkdaysController < ApplicationController
  def index
    # start_date = Date.today
    @workdays  = current_user.workdays.where(date: start_date.at_beginning_of_month..start_date.end_of_month)
  end

  def working_period(start_date)
    start_date
  end
  
  

end
