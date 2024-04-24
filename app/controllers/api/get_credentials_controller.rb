class Api::GetCredentialsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(email_id: params[:email_id])

    if user && user.authenticate(params[:password])
      render json: { sucess: true,
                     auth_token: user.auth_token,
                     refresh_auth_token: user.refresh_auth_token,
                     valid_till: user.valid_till }
    else
      render json: { sucess: false,
                     message: "Email or Password is not valid. No user found" }
    end
  end
end
