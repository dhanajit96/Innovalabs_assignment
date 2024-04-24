class LoginsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email_id: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully!"
    else
      flash.now[:error] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
