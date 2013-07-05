class MpContent
  include Mongoid::Document
  include Mongoid::Timestamps
  field :ToUserName, type: String
  field :FromUserName, type: String
  field :CreateTime, type: String
  field :MsgType, type: String
  field :Content, type: String
  field :MsgId, type: String
  field :PicUrl, type: String
  field :Location_X, type: String
  field :Location_Y, type: String
  field :Scale, type: String
  field :Label, type: String
  field :Title, type: String
  field :Description, type: String
  field :Url, type: String
  field :Event, type: String
  field :EventKey, type: String

  scope :recent, desc(:created_at)
  scope :not_user, lambda{|user_name| not_in(FromUserName: user_name)}
end
