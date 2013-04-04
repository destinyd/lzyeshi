class CommoditiesController < InheritedResources::Base
  respond_to :json
  belongs_to :group
  def collection
    @commodities ||= end_of_association_chain.opening.page params[:page]
  end
end
