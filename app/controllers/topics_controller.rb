class TopicsController < InheritedResources::Base
  before_filter :authenticate_user!, only: [:new, :create]
  before_filter :authenticate_admin!, only: [:edit, :update, :destroy]
  belongs_to :node, optional: true
  add_crumb(I18n.t("controller.sections")) { |instance| instance.send :sections_path }

  def create
    @topic = current_user.topics.new(params[:topic])
    create!
  end

  def show
    show! do
      add_crumb(@topic.node.name, node_path(@topic.node)) if @topic.node
      add_crumb(@topic.title, topic_path(@topic))
      Topic.update_counters @topic.id, visits: 1
      @replies = @topic.replies
    end
  end

  protected
  def collection
    @topics ||= end_of_association_chain.last_actived.fields_for_list.page params[:page]
  end
end
