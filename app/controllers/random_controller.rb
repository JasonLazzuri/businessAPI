class RandomController < ApplicationController

  def index
    random = rand(1..100)
    @business = Business.find([random])
    render json: @business

  end

private

  # Only allow a trusted parameter "white list" through.
  def business_params
    params.permit(:name, :address, :phone)
  end
end
