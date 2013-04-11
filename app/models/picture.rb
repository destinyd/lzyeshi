class Picture
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Rails.application.routes.url_helpers

  mount_uploader :image, PictureUploader
  belongs_to :user
  belongs_to :group
  belongs_to :commodity
  attr_accessible :image, :image_cache

  scope :recent,desc(:created_at)
end
