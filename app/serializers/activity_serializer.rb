class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :scheduled_at, :attendance_count

  def name
    object.name.capitalize
  end

  def scheduled_at
    object.scheduled_at.strftime("%H:%M")
  end

  def attendance_count
    object.attendances.where(attending: true).count
  end
end
