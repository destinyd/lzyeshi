class ArticlesController < InheritedResources::Base
  actions :index, :show

  def tags
    @tags = Article.tags
  end

  def tag
    @tag = Article.tag(params[:tag])
    @articles = @tag.recent.page(params[:page])
    render :index
  end
  protected
  def collection
    @articles ||= end_of_association_chain.recent.page params[:page]
  end
end
