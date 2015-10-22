class ActivitiesController < ApplicationController
  def index
    @activity = Activity.new
    @activities = Activity.all
  end

  def create
    activity = Activity.new(activity_params)
    if activity.save
      assign_activity_to_user
      flash[:success] = "'#{activity.name}' has been added"
    else
      flash[:alert] = 'Something went wrong - Your activity has not been created'
    end

    redirect_to :back
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

  def assign_activity_to_user
    User.all.each { |user| user.add_activities }
  end

  def activity_params
    params.require(:activity).permit(:name, :scheduled_at)    
  end
end
