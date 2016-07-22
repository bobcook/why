module ApplicationHelper

  def user_page?
    params[:controller].include?('devise') || params[:controller] == 'profiles'
  end
end
