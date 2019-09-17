class ActivitiesController < ApplicationController
  before_action :authorize_request
  before_action :set_activity, only: %i[show destroy]

  def index
    @activities = Activity.all.with_attached_images
    render json: @activities, status: :ok
  end

  def show
    render json: @activity
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

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :description, :country,
                                     :city, :category_id, images: [])
  end
end
