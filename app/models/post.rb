class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::TaggableOn
  taggable_on :categories
  field :content, type: String
  field :price, type: Money

  belongs_to :user
  mount_uploader :image, PictureUploader

  attr_accessible :content, :price, :image
  validates :image, presence: true
  scope :recent,desc(:created_at)
end
