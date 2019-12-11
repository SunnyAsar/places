class AddAmountToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :amount, :decimal, default: 0
  end
end
