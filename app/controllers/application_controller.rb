class ApplicationController < ActionController::API
  include ExceptionHandler

  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.new(request.headers).call
  end
end
