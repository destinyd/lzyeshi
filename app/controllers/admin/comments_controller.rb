class Admin::CommentsController < InheritedResources::Base
  before_filter :authenticate_admin!
  layout 'left_nav'

  actions :index, :show, :destroy

  protected
  def collection
    @comments ||= end_of_association_chain.accessible_by(current_ability).system.recent.page params[:page]
  end
end
