class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def show
    @show = Show.find(params[:id])
  end

end
