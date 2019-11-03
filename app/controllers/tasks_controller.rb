class TasksController < ApplicationController
  before_action :set_task, only:[:show, :edit, :update, :destroy]
  before_action :refuse_go_to_task, only:[:index, :show, :edit]



  PER = 8
  def index
    @tasks = Task.all.order("created_at DESC").page(params[:page]).per(PER)
    @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id]}) if params[:label_id].present?

    if params[:sort_by_cut_off_date]
      @tasks=Task.all.order("cut_off_date ASC").page(params[:page]).per(PER)
    else
    end

    if params[:sort_prioriy]
      @tasks=Task.all.order("priority ASC").page(params[:page]).per(PER)
    else
    end

    if params[:name].present?
      @tasks= @tasks.get_by_name params[:name]
    else
    end

    if params[:status].present?
      @tasks=@tasks.get_by_status params[:status]
    else
    end
   end


  def new
      @task =Task.new
    end


  def show
      # @task = @task.joins(:labels).where(labels: { id: params[:label_id]}) if params[:label_id].present?
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
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
    params.require(:task).permit(:name, :content, :status, :label, :priority, :cut_off_date, :user_id, { label_ids: []})
  end

  def set_task
    @task = Task.find(params[:id])

  end

  def refuse_go_to_task
    if current_user == nil
      redirect_to new_session_path
    else
    end
  end
end
