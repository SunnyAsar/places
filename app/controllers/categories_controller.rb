class CategoriesController < ApplicationController
  before_action :authorize_request, except: [:index]
  before_action :set_category, except: [:index, :create]

  def index
    @categories = Category.all
    render json: @categories
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = @current_user.id
    if @category.save
      render json: @category, status: :ok
    else
      render json: { errors: @category.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    if @category.destroy
      render json: @category, status: :ok
    else
      render json: { error: @category}, status: :unauthorized
    end
  end



private
  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end
