class User
  include Mongoid::Document
  rolify
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  validates_presence_of :email
  validates_presence_of :encrypted_password
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  # run 'rake db:mongoid:create_indexes' to create indexes
  index({ email: 1 }, { unique: true, background: true })
  field :name, :type => String
  validates :name, presence: true, length: 2..16
  attr_accessor :is_trader
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :is_trader, :trader_attributes

  has_many :groups
  has_many :commodities
  has_many :pictures
  has_many :locations
  has_many :contacts,class_name: 'Contact::Base'#, as: :contactable
  has_many :chat_messages, inverse_of: :user
  has_many :got_chat_messages, class_name: 'ChatMessage', inverse_of: :to
  embeds_many :notifications, :class_name => 'Notification::Base'
  #embeds_one :trader
  has_one :trader
  #embeds_many :contacts, :class_name => 'Contact::Base'

  accepts_nested_attributes_for :trader

  after_initialize do
    self.build_trader if self.new_record? and self.trader.blank? and self.is_trader != '0'
  end

  after_create do
    self.add_role :trader if not self.is_trader.blank? and self.is_trader != '0'
    self.add_role :user
  end

  def to_s
    self.name.to_s
  end
end
