module Api::V1
  class ChatMessagesController < ApiController
    doorkeeper_for :all
    respond_to :json

    def create
      @chat_message = current_resource_owner.chat_messages.create params[:chat_message].merge(commodity_id: params[:commodity_id])
      if @chat_message.valid?
        respond_with @chat_message
      else
        render :json=> @chat_message.errors, :status=>422
      end
    end
  end
end
