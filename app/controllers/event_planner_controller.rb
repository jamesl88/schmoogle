class EventPlannerController < ApplicationController
  def index
    @activities = Activity.all.as_json(include: :participants)
    @users = User.all.as_json(include: :participants)
  end
end
