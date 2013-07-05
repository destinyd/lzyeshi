class Mp
  attr_accessor :args, :result
  def initialize(params)
    valid_mp
    MpContent.create params[:xml]
    @args = params
  end

  def get
    xml = @args[:xml]
    @result = {xml: {ToUserName: xml[:FromUserName], FromUserName: xml[:ToUserName], CreateTime: Time.now.to_i,  FuncFlag: 0}}
    case xml[:MsgType]
    when 'text'
      case xml[:Content]
      when /^主页/
        @result[:xml][:ArticleCount] = 1
        @result[:xml][:Articles] = {item: {
          Title: I18n.t('title'),
          Description: I18n.t('desc'),
          PicUrl: ENV['DOMAIN'] + ActionController::Base.helpers.asset_path('app.png'),
          Url: 'http://ysdev.realityandapp.com',
        }}
        @result[:xml][:MsgType] = 'news'
      when /^登录/
        @mp_user =  MpUser.where(OpenID: xml[:FromUserName]).first_or_create
        if @mp_user.user
          @result[:xml][:Content] = "您已经绑定帐号"
        else
          @result[:xml][:Content] = "您的绑定码为：#{@mp_user.shortOpenID}"
        end
        @result[:xml][:MsgType] = 'text'
      else
        @result[:xml][:Content] = I18n.t('mp.help')
        @result[:xml][:MsgType] = 'text'
      end
    end
    @result
  end

  def valid_mp
    
  end
end
