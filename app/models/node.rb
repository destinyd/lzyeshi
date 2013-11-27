class Node
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::BaseModel
  field :name, type: String
  field :summary, type: String
  field :sort, type: Integer, default: 0

  has_many :topics
  belongs_to :section

  index :section_id => 1

  validates_presence_of :name, :summary, :section
  validates_uniqueness_of :name

  has_and_belongs_to_many :followers, :class_name => 'User', :inverse_of => :following_nodes

  #scope :hots, desc(:topics_count)
  scope :sorted, desc(:sort)
end
