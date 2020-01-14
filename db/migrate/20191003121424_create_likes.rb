class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes, id: :uuid do |t|
      t.uuid :liker_id
      t.references :likeable, type: :uuid, polymorphic: true, null: false

      t.timestamps
    end
  end
end
