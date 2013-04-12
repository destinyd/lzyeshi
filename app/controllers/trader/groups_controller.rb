class Trader::GroupsController < InheritedResources::Base
  respond_to :json
  load_and_authorize_resource
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
    @groups ||= end_of_association_chain.page params[:page]
  end
end
