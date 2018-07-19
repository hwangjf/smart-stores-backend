class SubscriptionSerializer < AciveModel::Serializer
  attributes :id, :name
  has_many :user_subscriptions
end