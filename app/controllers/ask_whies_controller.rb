class AskWhiesController < ApplicationController
  before_action :set_ask_why, only: [:show, :edit, :update, :destroy, :like, :dislike, :super_like]

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

  def edit;end

  def index
    @ask_whies = AskWhy.all
  end

  def my_asked_why
    @my_whies = current_user.ask_whies
  end

  def new
    @ask_why = AskWhy.new
  end

  def show;end

  def update
    if @ask_why.update(ask_why_params)
      redirect_to @ask_why, notice: 'Ask why was successfully updated.'
    else
      render :edit
    end
  end

  def like
    if @ask_why.likes.include?(current_user.id.to_s)
      @ask_why.likes.delete current_user.id.to_s
    else
      @ask_why.likes.push current_user.id.to_s
    end
    @ask_why.save
  end

  def dislike
    if @ask_why.dislikes.include?(current_user.id.to_s)
      @ask_why.dislikes.delete current_user.id.to_s
    else
      @ask_why.dislikes.push current_user.id.to_s
    end
    @ask_why.save
  end

  def super_like
    if @ask_why.super_likes.include?(current_user.id.to_s)
      @ask_why.super_likes.delete current_user.id.to_s
    else
      @ask_why.super_likes.push current_user.id.to_s
    end
    @ask_why.save
  end

  private

    def ask_why_params
      params.require(:ask_why).permit(:question)
    end

    def set_ask_why
      @ask_why = AskWhy.find(params[:id])
    end
end