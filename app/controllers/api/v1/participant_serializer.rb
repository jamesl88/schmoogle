class Api::V1::ParticipantSerializer < ActiveModel::Serializer
  attributes :id, :attending, :user_id
end
