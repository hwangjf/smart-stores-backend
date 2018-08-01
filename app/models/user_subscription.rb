class UserSubscription < ApplicationRecord
  attr_accessor :date
  attr_accessor :cost

  belongs_to :user
  belongs_to :subscription

end
