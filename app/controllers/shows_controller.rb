class ShowsController < ApplicationController
  def index
  end

  def create
    @show = Show.create(show_params)
    if @show.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end
    redirect_to show_path(show)
  end

  def show
    @show = Show.order("RANDOM()").first
  end

  private

  def show_params
    params.require(:show).permit(:name, :person, :city)
  end
end
