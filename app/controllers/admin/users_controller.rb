class Admin::UsersController < ApplicationController
  before_action :if_not_admin
  before_action :set_user, only:[:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @task = Task.all
    # @user=User.find(params[:id])
  end

  def new
    if session[:user_id] = false
    else
      @user =User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to admin_user_path(@user.id)
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

       redirect_to admin_users_path, notice: "更新しました。"
    else
      render :edit
    end
  end


  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "削除しました。"
  end






  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end


  def if_not_admin
    redirect_to new_user_path unless current_user.admin?
  end
end
