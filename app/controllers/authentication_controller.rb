class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    auth_token = AuthenticateUser.new(params.fetch(:email), params.fetch(:password)).call
    render json: { meta: { token: auth_token } }, status: :ok
  end

end
