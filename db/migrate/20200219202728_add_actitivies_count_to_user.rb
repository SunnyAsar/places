class AddActitiviesCountToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :activities_count, :integer, default: 0, null: false

    User.find_each { |u| User.reset_counters(u.id, :activities_count) }

  end
end
