class CommentsController < ApplicationController
  before_action :comment_params
  before_action :authorize_request

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      render json: @comment, status: :ok
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
      render json: {errors: @comment.errors}, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :activity_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
