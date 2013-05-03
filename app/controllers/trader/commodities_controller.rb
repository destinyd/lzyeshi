class Trader::CommoditiesController < InheritedResources::Base
  layout 'trader'
  respond_to :json
  belongs_to :group, optional: true
  load_and_authorize_resource :group
  load_and_authorize_resource :commodity, through: :group,except: :index
  def create
    create!{@group}
  end

  def destroy
    destroy!{commodities_path}
  end
  protected
  def begin_of_association_chain
    current_user
  end

  def collection
    @commodities ||= end_of_association_chain.accessible_by(current_ability).recent.with_group.page params[:page]
  end
end
