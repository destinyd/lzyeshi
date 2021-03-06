class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::TaggableOn
  taggable_on :tags
  field :title, type: String
  field :content, type: String
  field :status, type: String, default: 'padding' #padding,published,trash, top?
  field :published_at, type: Time
  attr_accessible :title, :content, :status, :published_at, :tag_list

  scope :recent, desc(:published_at)

  validates :title, presence: true, length: 2..64
  validates :content, presence: true

  has_many :comments, as: :commentable

  after_save :publish, :if => [:changed?,:published?]

  def published?
    self.status == 'published'
  end

  def publish
    unless published_at
      update_attributes published_at: Time.now, status: 'published'
    end
  end

  def to_s
    title
  end

  def self.tags
    all.map(&:tags).flatten.uniq
  end

  def self.tag(tag_name)
    Article.tagged_with_on(:tags, tag_name)
  end
end
