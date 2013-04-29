# coding: utf-8
class ChatMessage
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :content, type: String
  field :read_at, type: Time
  field :delete_at, type: Time
  belongs_to :user, inverse_of: :chat_messages
  belongs_to :to, class_name: 'User', inverse_of: :got_chat_messages
  belongs_to :chatable, polymorphic: true
  attr_accessor :name, :chat_message_id, :commodity_id
  validates :content, presence: true, length: 5..100
  validates :name, presence: true

  has_many :chat_messages, as: :chatable

  scope :unread, where(read_at: nil)
  scope :undelete, where(delete_at: nil)
  scope :recent, desc(:created_at)
  scope :ounread, order_by(:read_at => 0)

  def read
    update_attribute :read_at, Time.now unless self.read_at
  end

  def is_read?
    !!read_at
  end

  def to_s
    self.content.to_s
  end

  def is_delete?
    !!delete_at
  end

  def destroy
    update_attribute :delete_at, Time.now unless self.delete_at
  end

  before_validation :find_to, :find_chatable
  after_create :notify

  protected
  def find_to
    if !self.name.blank?
      self.to = User.where(name: self.name).first
      self.errors.add :name, '找不到此用户' if self.to.blank?
    end
  end

  def find_chatable
    if !chat_message_id.blank?
      self.chatable = ChatMessage.find(chat_message_id)
    elsif !commodity_id.blank?
      self.chatable = Commodity.find(chat_message_id)
    end
  end

  def notify
    #notification = self.to.notifications.create!({
      #from: self.user,
      #chat_message: self,
      #text: self.content,
    #},
    #Notification::Chat)

    channel = "/n/#{self.to.name}"
    hash = {
      #'notification_id'  => notification.id.to_s,
      'chat_message_id' => self.id.to_s,
      'count' => self.to.notifications.count,
      #'content' => notification.to_s,
      #'_type' => notification._type
    }
    #message = {channel: channel, data: hash}
    #uri = URI.parse(ENV['FAYE'])
    #Net::HTTP.post_form(uri, message: message.to_json)

    client = Faye::Client.new(ENV['FAYE'])
    client.publish(channel, hash)
    client
  end
end
