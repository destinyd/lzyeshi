class CommoditiesController < InheritedResources::Base

  actions :index, :show
  respond_to :json
  belongs_to :group, optional: true
  belongs_to :trader, optional: true

  def show
    show! do 
      add_crumb(I18n.t("controller.commodities"), commodities_path)
      add_crumb @commodity.to_s
    end
  end

  protected
  def collection
    if parent?
      add_crumb(I18n.t("controller.traders"),trader_path(parent))
      add_crumb(parent.to_s, trader_path(parent))
    end
    add_crumb(I18n.t("controller.commodities"), commodities_path)
    @commodities ||= end_of_association_chain.opening.recent.page params[:page]
  end
end
