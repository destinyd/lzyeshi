class ChatMessagesController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :html, except: [:index, :new, :edit, :show]
  respond_to :js
  actions :index, :new, :create, :show
  load_and_authorize_resource :chat_messages, except: :index

  def show
    show! do |f|
      @chat_message.read
    end
  end

  protected
  def begin_of_association_chain
    current_user
  end

  def collection
    @chat_messages ||= current_user.got_chat_messages.accessible_by(current_ability)
  end
end
