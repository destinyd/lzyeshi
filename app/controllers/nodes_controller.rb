class NodesController < InheritedResources::Base
  before_filter :authenticate_user!, except: [:index, :show]

  def show
    show! do
      @topics = @node.topics.last_actived.fields_for_list.page(params[:page])
    end
  end
end
