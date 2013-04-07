class Location
  include Mongoid::Document
  field :lat, type: Float
  field :lng, type: Float
  belongs_to :trader
end
