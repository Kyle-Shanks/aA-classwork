class BandsController < ApplicationController
  before_action :require_login, except: [:index]

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find_by(id: params[:id])
    if @band
      render :show
    else
      flash.now[:errors] = ['Band not found']
      render :index
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band.id)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def update
    @band = Band.find_by(id: params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band.id)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    if @band
      @band.destroy
    else
      flash[:errors] = ["Could not locate specified band"]
    end
    redirect_to bands_url
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

  def require_login
    unless logged_in?
      flash[:errors] = ["User must be logged in"]
      redirect_to bands_url
    end
  end
end
