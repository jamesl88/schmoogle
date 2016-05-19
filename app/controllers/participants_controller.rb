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

  def update
    participant = Participant.find(params[:id])
    if participant.update_attributes(participant_params)
      flash[:success] = "'#{participant.name}' has been updated"
    else
      flash[:alert] = 'Opps - something went wrong. Please try again'
    end

    redirect_to :back
  end

  def destroy
    participant = Participant.find(params[:id])
    if participant.destroy!
      flash[:success] = "'#{participant.name}' successfully deleted"
    else
      flash[:alert] = 'Opps - something went wrong. Please try again'
    end

    redirect_to :back
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :activity_id, :attending, :event_id)
  end
end
