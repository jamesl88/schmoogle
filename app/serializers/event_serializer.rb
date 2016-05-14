class EventSerializer < ActiveModel::Serializer
  attributes :id
  has_many :participants
  has_many :activities

  def participants
    object.participants.order("id")
  end
end
