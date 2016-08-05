class TracksController < ApplicationController
  before_action :require_login

  def show
    @track = Track.find_by_id(params[:id])
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track.id)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def update
    @track = Track.find_by(params[:id])
    render :edit
  end

  def update
  end

  def destroy
  end

  def track_params
    params.require(:track).permit(:name, :album_id, :lyrics, :bonus)
  end
end
