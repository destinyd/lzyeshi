class Location
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :lat, type: Float
  field :lng, type: Float
  belongs_to :user
  belongs_to :trader
  validates :lat, presence: true
  validates :lng, presence: true

  scope :recent,desc(:created_at)
  default_scope desc(:created_at)

  before_create :give_trader

  def give_trader
    self.trader = self.try(:user).try(:trader)
  end
end
