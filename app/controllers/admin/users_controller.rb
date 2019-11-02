class Admin::UsersController < ApplicationController
  before_action :if_not_admin
  before_action :set_user, only:[:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @task = Task.all
    # @user=User.find(params[:id])
  end

  def new
    # if session[:user_id] = false
    # else
      @user =User.new

  end

  def create
    @user = User.new(user_params)

    if @user.save

      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def show
    # @user=User.find(params[:id])
    @tasks = Task.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      # binding.pry

       redirect_to admin_users_path, notice: "更新しました。"
    else
      render :edit
    end
  end


  def destroy
    if @user.destroy    
      redirect_to admin_users_path, notice: "削除しました。"
    elsif User.where(admin: true).count == 1
      redirect_to admin_users_path, notice: "できません。"
    end
  end






  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end


#   def if_not_admin
#     if current_user == nil
#       redirect_to new_session
#     elsif
# redirect_to new_session_path unless current_user.admin?
# end
#   end

  def if_not_admin
    if current_user == nil
      redirect_to new_session_path
    elsif !current_user.admin?
      redirect_to tasks_path
    end
  end


end
