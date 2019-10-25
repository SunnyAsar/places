class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations, id: :uuid do |t|
      t.string :reservation_id
      t.integer :party_size
      t.decimal :total_amount
      t.text :info
      t.references :activity,type: :uuid, null: false, foreign_key: true
      t.references :user,type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
