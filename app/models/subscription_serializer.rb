class SubscriptionSerializer < AciveModel::Serializer
  attributes :id, :name
  has_many :users, through: :user_subscriptions
  has_many :user_subscriptions
end