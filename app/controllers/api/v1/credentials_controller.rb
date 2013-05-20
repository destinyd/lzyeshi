module Api::V1
  class CredentialsController < ApiController
    doorkeeper_for :all
    respond_to :json

    def me
      respond_with current_resource_owner
    end

    def dashboard
      @business_hour = current_resource_owner.business_hours.recent.first
      @isOpen = (@business_hour and !@business_hour.closed_at) ? true : false
      render json: {
        isOpen: @isOpen,
        #income_yesterday: current_resource_owner.bills.yesterday.sum(&:total).to_f,
        income_today: current_resource_owner.bills.day.sum(&:total).to_f,
        income_month: current_resource_owner.bills.month.sum(&:total).to_f
      }
    end
  end
end
