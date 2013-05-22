module Api::V1
  class GroupsController < ApiController
    inherit_resources
    doorkeeper_for :all
    respond_to :json

    protected
    def begin_of_association_chain
      current_resource_owner
    end

    def collection
      @groups ||= end_of_association_chain.recent
    end
  end
end
