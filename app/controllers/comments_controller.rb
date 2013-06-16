class CommentsController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :js
  belongs_to :commodity, optional: true
  belongs_to :group, optional: true
  actions :index, :create

  def create
    create! do |s,f|
      s.js{
        @comment.user = current_user
        @comment.save
      }
    end
  end

  protected
  def collection
    @comments ||= end_of_association_chain.recent.page params[:cpage]
  end
end
