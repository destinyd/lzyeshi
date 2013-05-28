module Api::V1
  class GroupsController < ApiController
    inherit_resources
    doorkeeper_for :all
    respond_to :json

    def show
      @group = current_resource_owner.groups.find(params[:id])
      show! do |format|
        format.json { render json: @group.as_json({methods: [:humanize_price], except: []})}
      end
    end

    def bulk_add_commodities
      @group = current_resource_owner.groups.find params[:id]
      @group.update_attributes params[:group]
      if @group.bulk_add
        render status: 200
      else
        render json: @user.errors, status: 422
      end
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
