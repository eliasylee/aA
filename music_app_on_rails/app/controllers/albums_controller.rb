class AlbumsController < ApplicationController
  before_action :require_login

  def show
    @album = Album.find_by_id(params[:id])
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album.id)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def update
    @album = Album.find_by_id(params[:id])
    render :edit
  end

  def destroy
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :live)
  end
end
