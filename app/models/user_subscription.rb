class UserSubscription < ApplicationRecord
  attr_accessor :date, :cost

  belongs_to :user
  belongs_to :subscription

end
