class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      user.add_activities
      flash[:success] = "'#{user.name}' has been added"
    else
      flash[:alert] = 'Something went wrong - User has not been created'
    end

    redirect_to :back
  end

  def update
    user = User.find(user_params[:id])
    if user.update_attributes(user_params)
      flash[:success] = "'#{user.name}' has been updated"
    else
      flash[:alert] = 'Something went wrong - User has not been updated'
    end

    redirect_to :back
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy!
      flash[:success] = "'#{user.name}' has been deleted"
    else
      flash[:alert] = 'Opps - something went wrong. Please try again'
    end

    redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit(:id, :name)
  end
end
