class PostsController < InheritedResources::Base
  layout :posts_layout
  actions :index, :show

  def ajax
    @posts ||= Post.recent.page params[:page]
    render :ajax
  end

  protected
  def collection
    add_crumb(I18n.t("controller.posts"), posts_path)
    @posts ||= end_of_association_chain.recent.page params[:page]
  end

  private
  def posts_layout
    case action_name
    when 'ajax'
      nil
    when 'show'
      'application'
    else
      'span12'
    end
  end
end
