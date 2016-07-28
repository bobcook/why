class UsersController < ApplicationController
  include UsersHelper
  before_filter :set_user_id, only: [:follow, :unfollow]

  def follow
    follow_user(@id)
    @followers = User.find(@id).followers.count    
  end

  def unfollow
    unfollow_user(@id)
    @followers = User.find(@id).followers.count    
  end

  private

    def set_user_id
      @id = params[:user_id]
    end
end