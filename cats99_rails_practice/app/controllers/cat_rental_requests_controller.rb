class CatRentalRequestsController < ApplicationController


  def new
    @cats = Cat.all
    render :new
  end

  def create
    @rental = CatRentalRequest.new(cat_rental_requests_params)

    if @rental.save
      redirect_to cat_url(@rental.cat)
    else
      render json: @rental.errors.full_messages
    end
  end

  private

  def cat_rental_requests_params
    params.require(:cat_rental_requests).permit(:cat_id, :start_date, :end_date)
  end
end
