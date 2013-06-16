class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, type: String
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  attr_accessible :content

  scope :recent, desc(:created_at)

  validates :content, length: 1..300
end
