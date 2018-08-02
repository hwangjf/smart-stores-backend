class AddCostToUserSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :user_subscriptions, :cost, :string
  end
end
