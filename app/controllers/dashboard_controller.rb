class DashboardController < ApplicationController

  def home
  	@body_class = 'with-top-navbar'
  	@ask_why = AskWhy.new
  	@ask_whies = AskWhy.all
  end

  def search
    @wishes = search_query(params[:query])
  end
end