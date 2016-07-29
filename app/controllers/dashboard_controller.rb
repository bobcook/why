class DashboardController < ApplicationController
	include DashboardHelper
	skip_before_filter :verify_authenticity_token, only: [:search]
  def home
  	homepage
  end

  def search
    @ask_whies = search_query(params[:query].downcase)
    @post = Post.new
  end
end