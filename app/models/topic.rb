# coding: utf-8
require "auto-space"
class Topic
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::BaseModel
  #include Mongoid::MarkdownBody
  #include Mongoid::CounterCache
  #include Mongoid::MagicCounterCache
  field :title, type: String
  field :body, type: String
  #field :body_html
  field :replied_at, type: DateTime
  field :excellent, type: Boolean, default: false
  field :last_active_mark, type: Integer

  # 回复过的人的 ids 列表
  field :follower_ids, :type => Array, :default => []

  belongs_to :user, :inverse_of => :topics, counter_cache: true
  #counter_cache :name => :user, :inverse_of => :topics
  belongs_to :node, counter_cache: true
  #counter_cache :name => :node, :inverse_of => :topics
  #counter_cache :user
  #counter_cache :node
  belongs_to :last_reply_user, :class_name => 'User'
  belongs_to :last_reply, :class_name => 'Reply'
  has_many :replies, :dependent => :destroy

  validates_presence_of :user_id, :title, :body, :node_id

  index :node_id => 1
  index :user_id => 1
  index :last_active_mark => -1
  #index :likes_count => 1
  #index :suggested_at => 1
  index :excellent => -1

  #counter :hits, :default => 0

  delegate :login, :to => :user, :prefix => true, :allow_nil => true
  delegate :body, :to => :last_reply, :prefix => true, :allow_nil => true

  # scopes
  scope :last_actived, desc(:last_active_mark)
  # 推荐的话题
  #scope :suggest, -> { where(:suggested_at.ne => nil).desc(:suggested_at) }
  scope :fields_for_list, -> { without(:body)}#,:body_html) }
  #scope :high_likes, -> { desc(:likes_count, :_id) }
  scope :high_replies, -> { desc(:replies_count, :_id) }
  scope :no_reply, -> { where(:replies_count => 0) }
  #scope :popular, -> { where(:likes_count.gt => 5) }
  scope :without_node_ids, Proc.new { |ids| where(:node_id.nin => ids) }
  scope :excellent, -> { where(:excellent.gte => 1) }

  before_save :auto_space_with_title
  def auto_space_with_title
    self.title.auto_space!
  end

  before_create :init_last_active_mark_on_create
  def init_last_active_mark_on_create
    self.last_active_mark = Time.now.to_i
  end

  def push_follower(uid)
    return false if uid == self.user_id
    return false if self.follower_ids.include?(uid)
    self.push(follower_ids: uid)
  end

  def pull_follower(uid)
    return false if uid == self.user_id
    self.pull(follower_ids: uid)
  end

  def update_last_reply(reply)
    # replied_at 用于最新回复的排序，如果贴着创建时间在一个月以前，就不再往前面顶了
    self.last_active_mark = Time.now.to_i if self.created_at > 1.month.ago
    self.replied_at = Time.now
    self.last_reply_id = reply.id 
    self.last_reply_user_id = reply.user_id
    self.last_reply_user_login = reply.user.try(:login) || nil
    self.save
  end

  def excellent?
    !!self.excellent
  end
end
