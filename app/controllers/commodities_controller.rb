class CommoditiesController < InheritedResources::Base

  actions :index, :show
  respond_to :json
  belongs_to :group, optional: true
  belongs_to :trader, optional: true


  def index
    index! do |f|
      f.html{
        if @trader
          add_crumb(I18n.t("controller.traders"),trader_path(@trader))
          add_crumb(@trader.to_s, trader_path(@trader))
        end
      add_crumb(I18n.t("controller.commodities"), commodities_path)
      #add_crumb(:commodity) { [:group, :commodity] }
      }
      f.json{
        render json: @commodities
      }
    end
  end

  def show
    show! do 
      add_crumb(I18n.t("controller.commodities"), commodities_path)
      add_crumb @commodity.to_s
    end
  end

  protected
  def collection
    @commodities ||= end_of_association_chain.opening.recent.page params[:page]
  end
end
