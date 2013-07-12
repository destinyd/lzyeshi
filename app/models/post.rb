require 'carrierwave/processing/mini_magick'
class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::TaggableOn
  taggable_on :categories
  field :content, type: String
  field :price, type: Money
  field :height, type: Integer

  has_one :picture, as: :pictureable

  belongs_to :user
  scope :recent,desc(:created_at)

  attr_accessible :content, :price, :picture_attributes
  accepts_nested_attributes_for :picture

  after_create :generate_height

  after_initialize do
    self.build_picture if self.picture.blank?
  end

  protected
  def generate_height
    image = MiniMagick::Image.open(self.picture.image.pin.path)
    self.height = image[:height]
    self.save
  end
end
