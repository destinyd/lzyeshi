class Notification::Chat < Notification::Base
  belongs_to :from, :class_name => 'User',inverse_of: nil
  belongs_to :chat_message, :class_name => 'ChatMessage',inverse_of: nil
end

