class ActivitiesController < ApplicationController
  before_action :authorize_request
  before_action :set_activity, only: %i[show destroy]

  def index
    @activities = Activity.all.sample(9)
    render :index, status: :ok
  end

  def show
    render :show, status: :ok
  end

  def create
    @activity = current_user.activities.build(activity_params)
    if @activity.save
      @activity.images.attach(params[:activity][:images])
      render json: @activity, status: :ok
    else
      render json: { errors: @activity.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    if @activity.destroy
      render json: @activity, status: :ok
    else
      render json: { errors: @activity.errors }, status: :unprocessable_entity
    end
  end

  private

  def meal_json(meal)
    meal.as_json.merge(photos: meal.photos.map { |photo| url_for(photo) })
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :description, :country,
                                     :city, :category_id, :thumbnail, images: [])
  end
end
