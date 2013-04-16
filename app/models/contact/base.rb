class Contact::Base
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :value, type: String

  belongs_to :contactable, polymorphic: true
  #embedded_in :user, :inverse_of => :

  validates :name, presence: true

  scope :system,where(contactable: nil)
end
