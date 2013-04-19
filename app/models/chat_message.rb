class ChatMessage
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :content, type: String
  field :read_at, type: Time
  belongs_to :user
  belongs_to :to, class_name: 'User', inverse_of: :got_chat_messages
  belongs_to :chatable, polymorphic: true
  attr_accessor :name
  validates :content, presence: true
  before_create :find_to

  scope :not_read, where(read_at: nil)

  def read
    update_attribute :read_at, Time.now unless self.read_at
  end

  protected
  def find_to
    self.to = User.where(name: self.name).first unless self.name.blank?
  end
end
