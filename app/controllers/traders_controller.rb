class TradersController < InheritedResources::Base
  actions :index, :show

  def contact
    @trader = Trader.find(params[:id])
    @contacts = @trader.contacts
  end

  protected
  def collection
    @traders ||= end_of_association_chain.available.page params[:page]
  end
end
