class ParticipantsController < ApplicationController

  def update
    participant = Participant.find(params[:id])
    load_users_and_activities

    respond_to do |format|
      if participant.toggle!(:attending)
        format.js
      else
        format.json { render json: {}, status: :unprocessable_entity }
      end
    end
  end

  private

  def load_users_and_activities
    @activities = Activity.all
    @users = User.all
  end
end
