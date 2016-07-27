class DashboardController < ApplicationController
include ApplicationHelper

  def home;end

  def search
    @wishes = search_query(params[:query])
  end
end