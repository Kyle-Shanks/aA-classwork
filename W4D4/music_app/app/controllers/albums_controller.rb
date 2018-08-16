class AlbumsController < ApplicationController
  before_action :require_login

  def show
    @album = Album.find_by(id: params[:id])
    if @album
      render :show
    else
      flash[:errors] = ['Album not found']
      redirect_to bands_url
    end
  end

  def new
    @band = Band.find_by(id: params[:band_id])
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      @band = Band.find_by(id: @album.band_id)
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    if @album
      render :edit
    else
      flash[:errors] = ['Could not locate specified album']
      redirect_to bands_url
    end
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    if @album
      @album.destroy
    else
      flash[:errors] = ["Could not locate specified album"]
    end
    redirect_to bands_url
  end

  private

  def album_params
    params.require(:album).permit(:title,:year,:band_id,:live_album)
  end

  def require_login
    unless logged_in?
      flash[:errors] = ["User must be logged in"]
      redirect_to bands_url
    end
  end
end
