class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities, id: :uuid do |t|
      t.string :name
      t.text :description
      t.string :country
      t.string :city
      t.uuid :owner_id
      t.references :category, type: :uuid, foreign_key: true

      t.timestamps
    end
    add_foreign_key :activities, :users, column: :owner_id, index: true
  end
end
