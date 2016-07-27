class UsersController < ApplicationController
  include UsersHelper
  before_filter :set_user_id, only: [:follow, :unfollow]
  after_filter :count_followers, only: [:follow, :unfollow]

  def follow
    follow_user(@id)
  end

  def unfollow
    unfollow_user(@id)
  end

  private

    def count_followers
      @followers = User.find(@id).followers.count    
    end

    def set_user_id
      @id = params[:user_id]
    end
end