class Share
  attr_accessor :user, :baidu_social
  def initialize(args)
    @user = args[:user]
    @baidu_social = BaiduSocial.new
  end

  def share_batch(args)
    @baidu_social.share_batch access_tokens, args[:content], args[:url], args[:pic_url]
  end

  def access_tokens
    @access_tokens ||= @user.authentications.must_shares.map(&:access_token)
  end
end
