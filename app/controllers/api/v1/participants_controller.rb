class Api::V1::ParticipantsController < Api::V1::BaseController
  def update
    participant = Participant.find params[:id]
    participant.toggle!(:attending)
  end
end
