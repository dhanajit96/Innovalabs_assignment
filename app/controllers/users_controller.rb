class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
    @all_users = User.all
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)

    if params[:user][:password] == params[:password_confirmation]
      if @user.save
        redirect_to root_path, notice: "User was successfully created."
      else
        render root_path
      end
    else
      flash.now[:error] = "Password and password confirmation do not match."
      render root_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email_id, :password)
  end
end
