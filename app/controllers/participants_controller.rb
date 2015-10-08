class ParticipantsController < ApplicationController

  def update
    participant = Participant.find_by(participant_params)
    if participant.save
      flash[:success] = 'Success'
    else
      flash[:alert] = 'Opps - something went wrong. Please try again'
    end

    redirect_to :back
  end

  private

  def participant_params
    params.require(:participant).permit(:id, :user_id, :attending, :activity_id)    
  end
end
