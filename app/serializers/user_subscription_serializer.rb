module Api::V1
  class UserSerializer < ActiveModel::Serializer
    belongs_to :user
    belongs_to :subscription
  end
end