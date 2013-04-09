class Location
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :lat, type: Float
  field :lng, type: Float
  belongs_to :trader
  validates :lat, presence: true
  validates :lng, presence: true

  default_scope desc(:created_at)
end
