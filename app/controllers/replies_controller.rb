class RepliesController < InheritedResources::Base
  before_filter :authenticate_user!
  belongs_to :topic
  def create
    create! do |success, failure|
      success.html{
        @reply.user = current_user
        @reply.save
        redirect_to @topic
      }
    end
  end
end
