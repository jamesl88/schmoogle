class EventPlannerController < ApplicationController
  def index
    @users = User.all.as_json(include: [:participants, :activities])
  end
end
