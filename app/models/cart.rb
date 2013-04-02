class Cart
  include Mongoid::Document
  field :quantity, type: Integer

  validates :quantity, presence: true

  belongs_to :user
  belongs_to :commodity

  attr_accessible :quantity,:commodity_id
end
