class Commodity
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::TaggableOn
  paginates_per 30
  taggable_on :categories

  field :name, type: String
  field :price, type: Money
  field :reserve, type: Integer
  field :text, type: String, default: ''
  belongs_to :group
  belongs_to :user
  belongs_to :trader

  has_one :picture

  has_many :chat_messages, as: :chatable
  has_many :bills

  validates :name, presence: true, length: 3..64
  validates :price, presence: true
  validates :reserve, presence: true

  #mount_uploader :picture, PictureUploader
  accepts_nested_attributes_for :picture

  attr_accessible :name, :price, :reserve, :text, :picture, :picture_id, :category_list, :picture_attributes

  #has_many :goods

  scope :recent, desc(:created_at)
  scope :opening, where(:reserve.gt => 0)
  scope :with_pic, includes(:picture)
  scope :with_group, includes(:group)


  after_initialize do
    self.build_picture if self.picture.blank?
  end

  def humanize_price
    price.to_s
  end

  def to_s
    self.name.to_s
  end

  def as_json(options={})
    options[:except] ||= [:categories, :text, :price, :updated_at, :created_at, :group_id, :commodity_id]
    options[:methods] ||= [:humanize_price]
    options[:include] ||= [:picture]
    super(options)
  end

  before_create :give_trader

  def give_trader
    self.user = self.try(:group).try(:user)
    self.trader = self.try(:user).try(:trader)
  end

  after_create :update_group_count, :update_trader_count

  after_destroy :update_group_count, :update_trader_count

  def update_group_count
    self.group.update_attribute :commodities_count, self.group.commodities.count
  end

  def update_trader_count
    self.trader.update_attribute :commodities_count, self.trader.commodities.count
  end
end
