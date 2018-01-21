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

    show = Show.find(params[:show_id])
    current_user.vote_for(show)
    
    # respond_to do |format|
    #   format.js
    # end

    render json: {
      status: 200,
      liked: true,
      message: "Successfully voted"
    }.to_json
    
    # render :nothing => true, :status => 200
  end

  def unvote_for_show
    # byebug
    show = Show.find(params[:show_id])
    current_user.unvote_for(show)

    # respond_to do |format|
    #   format.js
#     end    

      render json: {
      status: 200,
      liked: false,
      message: "Successfully unvoted"
    }.to_json
    
    # render :nothing => true, :status => 200
  end


  private


  helper_method :current_show
  def current_show
    @current_show ||= Show.find(params[:id])
  end

end
