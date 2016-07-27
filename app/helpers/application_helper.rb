module ApplicationHelper

  def created_by_user? object
    current_user.id == object.id
  end

  def user_page?
    params[:controller].include?('devise') || params[:controller] == 'profiles'
  end

  def search_query query
    @whies = User.joins(:profile).where('profiles.first_name LIKE ? OR profiles.last_name LIKE ?', '%'+query+'%', '%'+query+'%').collect(&:ask_whies)
    @whies << AskWhy.where('question LIKE ?', '%'+query+'%')
    @whies = @whies.flatten.uniq
    return @whies
  end

  def user_follow id
    current_user.add_following id
    current_user.save
    user = User.find(id)
    user.add_follower current_user.id
    user.save
  end

  def user_unfollow id
    current_user.remove_following id
    current_user.save
    user = User.find(id)
    user.remove_follower current_user.id
    user.save
  end
end
