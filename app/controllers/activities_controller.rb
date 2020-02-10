class ActivitiesController < ApplicationController
  before_action :authorize_request
  before_action :set_activity, only: %i[show destroy update]

  def index
    @activities = Activity.all.sample(9)
    render :index, status: :ok
  end

  def show
    render :show, status: :ok
  end

  def create
    @activity = current_user.activities.create(activity_params)

    if @activity.save
      render json: @activity, status: :ok
    else
      render json: { errors: @activity.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @activity.update_attributes(activity_params)
      # @activity.images.attach(params[:activity][:images])
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
    params.require(:activity).permit(:name, :description, :country, :amount,
                                     :city, :category_id, :thumbnail, images: [])
  end
end

