class CategoriesController < ApplicationController
  before_action :authorize_request, except: [:index]

  def index
    @categories = Category.all
    render json: @categories
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render json: @category, status: :ok
    else
      render json: { errors: @category.errors.full_message }, status: :unprocessable_entity
    end
  end

  def destroy
    if @category.destroy
      render json: 'destroyed', status: :ok  
    else
      render json: { error: @category.errors.full_message }, status: :unauthorized
    end
  end
  
private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(:id)  
  end

end
