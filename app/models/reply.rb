# coding: utf-8
class Reply
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::BaseModel
  #include Mongoid::MarkdownBody
  #include Mongoid::CounterCache
  #include Mongoid::MagicCounterCache
  field :body, type: String
  #field :body_html, type: String

  belongs_to :user, :inverse_of => :replies, counter_cache: true
  belongs_to :topic, :inverse_of => :replies, touch: true, counter_cache: true

  #counter_cache :user, counter_cache: true
  #counter_cache :topic, counter_cache: true
  #counter_cache :name => :user, :inverse_of => :replies
  #counter_cache :name => :topic, :inverse_of => :replies

  index :user_id => 1
  index :topic_id => 1

  delegate :title, :to => :topic, :prefix => true, :allow_nil => true
  delegate :login, :to => :user, :prefix => true, :allow_nil => true

  validates_presence_of :body
  validates_uniqueness_of :body, :scope => [:topic_id, :user_id], :message => "不能重复提交。"
end
