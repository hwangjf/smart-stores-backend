class UserSerializer < ActiveModel::Serializer
  attributes :id, :username

  has_many :user_subscriptions
  has_many :subscriptions, through: :user_subscriptions
end
