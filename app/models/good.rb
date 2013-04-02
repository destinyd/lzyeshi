class Good
  include Mongoid::Document
  field :quantity, type: Integer

  validates :quantity, presence: true

  belongs_to :order
  belongs_to :commodity

  attr_accessible :quantity, :commodity_id, :commodity
end
