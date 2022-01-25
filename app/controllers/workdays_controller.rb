class WorkdaysController < ApplicationController

  respond_to :html, :json

  before_action :selected_user, only: :create

  def index
    # start_date = Date.today
    # @workdays  = current_user.workdays.where(date: start_date.at_beginning_of_month..start_date.end_of_month)
  end
  
  def new
    @workday = Workday.new(date: params[:day])
    @users = sorted_users
    @shift_codes = [["09:00 - 18:00", "ГН24"], ["09:00 - 09:00", "Н048"]]
    respond_modal_with @workday
  end

  def create
    user = User.find_by_id(workday_params[:user_id])
    @workday = user.workdays.new(workday_params)
    if @workday.save
      flash[:success] = "Смена добавлена"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @workday = Workday.find(params[:id])
    @users = sorted_users
    @shift_codes = [["09:00 - 18:00", "ГН24"], ["09:00 - 09:00", "Н048"]]
    respond_modal_with @workday
  end

  def update
    @workday = Workday.find(params[:id])
    if @workday.update(workday_params)
      flash[:success] = "График изменен"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    Workday.find(params[:id]).destroy
    flash[:success] = "Смена удалена"
    redirect_to root_path
  end

  private
  def workday_params
    params.require(:workday).permit(:user_id, :shift_code, :date)
  end

  def selected_user
    if !User.find_by_id(workday_params[:user_id])
      flash[:danger] = "Пользователь не найден"
      redirect_to new_workday_path
      # render 'new'
    end
  end

  def sorted_users
    users = []
    User.all.each do |user|
      users << ["#{user[:last_name]} #{user[:first_name]}", user[:id]]
    end
    users
  end

end
