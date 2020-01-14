class LikesController < ApplicationController
  before_action :likes_params, only: [:create]
  before_action :authorize_request

  def create
    @like = @current_user.likes.build(likes_params)
    if @like.save
      render json: @like, status: :ok
    else
      render json: { errors: @like.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      render json: @like, status: :ok
    else
      render json: { errors: @like.errors }, status: :unprocessable_entity
    end
  end

  private

  def likes_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
