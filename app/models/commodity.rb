class Commodity
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::TaggableOn
  taggable_on :categories

  field :name, type: String
  field :price, type: Money
  field :reserve, type: Integer
  field :text, type: String, default: ''
  validates :name, presence: true
  validates :price, presence: true
  validates :reserve, presence: true

  #mount_uploader :picture, PictureUploader

  attr_accessible :name, :price, :reserve, :text, :picture, :picture_id, :category_list

  #has_many :goods
  has_one :picture
  belongs_to :group

  scope :opening, where(:reserve.gt => 0)
  scope :with_pic, includes(:picture)

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
end
