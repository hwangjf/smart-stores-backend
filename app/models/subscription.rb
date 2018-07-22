class Subscription < ApplicationRecord
  has_many :users, through: :user_subscriptions
  has_many :user_subscriptions
end
