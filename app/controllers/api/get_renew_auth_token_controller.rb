class Api::GetRenewAuthTokenController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(refresh_auth_token: params[:refresh_auth_token])

    if user.present?
      user.update_auth_refresh_token

      render json: { sucess: true,
                     auth_token: user.auth_token,
                     refresh_auth_token: user.refresh_auth_token,
                     valid_till: user.valid_till }
    else
      render json: { sucess: false,
                     message: "Not a valid refresh auth token " }
    end
  end
end
