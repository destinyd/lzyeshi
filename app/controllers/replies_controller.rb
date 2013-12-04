class RepliesController < InheritedResources::Base
  actions :show, :create, :edit, :update, :destroy
  before_filter :authenticate_user!
  before_filter :authenticate_admin!, only: [:edit, :update, :destroy]
  def create
    @reply = current_user.replies.new(params[:reply])
    @reply.topic_id = params[:topic_id]
    create!{ topic_path(@reply.topic)}
  end
end
