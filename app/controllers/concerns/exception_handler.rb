module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :handle_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  end

  private

  def handle_unprocessable_entity(e)
    render json: { errors: [{ status: 422, title: 'Unprocessable Entity', detail: e.message }] }, status: 422
  end

  def handle_not_found(e)
    render json: { errors: [{ status: 404, title: 'Not Found', detail: e.message }] }, status: 404
  end
end
