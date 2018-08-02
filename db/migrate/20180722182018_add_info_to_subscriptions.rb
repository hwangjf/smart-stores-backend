class AddInfoToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :info, :json
  end
end
