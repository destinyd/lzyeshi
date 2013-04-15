class Trader::TradersController < InheritedResources::Base
  defaults :singleton => true 
  actions :create, :update

  def index
    @trader = current_user.trader ? current_user.trader : current_user.build_trader
  end

  def create
    create!{dashboard_path}
  end

  def update
    update!{dashboard_path}
  end

  protected
  def begin_of_association_chain
    current_user
  end
end
