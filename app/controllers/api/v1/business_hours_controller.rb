module Api::V1
  class BusinessHoursController < ApiController
    doorkeeper_for :all
    respond_to :json

    def create
      if params[:business_hour] and params[:business_hour][:close] == "1"
        @business_hour = current_resource_owner.business_hours.last
        if @business_hour.close!

          render json: {
            isOpen: false,
            #income_yesterday: current_resource_owner.bills.yesterday.sum(&:total).to_f,
            income_today: current_resource_owner.bills.day.sum(&:total).to_f,
            income_month: current_resource_owner.bills.month.sum(&:total).to_f
          }
        else
          render json: @business_hour.errors, status: 422
        end
      else
        @business_hour = current_resource_owner.business_hours.new params[:business_hour]
        if @business_hour.save
          render json: {
            isOpen: true,
            #income_yesterday: current_resource_owner.bills.yesterday.sum(&:total).to_f,
            income_today: current_resource_owner.bills.day.sum(&:total).to_f,
            income_month: current_resource_owner.bills.month.sum(&:total).to_f
          }
        else
          render json: @business_hour.errors, status: 422
        end
      end
    end

  end
end
