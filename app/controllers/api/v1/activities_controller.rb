class Api::V1::ActivitiesController < Api::V1::BaseController
  def show
    activity = Activity.find params[:id]
    render json: Api::V1::ActivitySerializer.new(activity)
  end
end
