class ArticlesController < InheritedResources::Base
  actions :index, :show

  before_filter :articles_crumb
  before_filter :tags_crumb, only: [:tags, :tag]
  before_filter :tag_crumb, only: :tag

  def show
    show! do 
      add_crumb @article.to_s
    end
  end

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

  def articles_crumb
    #add_crumb(I18n.t("controller.articles"), articles_path)
    add_crumb('夜市经验', articles_path)
  end

  def tags_crumb
    add_crumb(I18n.t("action.tags"), tags_articles_path)
  end

  def tag_crumb
    add_crumb(params[:tag], tag_articles_path(params[:tag]))
  end
end
