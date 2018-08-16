class TracksController < ApplicationController
  before_action :require_login

  def show
    @track = Track.find_by(id: params[:id])
    if @track
      @album = Album.find_by(id: @track.album_id)
      render :show
    else
      flash[:errors] = ['Could not locate track']
      redirect_to bands_url
    end
  end

  def new
    @album = Album.find_by(id: params[:album_id])
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      @album = Album.find_by(id: @track.album_id)
      flash[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    if @track
      render :edit
    else
      flash[:errors] = ['Could not locate specified track']
      redirect_to bands_url
    end
  end

  def update
    @track = Track.find_by(id: params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find_by(id: params[:id])
    if @track
      @track.destroy
    else
      flash[:errors] = ['Could not locate specified track']
    end
    redirect_to bands_url
  end

  private

  def track_params
    params.require(:track).permit(:title, :ord, :bonus_track, :album_id, :lyrics)
  end

  def require_login
    unless logged_in?
      flash[:errors] = ["User must be logged in"]
      redirect_to bands_url
    end
  end
end
