class TopicsController < InheritedResources::Base
  before_filter :authenticate_user!, only: [:create, :update, :destroy]
  def create
    @topic = current_user.topics.new(params[:topic])
    create!
  end
end
