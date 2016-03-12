class Api::V1::ParticipantsController < Api::V1::BaseController
  def update
    participant = Participant.find params[:id]
    participant.toggle!(:attending)

    render json: Api::V1::ParticipantSerializer.new(participant)
  end
end
