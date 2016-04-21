class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
    event = Event.new(event_params)

    if event.save
      flash[:success] = "'#{event.name}' has been added"
    else
      flash[:alert] = 'Something went wrong - Event has not been created'
    end

    redirect_to :back
  end

  def update
    event = Event.find(params[:id])
    if event.update_attributes(event_params)
      flash[:success] = "'#{event.name}' has been updated"
    else
      flash[:alert] = 'Something went wrong - User has not been updated'
    end

    redirect_to :back
  end

  def show
    @event = Event.find params[:id]
    @activities = @event.activities.all
  end

  def destroy
    event = Event.find(params[:id])
    if event.destroy!
      flash[:success] = "'#{event.name}' has been deleted"
    else
      flash[:alert] = 'Opps - something went wrong. Please try again'
    end

    redirect_to :back
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :name, :date)
  end
end
