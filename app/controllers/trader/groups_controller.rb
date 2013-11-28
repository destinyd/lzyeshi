class Trader::GroupsController < InheritedResources::Base
  layout 'left_nav'
  respond_to :json
  load_and_authorize_resource except: :index
  skip_load_and_authorize_resource :only => :index

  def show
    show! do 
      @commodities = @group.commodities.recent
    end
  end
  def create
    create!{@group}
  end

  def destroy
    destroy!{groups_path}
  end

  def bulk_add
    @group = current_user.groups.find params[:id]
  end

  def bulk_add_commodities
    @group = current_user.groups.find params[:id]
    @group.update_attributes params[:group]
    if @group.bulk_add
      @group.share url: group_url(@group,subdomain: ENV['SUBDOMAIN'])
      redirect_to @group
    else
      render :bulk_add
    end
  end
  protected
  def begin_of_association_chain
    current_user
  end

  def collection
    @groups ||= end_of_association_chain.accessible_by(current_ability).recent.page params[:page]
  end
end
