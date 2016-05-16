class EventSerializer < ActiveModel::Serializer
  attributes :id, :slug, :name
  has_many :participants
  has_many :activities

  def participants
    object.participants.order("id")
  end
end
