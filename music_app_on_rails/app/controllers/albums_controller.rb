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
      fail
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by_id(params[:id])
    render :edit
  end

  def update
    @album = Album.find_by_id(params[:id])

    if @album.update(album_params)
      redirect_to album_url(@album.id)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find_by_id(params[:id].to_s)
    @album.destroy
    redirect_to band_url(@album.band)
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :live)
  end
end
