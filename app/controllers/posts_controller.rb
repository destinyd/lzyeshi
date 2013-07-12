class PostsController < InheritedResources::Base
  layout 'span12'
  actions :index, :show

  protected
  def collection
    @posts ||= end_of_association_chain.recent.page params[:page]
  end
end
