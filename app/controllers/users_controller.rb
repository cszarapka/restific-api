class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    render json: { meta: { token: auth_token } }, status: :created
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
