class Picture
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Rails.application.routes.url_helpers

  mount_uploader :image, PictureUploader
  belongs_to :user
  belongs_to :trader
  belongs_to :group
  belongs_to :commodity
  belongs_to :pictureable, polymorphic: true
  attr_accessible :image, :image_cache

  validates :image, presence: true

  scope :recent,desc(:created_at)

  before_create do 
    self.user = self.pictureable.try(:user) if self.user_id.blank?
    self.trader = self.try(:user).try(:trader)
  end
end
