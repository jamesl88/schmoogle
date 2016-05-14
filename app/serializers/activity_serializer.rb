class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :scheduled_at

  def name
    object.name.capitalize
  end

  def scheduled_at
    object.scheduled_at.strftime("%H:%M")
  end
end
