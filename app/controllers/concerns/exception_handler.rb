module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :handle_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

    rescue_from ActionController::ParameterMissing, with: :handle_bad_request
  end

  private

  def handle_unprocessable_entity(e)
    render json: { errors: [{ status: 422, title: 'Unprocessable Entity', detail: e.message }] }, status: 422
  end

  def handle_not_found(e)
    render json: { errors: [{ status: 404, title: 'Not Found', detail: e.message }] }, status: 404
  end

  def handle_bad_request(e)
    render json: { errors: [{ status: 400, title: 'Bad Request', detail: e.message }] }, status: 400
  end
end
