class UserSubscriptionSerializer < ActiveModel::Serializer
  attr_accessor :date, :cost
  attributes :user_id, :date, :cost, :subscription_id

  # belongs_to :user
  # belongs_to :subscription
end
