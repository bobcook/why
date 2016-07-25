module ApplicationHelper

  def created_by_user? object
    current_user.id == object.id
  end

  def user_page?
    params[:controller].include?('devise') || params[:controller] == 'profiles'
  end
end
