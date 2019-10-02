# clsass
class ApplicationController < ActionController::API
  attr_reader :current_user
  before_action :set_default_request_format

  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers[:Authorization]
    # header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  private

  def set_default_request_format
    request.format = :json unless params[:format]
  end
end
