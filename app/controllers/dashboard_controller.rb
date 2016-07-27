class DashboardController < ApplicationController

  def home;end

  def search
    @wishes = search_query(params[:query].downcase)
  end
end