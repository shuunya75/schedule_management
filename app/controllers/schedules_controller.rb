class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:notice] = "スケジュールを追加できました"
      redirect_to root_path
    else
      flash.now[:error] = "保存できませんでした"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      flash[:notice] = "編集できました"
      redirect_to root_path
    else
      flash.now[:error] = "編集できませんでした"
      render :edit
    end
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy!
    flash[:notice] = "予定を削除しました"
    redirect_to root_path, status: :see_other
  end

  private
  def schedule_params
    params.require(:schedule).permit(:title, :start_date, :end_date, :is_all_day, :content)
  end
end