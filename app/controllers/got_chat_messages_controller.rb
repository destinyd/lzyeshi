class GotChatMessagesController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :html, except: [:edit, :update]
  respond_to :json
  actions :index, :show, :destroy
  add_crumb(I18n.t("controller.chat_messages")) { |instance| instance.send :got_chat_messages_path }

  def index
    @got_chat_messages = current_user.got_chat_messages.s_index.page params[:page]
    index!
  end

  def show
    @got_chat_message = current_user.got_chat_messages.undelete.find params[:id]
    show! do
      @got_chat_message.read
      add_crumb("来自#{@got_chat_message.user}的消息")
    end
  end

  def destroy
    @got_chat_message = current_user.got_chat_messages.undelete.find params[:id]
    destroy!
  end

  #protected
  #def begin_of_association_chain
    #current_user
  #end

  #def collection
    #@got_chat_messages ||= current_user.got_chat_messages.undelete.page params[:page]
  #end
end
