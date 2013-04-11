class Trader::CommoditiesController < InheritedResources::Base
  respond_to :json
  belongs_to :group, optional: true
  load_and_authorize_resource :group
  load_and_authorize_resource :commodity, :through => :group
  def create
    create!{@comodity}
  end

  def destroy
    destroy!{commodities_path}
  end
  protected
  def begin_of_association_chain
    current_user
  end
  def collection
    @commodities ||= end_of_association_chain.opening.recent.page params[:page]
  end
end
