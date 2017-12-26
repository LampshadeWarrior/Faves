class ShowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @shows = Show.all
        # @shows = Show.select(:name).map(&:name).uniq
  end


  def create
    @show = current_user.shows.create(params)
    if @show.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @show = Show.find(params[:id])
  end


  def vote_for_show
    # byebug
    show = Show.find(params[:format])
    current_user.vote_for(show)
    
    respond_to do |format|
      format.js
   end
  end

  def vote_against_show
    show = Show.find(params[:id])
    current_user.vote_against(show)

    respond_to do |format|
      format.js
    end
  end


  private


  helper_method :current_show
  def current_show
    @current_show ||= Show.find(params[:id])
  end

end
