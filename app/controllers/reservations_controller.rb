class ReservationsController < ApplicationController
  before_action :authorize_request
  before_action :reservation_params

  def index
    @reservation = Reservation.all
  end

  def create  
    @reservation = current_user.reservations.build(reservation_params)
    @reservation.total_amount = reservation_params[:party_size] * Activity.find(reservation_params[:activity_id]).amount || 2
    @reservation.payment_status = 1
    if @reservation.save
      @token = stripe_tokenization(@reservation)
      render json: @token, status: :ok
    else

    end

  end

  def stripe_tokenization(data)
    Stripe.api_key = 'sk_test_csBw4vn5pi6R101m2x5vk8RU00dF4ZLPZQ'
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: data.activity.name,
          description: 'Comfortable cotton t-shirt',
          images: [url_for(data.activity.thumbnail),'https://example.com/t-shirt.png'],
          amount: data.activity.amount.to_i * 100,
          currency: 'usd',
          quantity: data.party_size,
        }],
        success_url: 'http://localhost:3000',
        cancel_url: 'http://localhost:3000/activities/'+data.activity.id,
      )
  end

  def search
  end


  private

  def reservation_params
    params.require(:reservation).permit(:activity_id, :party_size, :reservation_date, :info)
  end
end