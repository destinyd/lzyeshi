class BusinessHour
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :opened_at, type: Time
  field :closed_at, type: Time

  belongs_to :user
  belongs_to :trader

  attr_accessor :close
  attr_accessible :opened_at, :closed_at

  scope :recent, desc(:created_at)

  def close!
    update_attribute :closed_at, Time.now if self.closed_at.blank?
  end

  def open!
    self.opened_at = Time.now
  end

  before_create :open!, :give_trader

  def give_trader
    self.trader = self.try(:user).try(:trader)
  end

end
