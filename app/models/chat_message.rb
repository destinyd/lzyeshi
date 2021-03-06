# coding: utf-8
class ChatMessage
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :name, type: String
  field :content, type: String
  field :read_at, type: Time
  field :delete_at, type: Time
  belongs_to :user, inverse_of: :chat_messages
  belongs_to :to, class_name: 'User', inverse_of: :got_chat_messages
  belongs_to :chatable, polymorphic: true
  attr_accessor :commodity_id
  validates :content, presence: true, length: 5..100
  validates :name, presence: true

  has_many :chat_messages, as: :chatable

  scope :unread, where(read_at: nil)
  scope :undelete, where(delete_at: nil)
  scope :recent, desc(:created_at)
  scope :ounread, order_by(:read_at => 0)
  scope :nav, undelete.unread
  scope :o_index, order_by(:read_at => 0, :created_at => -1)
  scope :s_index, undelete.o_index
  default_scope includes(:user)

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

  def user_name
    self.user.to_s
  end

  def as_json(options={})
    options[:methods] ||= [:user_name]
    super(options)
  end

  before_validation :find_to, :find_chatable, on: :create
  after_create :notify

  protected
  def find_to
    if !self.name.blank?
      self.to = User.where(name: self.name).first
      self.errors.add :name, :no_this_user if self.to.blank?
      self.errors.add :name, :could_not_self if self.user_id == self.to_id
    end
  end

  def find_chatable
    if !commodity_id.blank?
      self.chatable = Commodity.find(commodity_id)
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
      'count' => self.to.got_chat_messages.nav.count,
      'name' => self.user_name,
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
