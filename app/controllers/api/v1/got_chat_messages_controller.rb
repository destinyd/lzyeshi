module Api::V1
  class GotChatMessagesController < ApiController
    doorkeeper_for :all
    respond_to :json

    def index
      @got_chat_messages = current_resource_owner.got_chat_messages.s_index.page params[:page]
      respond_with @got_chat_messages
    end

    def show
      @got_chat_message = current_resource_owner.got_chat_messages.undelete.find params[:id]
      @got_chat_message.read
      respond_with @got_chat_message
    end

    def destroy
      @got_chat_message = current_resource_owner.got_chat_messages.undelete.find params[:id]
      @got_chat_message.destroy
      respond_with @got_chat_message
    end
  end
end
