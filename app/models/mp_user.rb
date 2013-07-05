class MpUser
  SHORT_START_LENGTH = -6
  SHORT_TO_LENGTH = -1
  include Mongoid::Document
  include Mongoid::Timestamps
  field :OpenID, type: String
  field :shortOpenID, type: String
  validates :OpenID, presence: true, uniqueness: true
  #validates :shortOpenID, presence: true, uniqueness: true
  belongs_to :user

  before_create do 
    short_start_length = SHORT_START_LENGTH
    begin
      self.shortOpenID = self.OpenID[short_start_length..SHORT_TO_LENGTH]
      @user = MpUser.where(shortOpenID: self.shortOpenID).first
      short_start_length -= 1
    end while @user
  end

end
