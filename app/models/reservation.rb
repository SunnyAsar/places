class Reservation < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  enum payment_status: [:failed, :processing, :successful]

  def book
    self.total_amount = self.party_size * activity.amount.to_f || 2
    self.payment_status = 1
    self
  end

  def update_reservation(token_id)
    self.reservation_id = token_id
    self.save
  end
end
