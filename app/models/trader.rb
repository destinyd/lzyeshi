class Trader
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :address, type: String
  field :commodities_count, type: Integer, default: 0
  validates :name, presence: true, uniqueness: true, length: 2..16

  has_many :groups
  has_many :commodities
  has_many :pictures
  has_many :locations
  has_many :business_hours
  has_many :contacts,class_name: 'Contact::Base'#, as: :contactable
  has_many :bills
  #has_many :contacts, as: :contactable,class_name: 'Contact::Base'
  #embeds_many :contacts, :class_name => 'Contact::Base'

  belongs_to :user
  #embedded_in :user

  attr_accessible :name,:address

  scope :recent, desc(:created_at)
  scope :available,where(:commodities_count.gt => 0)

  def to_s
    self.name.to_s
  end

  def user_name
    user.try(:name)
  end

  def as_json(options={})
    options[:methods] ||= [:user_name]
    super(options)
  end


  after_create do 
    self.user.add_role :trader
    self.user.save
    self.user.groups.create name: "#{self.user.name}的默认分组", category_list: '夜市'
  end
end
