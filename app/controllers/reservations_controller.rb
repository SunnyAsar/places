class ReservationsController < ApplicationController
  before_action :authorize_request
  before_action :reservation_params
  before_action :set_reservation, only: [:update]

  def index
    reservation = Reservation.all
  end

  def create  
    reservation = current_user.reservations.build(reservation_params)
    reservation.total_amount = reservation_params[:party_size].to_i * Activity.find(reservation_params[:activity_id]).amount || 2
    reservation.payment_status = 1
    if reservation.save
      @token = stripe_tokenization(reservation)
      reservation = Reservation.find reservation.id
      reservation.reservation_id = @token.id
      reservation.save
      render json: @token, status: :ok
    else

    end
  end


  def complete_reservation
    puts params
  end

  def stripe_tokenization(data)
    Stripe.api_key = 'sk_test_csBw4vn5pi6R101m2x5vk8RU00dF4ZLPZQ'
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: data.activity.name,
          description: 'Comfortable cotton t-shirt',
          images: [url_for(data.activity.thumbnail), 'https://example.com/t-shirt.png'],
          amount: data.activity.amount.to_i * 100,
          currency: 'usd',
          quantity: data.party_size,
        }],
        success_url: 'http://localhost:3000/complete_reservation?session_id={CHECKOUT_SESSION_ID}',
        cancel_url: 'http://localhost:3000/activities/'+data.activity.id,
      )
  end

  def update
    @reservation.payment_status = 2
    @reservation.save
  end

  private

  def reservation_params
    params.require(:reservation).permit(:activity_id, :party_size, :reservation_date, :info)
  end

  def set_reservation
    @reservation = Reservation.find_by(reservation_id: params[:id])
  end
end
