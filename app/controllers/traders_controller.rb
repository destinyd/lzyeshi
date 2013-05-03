class TradersController < InheritedResources::Base
  actions :index, :show, :create

  def contact
    @trader = Trader.find(params[:id])
    @contacts = @trader.contacts
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
