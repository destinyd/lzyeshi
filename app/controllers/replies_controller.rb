class RepliesController < InheritedResources::Base
  before_filter :authenticate_user!
  def create
    create! do |success, failure|
      success.html{
        @reply.user = current_user
        @reply.save
        redirect_to @topic
      }
    end
  end

  protected
  def begin_of_association_chain
    current_user
  end
end
