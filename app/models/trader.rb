class Trader
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :name, type: String
  field :address, type: String
  validates :name, presence: true, uniqueness: true

  belongs_to :user
  #embedded_in :user

  attr_accessible :name,:address
  after_create do 
    self.user.save
  end
end
