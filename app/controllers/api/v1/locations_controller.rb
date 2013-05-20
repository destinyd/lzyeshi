module Api::V1
  class LocationsController < ApiController
    doorkeeper_for :all
    respond_to :json

    def create
      @location = current_resource_owner.locations.create params[:location]
      if @location.valid?
        render json: @location
      else
        render json: @location.errors, status: 422
      end
    end

  end
end
