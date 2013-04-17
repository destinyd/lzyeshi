class TradersController < InheritedResources::Base
  actions :index,:show
  def show
    @trader = Trader.find(params[:id])
    @groups = @trader.groups#.with_commodities
  end

  protected
  def collection
    @traders ||= end_of_association_chain.available.page params[:page]
  end
end
