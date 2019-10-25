class AddDateToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :reservation_date, :datetime
  end
end
