class AddPaymentStatusToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :payment_status, :integer, default: :processing
  end
end
