# class auth

class AuthenticationController < ApplicationController
  before_action :authorize_request, except: [:login]

  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time, user: @user }, status: :ok
    else
      error = {}
      if params[:email].blank? || params[:password].blank?
        error['email'] =  "email can't be blank" unless params[:email].present?
        error['password'] = "password can't be blank" if params[:password].blank?
      else
        error['general'] = 'Invalid Email or Password'
      end
        return render json: error, status: :unauthorized
    end
  end

  private
  def login_params
    params.permit(:email, :password)
  end
end
