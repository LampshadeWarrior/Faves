class ShowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @shows = Show.all
        # @shows = Show.select(:name).map(&:name).uniq

  end
 
  def create
    @show = current_user.shows.create(show_params)
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
    current_user.vote_for(@show)
    respond_to do |format|
      format.js
    end
  end


  private

  def show_params
    params.require(:show).permit(:title)
  end
end
