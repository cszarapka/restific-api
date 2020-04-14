class IdentifiersController < ApplicationController
  before_action :set_identifier
  attr_reader :identifier

  def show
    render json: identifier, status: :ok
  end

  def iterate
    identifier.update!(value: identifier.value + 1)
    render json: identifier, status: :ok
  end

  def reset
    value = params[:value] || 0
    identifier.update!(value: value)
    render json: identifier, status: :ok
  end

  private

  def set_identifier
    key = params[:key] || 'default'
    @identifier = current_user.identifiers.find_or_create_by!(key: key)
  end
end
