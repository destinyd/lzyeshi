module Api::V1
  class CommoditiesController < ApiController
    inherit_resources
    doorkeeper_for :all
    respond_to :json
    belongs_to :group, optional: true

    protected
    def begin_of_association_chain
      current_resource_owner
    end

    def collection
      @commodities ||= end_of_association_chain.recent.page params[:page]
    end
  end
end
