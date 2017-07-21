class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :update, :destroy]

  # GET /businesses
  def index
    name = params[:name]
    @businesses = Business.paginate(:page => params[:page])
    @name = Business.search(name)
      if @businesses
        json_response(@businesses)
      else @name
        json_response(@name)
      end
  end


  # GET /businesses/1
  def show
    @business = Business.find(params[:id])
    render json: @business
  end

  # POST /businesses
  def create
    @business = Business.new(business_params)

    if @business.save
      render json: @business, status: :created, location: @business
    else
      render json: @business.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /businesses/1
  def update
    @business = Business.find(params[:id])
    binding.pry
    @business.update(business_params)
    if @business.update!(business_params)
      render json: @business, json: {
     message: "Your Business has been updated successfully."
     }
    else
      render json: @business.errors, status: :unprocessable_entity
    end
  end

  # DELETE /businesses/1
  def destroy
    @business.destroy
    render json: {
     message: "Your Business has been DESTROYED!."
     }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    def json_response(object)
      render json: object, status: :ok
    end

    # Only allow a trusted parameter "white list" through.
    def business_params
      params.permit(:name, :address, :phone)
    end
end
