class Commodity
  include Mongoid::Document
  include Mongoid::TaggableOn
  taggable_on :categories

  field :name, type: String
  field :price, type: Money
  field :reserve, type: Integer
  validates :name, presence: true
  validates :price, presence: true
  validates :reserve, presence: true
end
