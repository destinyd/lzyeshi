class NodesController < InheritedResources::Base
  before_filter :authenticate_admin!, except: [:show]
  add_crumb(I18n.t("controller.sections")) { |instance| instance.send :sections_path }

  def show
    show! do
      add_crumb(@node.name, node_path(@node))
      @topics = @node.topics.last_actived.fields_for_list.page(params[:page])
    end
  end

  protected
  def collection
    @nodes ||= end_of_association_chain.sort
  end
end
