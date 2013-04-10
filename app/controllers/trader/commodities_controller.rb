class Trader::CommoditiesController < InheritedResources::Base
  respond_to :json
  belongs_to :group, optional: true
  def collection
    @commodities ||= end_of_association_chain.opening.recent.page params[:page]
  end
end
