class ActivitySerializer < ActiveModel::Serializer
  attributes :name, :scheduled_at, :location
end
