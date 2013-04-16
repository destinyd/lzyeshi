class Trader::GroupsController < InheritedResources::Base
  respond_to :json
  load_and_authorize_resource except: :index
  skip_load_and_authorize_resource :only => :index
  def create
    create!{@group}
  end

  def destroy
    destroy!{groups_path}
  end
  protected
  def begin_of_association_chain
    current_user
  end

  def collection
    @groups ||= end_of_association_chain.accessible_by(current_ability).page params[:page]
  end
end
