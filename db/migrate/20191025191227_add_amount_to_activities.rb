class AddAmountToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :amount, :decimal, default: 1
  end
end
