class AttendancesController < ApplicationController
  def update
    attendance = Attendance.find params[:id]
    attendance.toggle!(:attending)

    render json: EventSerializer.new(attendance.activity.event)
  end
end
