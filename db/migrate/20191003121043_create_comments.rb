class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.text :content
      t.uuid :commenter_id
      t.references :activity, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
