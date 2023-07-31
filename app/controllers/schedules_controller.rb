class SchedulesController < ApplicationController
  #予定一覧表示
  def index
    @schedules = Schedule.all 
    
  end

  #予定詳細表示
  def show
    @schedule = Schedule.find(params[:id])
  end

  #予定の作成
  def new
    @schedule = Schedule.new
  end 
  
  #予定の登録
  def create 
    #Scheduleモデルを初期化
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :starting_date, :ending_date, :is_all_day, :memo))
    #ScheduleモデルをDBへ保存
    if @schedule.save
       flash[:notice] = "新規スケジュールを作成しました" 
       redirect_to :schedules
    else
      flash.now[:alert] = "スケジュール作成に失敗しました"
      render :new,status: :unprocessable_entity
    end   
  end 
  
  #予定の編集
  def edit 
    @schedule = Schedule.find(params[:id])
  end 
  
  #予定の更新
  def update 
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      flash[:notice] = "スケジュールを編集しました" 
      redirect_to :schedules
    else
      flash.now[:alert] = "スケジュール編集に失敗しました"
      render 'edit',status: :unprocessable_entity
    end    
  end 
  
  #予定の削除
  def destroy 
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path
  end   

  private
  def schedule_params
    params.require(:schedule).permit(:title,:starting_date,:ending_date,:memo,:is_all_day)
  end  
end
