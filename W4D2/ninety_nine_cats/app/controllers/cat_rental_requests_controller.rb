class CatRentalRequestsController < ApplicationController

  def new
    @request = CatRentalRequest.new
    @cats = Cat.all
    render :new
  end

  def create
    @request = CatRentalRequest.new(rental_params)

    if @request.save
      redirect_to cats_url
    else
      @cats = Cat.all
      render :new
    end
  end

  def approve
    CatRentalRequest.find_by(id: params[:id]).approve!
    redirect_to cats_url
  end

  def deny
    CatRentalRequest.find_by(id: params[:id]).deny!
    redirect_to cats_url
  end

  private

  def rental_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
