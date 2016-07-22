class AskWhiesController < ApplicationController
  before_action :set_ask_why, only: [:show, :edit, :update, :destroy]

  def index
    @ask_whies = AskWhy.all
  end

  def show;end

  def new
    @ask_why = AskWhy.new
  end

  def edit;end

  def create
    @ask_why = current_user.ask_whies.new(ask_why_params)

    if @ask_why.save
      redirect_to my_asked_why_ask_whies_path, notice: 'Ask why was successfully created.'
    else
      render :new
    end
  end

  def update
    if @ask_why.update(ask_why_params)
      redirect_to @ask_why, notice: 'Ask why was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ask_why.destroy
    redirect_to ask_whies_url, notice: 'Ask why was successfully destroyed.'
  end

  def my_asked_why
    @my_whies = current_user.ask_whies
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ask_why
      @ask_why = AskWhy.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ask_why_params
      params.require(:ask_why).permit(:question)
    end
end
