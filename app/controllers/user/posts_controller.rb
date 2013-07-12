class User::PostsController < InheritedResources::Base
  before_filter :authenticate_user!
  layout 'user'
  actions :index, :destroy, :new, :create

  def create
    create!{posts_path}
  end

  protected
  def begin_of_association_chain
    current_user
  end

  def collection
    @posts ||= end_of_association_chain.recent.page params[:cpage]
  end
end
