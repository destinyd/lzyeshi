class Commodity
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::TaggableOn
  taggable_on :categories

  field :name, type: String
  field :price, type: Money
  field :reserve, type: Integer
  validates :name, presence: true
  validates :price, presence: true
  validates :reserve, presence: true

  mount_uploader :picture, PictureUploader

  attr_accessible :name, :price, :reserve, :picture, :picture_cache
end
