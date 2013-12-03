class TopicsController < InheritedResources::Base
  before_filter :authenticate_user!, only: [:create, :update, :destroy]

  def create
    @topic = current_user.topics.new(params[:topic])
    create!
  end

  def show
    show! do
      Topic.update_counters @topic.id, visits: 1
      @replies = @topic.replies
    end
  end

  protected
  def collection
    @topics ||= end_of_association_chain.last_actived.fields_for_list.page params[:page]
  end
end
