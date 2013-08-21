class ArticlesController < InheritedResources::Base
  actions :index, :show
  protected
  def collection
    @articles ||= end_of_association_chain.recent.page params[:page]
  end
end
