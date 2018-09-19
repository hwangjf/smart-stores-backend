class UserSubscription < ApplicationRecord
  include ActiveModel::AttributeMethods
  
  attr_accessor :date, :cost

  belongs_to :user
  belongs_to :subscription

end
