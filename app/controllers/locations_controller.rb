class LocationsController < InheritedResources::Base
  respond_to :json
  respond_to :js
  belongs_to :trader
  actions :index
  def collection
    @locations ||= end_of_association_chain.recent.page params[:page]
  end
end
