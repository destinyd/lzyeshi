class Order
  include Mongoid::Document
  include Mongoid::Symbolize
  include Mongoid::Timestamps

  field :freight, type: Money
  field :total, type: Money

  symbolize :status, in: [:order, :paid, :shipments, :receiving, :cancel, :finish], default: :order

  belongs_to :user
  embeds_many :goods
end
