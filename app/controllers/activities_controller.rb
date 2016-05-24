class ActivitiesController < ApplicationController
  def create
    activity = Activity.new(activity_params)
    if activity.save
      respond_to do |format|
        format.json { render json: EventSerializer.new(activity.event).as_json['event'] }
      end
    else
      respond_to do |format|
        format.json { render(json: "Something went wrong, please try again", status: :unprocessable_entity) }
      end
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :scheduled_at, :event_id)
  end
end
