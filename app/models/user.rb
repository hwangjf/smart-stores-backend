class User < ApplicationRecord
  has_secure_password

  has_many :user_subscriptions
  has_many :subscriptions, through: :user_subscriptions

  validates :username, presence: true, uniqueness: true, length: {minimum: 5}
  validates :password, presence: true, length: {minimum: 5}
end
