class EventsController < ApplicationController
  def create
    event = Event.new(event_params)
    if event.save
      redirect_to event_path(event.slug), notice: "'#{event.name}' has been added"
    else
      redirect_to :back, alert: 'Something went wrong - Event has not been created'
    end
  end

  def show
    @event = Event.find_by(slug: params[:id])
    event_serializer = EventSerializer.new(@event).as_json

    @serialized_event = event_serializer['event']

    respond_to do |format|
      format.html
      format.json { render json: @serialized_event }
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :user_id,
      :name,
      :date,
      :description,
      activities_attributes: [:name, :scheduled_at],
      participants_attributes: [:name]
    )
  end
end
