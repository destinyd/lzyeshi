class Bill
  include Mongoid::Document
  include Mongoid::Timestamps
  field :price, type: Money
  field :quantity, type: Integer
  field :total, type: Money
  field :plus, type: String, default: ''
  belongs_to :user
  belongs_to :trader
  belongs_to :commodity

  validates :quantity, presence: true
  validates :price, presence: true
  validates :total, presence: true
  validates :commodity_id, presence: true

  scope :recent, desc(:created_at)

  before_validation :valid_reserve
  before_create :give_trader

  after_create :minus_reserve

  def valid_reserve
    unless self.commodity.reserve >= self.quantity
      self.errors.add(:quantity, :reserve_not_enough)
    end
  end

  def give_trader
    self.trader = self.try(:user).try(:trader)
  end

  def minus_reserve
    self.commodity.update_attribute :reserve, self.commodity.reserve - self.quantity
  end
end
