class Commodity
  include Mongoid::Document
  field :name, type: String
  field :price, type: Money
  field :reserve, type: Integer
  validates :name, presence: true
  validates :price, presence: true
  validates :reserve, presence: true
end
