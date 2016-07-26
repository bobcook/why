class DashboardController < ApplicationController

  def home;end

  def search
    query = params[:query]
    @whies = User.joins(:profile).where('profiles.first_name LIKE ? OR profiles.last_name LIKE ?', '%'+query+'%', '%'+query+'%').collect(&:ask_whies)
    @whies << AskWhy.where('question LIKE ?', '%'+query+'%')
    @whies = @whies.flatten.uniq
  end
end