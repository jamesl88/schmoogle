class ParticipantSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :attendances

  def attendances
    object.attendances.includes(:activity).order("activities.scheduled_at asc")
  end
end
