class UsersController < ApplicationController
include ApplicationHelper

  def follow
    @id = params[:user_id]
    user_follow(@id)
    @followers = User.find(@id).followers
  end

  def unfollow
    @id = params[:user_id]
    user_unfollow(@id)
    @followers = User.find(@id).followers
  end
end