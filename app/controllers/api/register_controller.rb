class Api::RegisterController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.new(
      email_id: params[:email_id],
      password: params[:password],
    )

    if find_user_from_the_credentials
      render json: { sucess: false,
                     message: "Already a user is present with credetials " }
    else
      if params[:password] == params[:password_confirmation]
        if @user.save
          render json: { sucess: true,
                         message: "Register the user successfully " }
        else
          render json: { sucess: false,
                         message: "error occured during register user " }
        end
      else
        render json: { sucess: false,
                       message: "password and confirm password is not matching " }
      end
    end
  end

  private

  def find_user_from_the_credentials
    User.find_by(email_id: params[:email_id]).present?
  end
end
