class Ad
  TYPES = {:home_top => 0, :home => 11, :sidebar => 21}
  include Mongoid::Document
  include Mongoid::Timestamps
  field :url, type: String
  field :content, type: String
  field :type, type: Integer, default: 0
  field :finished_at, type: Date
  mount_uploader :image, AdUploader
  attr_accessible :url, :content, :type, :image, :finished_at

  scope :home_top, where(type: 0)
  scope :home, where(type: 11)
  scope :sidebar, where(type: 21)

  scope :running, any_of({:finished_at.lt => Time.now}, {finished_at: nil})

  def self.types
    TYPES
  end
end
