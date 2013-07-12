class User::PostsController < InheritedResources::Base
  before_filter :authenticate_user!
  layout :posts_layout
  actions :index, :destroy, :new, :create

  def create
    create!{posts_path}
  end

  def ajax
    collection
    render :ajax
  end


  protected
  def begin_of_association_chain
    current_user
  end

  def collection
    @posts ||= end_of_association_chain.recent.page params[:cpage]
  end

  private
  def posts_layout
    case action_name
    when 'ajax'
      nil
    else
      'user'
    end
  end
end
