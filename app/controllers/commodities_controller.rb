class CommoditiesController < InheritedResources::Base

  actions :index, :show
  respond_to :json
  belongs_to :group, optional: true
  belongs_to :trader, optional: true
  before_filter :categories_crumb, only: :categories
  before_filter :category_crumb, only: :category
  caches_action :categories, :layout => false, :expires_in => 3.hours
  caches_action :category, :layout => false, :expires_in => 3.hours

  def show
    show! do 
      add_crumb(I18n.t("controller.commodities"), commodities_path)
      add_crumb @commodity.to_s
    end
  end

  def categories
    @categories = Commodity.categories
  end

  def category
    @commodities = Commodity.category(params[:category]).page(params[:page])
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

  def categories_crumb
    add_crumb(I18n.t("action.commodities.categories"), categories_path)
  end

  def category_crumb
    add_crumb(I18n.t("action.commodities.category", category: params[:category]), category_path(params[:category]))
  end
end
