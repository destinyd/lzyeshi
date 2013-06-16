class User::CommentsController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :js
  belongs_to :commodity, optional: true
  belongs_to :group, optional: true
  actions :index, :destroy

  protected
  def begin_of_association_chain
    current_user
  end

  def collection
    @comments ||= end_of_association_chain.recent.page params[:cpage]
  end

end
