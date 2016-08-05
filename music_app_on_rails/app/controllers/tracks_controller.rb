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
      fail
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find_by_id(params[:id])
    render :edit
  end

  def update
    @track = Track.find_by_id(params[:id])

    if @track.update(track_params)
      redirect_to track_url(@track.id)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find_by_id(params[:id].to_s)
    @track.destroy
    redirect_to album_url(@track.album)
  end

  def track_params
    params.require(:track).permit(:name, :album_id, :lyrics, :bonus)
  end
end
