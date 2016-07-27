class AskWhiesController < ApplicationController
  before_action :set_ask_why, only: [:show, :edit, :update, :destroy, :like, :dislike, :super_like, :reshare]
  include AskWhiesHelper

  def create
    @ask_why = current_user.ask_whies.new(ask_why_params)
    if @ask_why.save
      redirect_to my_asked_why_ask_whies_path, notice: 'Ask why was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @ask_why.destroy
    redirect_to ask_whies_url, notice: 'Ask why was successfully destroyed.'
  end

  def dislike
    dislike_why
  end

  def edit;end

  def index
    @ask_whies = AskWhy.all
  end

  def like
    like_why
  end

  def my_asked_why
    @my_whies = current_user.ask_whies
  end

  def new
    @ask_why = AskWhy.new
  end

  def reshare
    reshare_why
  end

  def show;end

  def super_like
    super_like_why
  end

  def update
    if @ask_why.update(ask_why_params)
      redirect_to @ask_why, notice: 'Ask why was successfully updated.'
    else
      render :edit
    end
  end

  private

    def ask_why_params
      params.require(:ask_why).permit(:question)
    end

    def content_includes_why?
      ask_why_params[:question].downcase.include?('why')    
    end

    def set_ask_why
      @ask_why = AskWhy.find(params[:id])
    end
end