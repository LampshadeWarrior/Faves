class ShowsController < ApplicationController
  def index
  end

  def create
    @show = Show.new
    Show.create(show_params)
    redirect_to root_path
  end

  private

  def show_params
    params.require(:show).permit(:name, :person, :city)
  end
end
