module Api::V1
  class BillsController < ApiController
    doorkeeper_for :all
    respond_to :json

    def create
      @commodity = current_resource_owner.commodities.find(params[:commodity_id])
      if @commodity
        @bill = current_resource_owner.bills.new(params[:bill])
        @bill.commodity = @commodity
        if @bill.save
          render json: @bill
        else 
          render json: @bill.errors, status: 422
        end
      else
        render status: 422
      end
    end

    #def update
      #update!{commodity_bills_path(@bill.commodity_id)}
    #end

    #def destroy
      #destroy!{commodity_bills_path(@bill.commodity_id)}
    #end

    def dashboard
      render json: {
        isOpen: @isOpen,
        income_yesterday: current_resource_owner.bills.yesterday.sum(&:total).to_f,
        income_today: current_resource_owner.bills.day.sum(&:total).to_f,
        income_month: current_resource_owner.bills.month.sum(&:total).to_f,
        income_year: current_resource_owner.bills.month.sum(&:total).to_f
      }
    end

    #protected
    #def begin_of_association_chain
      #current_user
    #end

    #def collection
      #@bills ||= end_of_association_chain.accessible_by(current_ability).recent.page params[:page]
    #end
  end
end
