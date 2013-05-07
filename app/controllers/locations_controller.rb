class LocationsController < InheritedResources::Base
  actions :index
  respond_to :json
  respond_to :js
  belongs_to :trader, optional: true


  def index
    index! do
      if @trader
        add_crumb(I18n.t("controller.traders"),trader_path(@trader))
        add_crumb(@trader.to_s, trader_path(@trader))
      end
      add_crumb(I18n.t("controller.locations")) { |instance| instance.send :locations_path }
    end
  end

  protected
  def collection
    @locations ||= end_of_association_chain.recent.page params[:page]
  end
end
