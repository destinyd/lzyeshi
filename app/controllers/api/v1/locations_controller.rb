module Api::V1
  class LocationsController < ApiController
    inherit_resources
    doorkeeper_for :all
    respond_to :json
    actions :all, :except => [ :create ]

    def create
      @location = current_resource_owner.locations.create params[:location]
      if @location.valid?
        render json: @location
      else
        render json: @location.errors, status: 422
      end
    end

    def last
      @location = current_resource_owner.locations.recent.first
      render json: @location
    end

    protected
    def begin_of_association_chain
      current_resource_owner
    end

    def collection
      @groups ||= end_of_association_chain.recent
    end
  end
end
