class ActivitiesController < ApplicationController
  def create
    activity = Activity.new(activity_params)
    if activity.save
      respond_to do |format|
        format.json { render json: EventSerializer.new(activity.event).as_json['event'] }
      end
    else
      respond_to do |format|
        format.json { render json: { errors: activity.errors.full_messages } }
      end
    end
  end

  def update
    activity = Activity.find(params[:id])
    if activity.update_attributes(activity_params)
      flash[:success] = "'#{activity.name}' has been updated"
    else
      flash[:alert] = 'Opps - something went wrong. Please try again'
    end

    redirect_to :back
  end

  def destroy
    activity = Activity.find(params[:id])
    if activity.destroy!
      flash[:success] = "'#{activity.name}' successfully deleted"
    else
      flash[:alert] = 'Opps - something went wrong. Please try again'
    end

    redirect_to :back
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :scheduled_at, :event_id)
  end
end
