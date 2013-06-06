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
  scope :day, where(:created_at.gte => Time.new.beginning_of_day)
  scope :yesterday, where(:created_at.lt => Time.new.beginning_of_day, :created_at.gte => 1.day.ago.beginning_of_day)
  scope :month, where(:created_at.gte => Time.new.beginning_of_month)
  scope :year, where(:created_at.gte => Time.new.beginning_of_year)

  before_validation :valid_commodity, :valid_reserve, on: :create
  before_create :give_trader

  after_create :minus_reserve

  attr_accessible :price, :quantity, :total, :plus, :commodity_id

  def valid_commodity
    self.errors.add(:price, :not_yours) unless self.user and self.user.commodities.where(_id: commodity_id).first
  end

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
