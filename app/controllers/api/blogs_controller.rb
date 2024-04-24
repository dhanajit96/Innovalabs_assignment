class Api::BlogsController < ApplicationController
  before_action :verify_token
  #   skip_before_action :require_login, only: [:index]

  def index
    render json: Blog.all
  end

  private

  def verify_token
    unless valid_token?
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def valid_token?
    token = request.headers["Authorization"]&.split(" ")&.last
    return false if token.nil?
    user = User.find_by(auth_token: token).present?
    return true if user && user.valid_till > Time.now
  end
end
