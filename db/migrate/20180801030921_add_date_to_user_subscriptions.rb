class AddDateToUserSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :user_subscriptions, :date, :string
  end
end
