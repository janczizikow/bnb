class ProfilesController < ApplicationController
  before_action :set_user, only: :update

  def update
    authorize @user
    if @user.update(user_params)
      flash[:notice] = 'Profile successfully updated!'
      redirect_to dashboard_path
    else
      render 'dashboard/index'
    end
  end


  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo, :photo_cache)
  end
end
