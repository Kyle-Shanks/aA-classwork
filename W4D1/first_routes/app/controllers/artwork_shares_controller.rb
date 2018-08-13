class ArtworkSharesController < ApplicationController
  def create
    share = ArtworkShare.new(share_params)
    if share.save
      render json: share
    else
      render json: share.errors.full_messages, status: 422
    end
  end

  def destroy
    share = ArtworkShare.find_by(id: params[:id])
    if share
      share.destroy
      render plain: 'ArtworkShare destroyed'
    else
      render plain: 'ArtworkShare not found', status: 404
    end
  end

  def index
    user = User.find_by(id: params[:user_id])
    render json: user.artworks
  end

  def show
    user = User.find_by(id: params[:user_id])
    render json: user.artworks 
  end


  private

  def share_params
    params.require(:artwork_share).permit(:viewer_id, :artwork_id)
  end
end
