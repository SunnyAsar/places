class CommentsController < ApplicationController
  before_action :comment_params, only: [:update, :create]
  before_action :set_comment, only: [:update, :destroy]
  before_action :authorize_request

  def index
    @comments = Comment.where(activity_id: params[:activity_id])
    render :index, status: :ok
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.activity_id = params[:activity_id]
    p @comment
    if @comment.save
      render :show, status: :ok
    else
      render json: { errors: @comment.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update_attributes(comment_params)
      render json: @comment, status: :ok
    else
      render json: { errors: @comment.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    if @comment.destroy
      render json: @comment, status: :ok
    else
      render json: { errors: @comment.errors }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
