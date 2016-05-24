class ParticipantsController < ApplicationController
  def create
    participant = Participant.new(participant_params)
    if participant.save
      respond_to do |format|
        format.json { render json: EventSerializer.new(participant.event).as_json['event'] }
      end
    else
      respond_to do |format|
        format.json { render(json: "Please enter a name", status: :unprocessable_entity) }
      end
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :activity_id, :attending, :event_id)
  end
end
