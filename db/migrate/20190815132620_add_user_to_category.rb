class AddUserToCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :user, type: :uuid, foreign_key: true
  end
end
