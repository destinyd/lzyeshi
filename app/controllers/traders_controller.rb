class TradersController < InheritedResources::Base
  actions :index, :show, :create
  respond_to :json, only: [:show]

  add_crumb(I18n.t("controller.traders")) { |instance| instance.send :traders_path }

  def show
    show! do 
      add_crumb @trader.to_s
    end
  end

  def contact
    @trader = Trader.find(params[:id])
    @contacts = @trader.contacts
    add_crumb @trader.to_s, trader_path(@trader)
    add_crumb(I18n.t("action.traders.contact")) { |instance| instance.send :contact_path }
  end

  def create
    @trader = current_user.build_trader(params[:trader])
    create!
  end

  protected
  def collection
    @traders ||= end_of_association_chain.available.page params[:page]
  end
end
