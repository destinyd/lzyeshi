class Trader::BillsController < InheritedResources::Base
  layout 'trader'
  actions :all, except: [:show]
  respond_to :json
  belongs_to :commodity, optional: true
  load_and_authorize_resource :commodity
  load_and_authorize_resource :bill, through: :commodity, except: :index

  def create
    create!{commodity_bills_path(@bill.commodity_id)}
  end

  def update
    update!{commodity_bills_path(@bill.commodity_id)}
  end

  def destroy
    destroy!{commodity_bills_path(@bill.commodity_id)}
  end

  def dashboard
    @day_bills = current_user.bills.day
    @yesterday_bills = current_user.bills.yesterday
    @month_bills = current_user.bills.month
    @year_bills = current_user.bills.year
  end

  protected
  def begin_of_association_chain
    current_user
  end

  def collection
    @bills ||= end_of_association_chain.accessible_by(current_ability).recent.page params[:page]
  end
end
