class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :first_name, null: FALSE
      t.string :last_name, null: FALSE
      t.string :email, null:FALSE
      t.boolean :verified, default: FALSE
      t.string :password_digest

      t.timestamps
    end
  end
end
