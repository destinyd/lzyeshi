class User::ChatMessagesController < ApplicationController
  layout 'user'
  before_filter :authenticate_user!
  #add_crumb(I18n.t("controller.chat_messages")) { |instance| instance.send :chat_messages_path }

  def new
    if !params[:commodity_id].blank?
      @parent = Commodity.find(params[:commodity_id])
    end
    @chat_message = ChatMessage.new params[:chat_message]
    @chat_message.name = params[:name] unless params[:name].blank?
    @chat_message.chatable = @parent if @parent
  end

  def create
    if !params[:commodity_id].blank?
      @parent = Commodity.find(params[:commodity_id])
    end
    @chat_message = current_user.chat_messages.new params[:chat_message]
    @chat_message.chatable = @parent
    if @chat_message.save
      redirect_to got_chat_messages_path
    else
      render :new
    end
  end


end
