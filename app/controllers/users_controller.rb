class UsersController < ApplicationController
  before_action :authorize_request, excep: [:create]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors.full_message },
                      status: :unprocessable_entity
    end
  end

  def show
    render json: @user
  end

  private

  def find_user
    @user = User.find(user_params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
