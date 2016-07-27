module UsersHelper

  def follow_user id
    current_user.add_following id
    current_user.save
    user = User.find(id)
    user.add_follower current_user.id
    user.save
  end

  def unfollow_user id
    current_user.remove_following id
    current_user.save
    user = User.find(id)
    user.remove_follower current_user.id
    user.save
  end
end