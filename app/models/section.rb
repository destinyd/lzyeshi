class Section
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::BaseModel
  field :name, type: String
  field :sort, type: Integer, default: 0

  has_many :nodes, :dependent => :destroy

  validates_presence_of :name
  validates_uniqueness_of :name

  default_scope desc(:sort)

  def sorted_nodes
    self.nodes.sorted
  end
end
