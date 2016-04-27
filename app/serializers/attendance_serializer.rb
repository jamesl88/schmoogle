class AttendanceSerializer < ActiveModel::Serializer
  attributes :id, :attending
  has_one :activity
end
