class TracksController < ApplicationController
  before_action :require_login

  def show
    @track = Track.find(params[:id])
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])

    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = ["Error"]
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id].to_s)
    @track.destroy
    redirect_to album_url(@track.album)
  end

  def track_params
    params.require(:track).permit(:name, :album_id, :lyrics, :bonus)
  end
end
