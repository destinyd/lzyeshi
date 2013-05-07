class GroupsController < InheritedResources::Base
  respond_to :json
  belongs_to :trader, optional: true

  add_crumb(I18n.t("controller.groups")) { |instance| instance.send :groups_path }

  def show
    show! do 
      add_crumb @group.to_s
    end
  end

  protected
  def collection
    @groups ||= end_of_association_chain.available.page params[:page]
  end
end
