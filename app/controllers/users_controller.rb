class UsersController < ApplicationController

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
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
      @user = User.find(params[:id])
      if @user.id  == current_user.id

      else
        redirect_to tasks_path,
        notice: "権限がありません。"

      end
    end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
