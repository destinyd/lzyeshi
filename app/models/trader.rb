class Trader
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :name, type: String
  field :address, type: String
  validates :name, presence: true, uniqueness: true

  has_many :groups
  has_many :commodities
  has_many :pictures
  has_many :locations
  has_many :contacts, as: :contactable,class_name: 'Contact::Base'
  #embeds_many :contacts, :class_name => 'Contact::Base'

  belongs_to :user
  #embedded_in :user

  attr_accessible :name,:address
  after_create do 
    self.user.save
  end
end
