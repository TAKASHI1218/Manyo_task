class TasksController < ApplicationController
  before_action :set_task, only:[:show, :edit, :update, :destroy]


  def index
    # @tasks =Task.all
    if params[:sort_cut_off_date] == nil
      @tasks=Task.all.order("created_at DESC")


    elsif params[:sort_cut_off_date]
      # binding.pry
      @tasks=Task.all.order("cut_off_date ASC")


     end
   end

  def new
      @task =Task.new
    end


  def show
  end

  def create
    @task = Task.new(task_params)
    if params[:back]
      render :new
     else
      if @task.save
        redirect_to tasks_path, notice: "新規登録しました"

      else
        render :new
      end
    end
  end

  def edit
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "削除しました。"

  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "更新しました。"
    else
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :content, :status, :label, :priority, :cut_off_date, :user_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
