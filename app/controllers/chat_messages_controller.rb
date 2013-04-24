class ChatMessagesController < ApplicationController
  before_filter :authenticate_user!
  #respond_to :html, except: [:edit, :update]
  #respond_to :js
  #actions :create, :show
  #belongs_to :commodity, :chat_message, optional: true, polymorphic: true
  #load_and_authorize_resource :commodity, except: [:show]
  #load_and_authorize_resource :chat_message, through: :commodity, except: [:index, :show]
  #skip_load_and_authorize_resource only: :index
  def index
    @chat_messages = current_user.got_chat_messages.not_delete.recent.page params[:page]
  end

  def new
    if !params[:chat_message_id].blank?
      @parent = ChatMessage.find(params[:chat_message_id])
    elsif !params[:commodity_id].blank?
      @parent = Commodity.find(params[:commodity_id])
    end
    @chat_message = ChatMessage.new params[:chat_message]
    @chat_message.name = params[:name] unless params[:name].blank?
    @chat_message.chatable = @parent if @parent
  end

  def create
    if !params[:chat_message_id].blank?
      @parent = ChatMessage.find(params[:chat_message_id])
    elsif !params[:commodity_id].blank?
      @parent = Commodity.find(params[:commodity_id])
    end
    @chat_message = current_user.chat_messages.new params[:chat_message]
    @chat_message.chatable = @parent
    if @chat_message.save
      redirect_to chat_messages_path
    else
      render :new
    end
  end

  def show
    @chat_message = ChatMessage.any_of({user_id: current_user.id}, {to_id: current_user.id}).find params[:id]
    @chat_message.read
  end

  def destroy
    current_user.got_chat_messages.find(params[:id]).destroy
    redirect_to chat_messages_path
  end

  #protected
  #def begin_of_association_chain
    #current_user
  #end

  #def collection
  #@chat_messages ||= end_of_association_chain.accessible_by(current_ability).page params[:page]
  #end
end
