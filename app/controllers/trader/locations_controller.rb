class Trader::LocationsController < InheritedResources::Base
  respond_to :json

  protected
  def begin_of_association_chain
    current_user
  end

  def collection
    @locations ||= end_of_association_chain.recent.page params[:page]
  end
end
