class LocationsController < InheritedResources::Base
  actions :index
  respond_to :json
  respond_to :js
  belongs_to :trader, optional: true

  protected
  def collection
    @locations ||= end_of_association_chain.recent.page params[:page]
  end
end
