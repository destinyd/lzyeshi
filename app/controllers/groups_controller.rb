class GroupsController < InheritedResources::Base
  respond_to :json
  def show
    @group = Group.find(params[:id])
    @commodities = @group.commodities.page(params[:page])
  end

  protected
  def collection
    @groups ||= end_of_association_chain.available.page params[:page]
  end
end
