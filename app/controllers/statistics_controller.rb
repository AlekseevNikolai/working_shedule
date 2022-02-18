class StatisticsController < ApplicationController
  before_action :set_date_range

  def index
    users = User.all
    create_statistics(users, @date_range)
  end

  def create_statistics(users, date_range)
    @statistics = []
    users.each do |user|
      @statistics << Statistic.new(user, date_range)
    end
  end

  private

  def statistic_params
    params.require(:statistic).permit(:start_date, :end_date)
  end

  def set_date_range
    if params[:start_date] && params[:end_date]
      begin
        params[:start_date].to_date
        params[:end_date].to_date
        return @date_range = (params[:start_date].to_date .. params[:end_date].to_date)
      rescue Date::Error
        flash[:error] = "Неверный формат даты"
        redirect_to statistics_path
        return
      end
    end
    @date_range = (Date.today.beginning_of_month .. Date.today.end_of_month)
  end

  def date_validation
    begin
      params[:start_date].to_date
      params[:end_date].to_date
    rescue Date::Error
      flash[:error] = "Неверный формат даты"
      redirect_to statistics_path
      return
    end
  end
end
