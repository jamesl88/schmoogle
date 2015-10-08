class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = 'User has been created'
    else
      flash[:alert] = 'Something went wrong - User has not been created'
    end

    redirect_to :back
  end

  def update
    user = User.find(user_params[:id])
    if user.save
      update_participants
      flash[:success] = 'Success'
    else
      flash[:alert] = 'Opps - something went wrong. Please try again'
    end

    redirect_to :back
  end

  private

  def update_participants
    user_params[:participants_attributes].each do |param|
      participant = Participant.find(param[1][:id])
      participant.attending = param[1][:attending]
      participant.save!
    end
  end

  def user_params
    params.require(:user).permit(
      :id,
      :name,
      { participants_attributes: [:id, :user_id, :attending, :activity_id] }
    )
  end
end
