class Admin::ArticlesController < InheritedResources::Base
  before_filter :authenticate_admin!
  layout 'admin'

  def create
    create!{articles_path}
  end

  def update
    update!{articles_path}
  end

  def destroy
    destroy!{articles_path}
  end

  def publish
    @article = Article.find params[:id]
    @article.publish
    redirect_to articles_path
  end

  protected
  def collection
    @articles ||= end_of_association_chain.recent.page params[:page]
  end
end
