class NodesController < InheritedResources::Base
  before_filter :authenticate_admin!, except: [:show]

  def show
    show! do
      @topics = @node.topics.last_actived.fields_for_list.page(params[:page])
    end
  end

  protected
  def collection
    @nodes ||= end_of_association_chain.sort
  end
end
