class Reservation < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  enum payment_status: [:failed, :processing, :successful]
end
