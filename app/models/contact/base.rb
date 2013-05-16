# encoding: utf-8
class Contact::Base
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :value, type: String

  belongs_to :user
  belongs_to :trader
  #belongs_to :contactable, polymorphic: true
  #embedded_in :user, :inverse_of => :

  validates :name, presence: true
  validates :value, presence: true
  attr_accessor :_type
  attr_accessible :name, :value, :_type

  scope :own, where(user: nil, trader: nil)

  #include Mongoid::Symbolize
  #symbolize :_type, in: [:'Contact::Base', :'Contact::Link', :'Contact::Picture']

  def self.types
    {
      '文本' => 'Contact::Base',
      '链接' => 'Contact::Link',
      '图片' => 'Contact::Picture'
    }
  end

  protected
  before_create :give_trader

  def give_trader
    self.trader = self.try(:user).try(:trader)
  end
end
