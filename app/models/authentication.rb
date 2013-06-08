class Authentication
  include Mongoid::Document
  include Mongoid::Timestamps
  field :provider, type: String
  field :uid, type: String
  field :uname, type: String
  field :access_token, type: String

  belongs_to :user

  validates :provider, :uid, :access_token, presence: true
  validates :provider, uniqueness: { scope: :user_id }

  attr_accessible :user_id, :provider, :uid, :access_token, :uname

  def self.create_from_hash(user_id, omniauth)
    self.create!(
      user_id:      user_id,
      provider: omniauth.info.media_type,
      uid: omniauth.info.media_uid,
      uname: omniauth.info.name,
      access_token: omniauth.credentials.token
    )
  end

end
