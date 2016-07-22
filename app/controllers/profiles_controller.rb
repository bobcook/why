class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to edit_profile_path, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:first_name,:last_name,:bio, :contact, :image, :city, :interests)
    end

    def update_user
      @profile.user.update(username: params[:user][:username])
    end
end