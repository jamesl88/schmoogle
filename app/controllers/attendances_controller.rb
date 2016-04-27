class AttendancesController < ApplicationController
  def update
    attendance = Attendance.find params[:id]
    attendance.toggle!(:attending)

    render json: AttendanceSerializer.new(attendance)
  end
end
