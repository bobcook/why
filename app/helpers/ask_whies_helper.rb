module AskWhiesHelper

  def already_following? id
    current_user.following.include?(id.to_s)
  end
end