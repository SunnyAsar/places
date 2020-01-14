class Reservation < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  enum payment_statu: [:failed, :processing, :successful]
end
