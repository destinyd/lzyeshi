module Api::V1
  class NotificationsController < ApiController
    doorkeeper_for :all
    respond_to :json

    def index
      @notifications = current_resource_owner.notifications.oread.recent.page params[:page]
      render json: @notifications.to_json
    end

    def show
      @notification = current_resource_owner.notifications.find(params[:id])
      @notification.read!
      render json: @notification.to_json
    end

    def status
      render json: {count: current_resource_owner.notifications.unread.count,last: current_resource_owner.notifications.unread.last}.to_json
    end

    def accept
      @notification = current_resource_owner.notifications.find(params[:id])
      if @notification.accept!
        render json: @notification.to_json
      else
        render json: @notification.errors, :status=>422
      end
    end

    def deny
      @notification = current_resource_owner.notifications.find(params[:id])
      if @notification.deny!
        render json: @notification.to_json
      else
        render json: @notification.errors, :status=>422
      end
    end
  end
end
