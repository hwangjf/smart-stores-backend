class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :name, :info

  has_many :user_subscriptions
  has_many :users, through: :user_subscriptions
end
