class Api::V1::ParticipantSerializer < ActiveModel::Serializer
  attributes :id, :attending, :activity_id
end
