module ApplicationHelper

  def created_by_user? object
    current_user.id == object.id
  end

  def search_query query
    @whies = User.joins(:profile).where('profiles.first_name LIKE ? OR profiles.last_name LIKE ?', '%'+query+'%', '%'+query+'%').collect(&:ask_whies)
    @whies << AskWhy.where('question LIKE ?', '%'+query+'%').order(created_at: :desc)
    @whies = @whies.flatten.uniq
    return @whies
  end

  def user_page?
    params[:controller].include?('devise') || params[:controller] == 'profiles'
  end
end