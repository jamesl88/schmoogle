class EventSerializer < ActiveModel::Serializer
  has_many :participants
  has_many :activities
end
