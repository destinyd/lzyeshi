class Mp
  include Rails.application.routes.url_helpers
  def initialize(params)
    valid_mp
    MpContent.create params[:xml]
    @args = params
    @xml = @args[:xml]
  end

  def get
    init_result
    @mp_user =  MpUser.where(OpenID: @xml[:FromUserName]).first_or_create
    if is_admin?
      admin_deal
    else
      if @mp_user.user
        if @mp_user.user.trader
          trader_deal
        else
          user_deal
        end
      else
        guest_deal
      end
    end
  end

  def valid_mp

  end

  def init_result
    @result = {xml: {ToUserName: @xml[:FromUserName], FromUserName: @xml[:ToUserName], CreateTime: Time.now.to_i,  FuncFlag: 0}}
  end

  def is_admin?
    admin_ids.include? @xml[:FromUserName]
  end

  def admin_deal
    case @xml[:MsgType]
    when 'text'
      case @xml[:Content]
      when /^主页/
        homepage
      when /^登录/
        if @mp_user.user
          is_login
        else
          login
        end
      when /^留言 ?(?<page>\d+)?/
        page = $~[:page]
        get_comments page
      when /^最新 ?(?<page>\d+)?/
        page = $~[:page]
        get_commodities page
      else
        @result[:xml][:Content] = I18n.t('mp.admin_help')
        @result[:xml][:MsgType] = 'text'
      end
    end
    @result

  end

  def trader_deal
    case @xml[:MsgType]
    when 'text'
      case @xml[:Content]
      when /^主页/
        homepage
      when /^登录/
        is_login
      when /^留言 (?<content>\d+)?/
        comment
      when /^最新 ?(?<page>\d+)?/
        page = $~[:page]
        get_commodities page
      else
        @result[:xml][:Content] = I18n.t('mp.trader_help')
        @result[:xml][:MsgType] = 'text'
      end
    end
    @result
  end

  def user_deal
    case @xml[:MsgType]
    when 'text'
      case @xml[:Content]
      when /^主页/
        homepage
      when /^登录/
        is_login
      when /^留言 (?<content>\d+)?/
        comment
      when /^最新 ?(?<page>\d+)?/
        page = $~[:page]
        get_commodities page
      else
        @result[:xml][:Content] = I18n.t('mp.user_help')
        @result[:xml][:MsgType] = 'text'
      end
    end
    @result
  end

  def guest_deal
    case @xml[:MsgType]
    when 'text'
      case @xml[:Content]
      when /^主页/
        homepage
      when /^登录/
        login
      when /^留言 (?<content>\d+)?/
        comment
      when /^最新 ?(?<page>\d+)?/
        page = $~[:page]
        get_commodities page
      else
        @result[:xml][:Content] = I18n.t('mp.help')
        @result[:xml][:MsgType] = 'text'
      end
    end
    @result
  end

  private
  def admin_ids
    if ENV['MP_ADMINS'].blank?
      @admin_ids ||= []
    else
      @admin_ids ||= ENV['MP_ADMINS'].split(',')
    end
  end

  def homepage
    @result[:xml][:ArticleCount] = 1
    @result[:xml][:Articles] = {item: {
      Title: I18n.t('title'),
      Description: I18n.t('desc'),
      PicUrl: ENV['DOMAIN'] + ActionController::Base.helpers.asset_path('app.png'),
      Url: 'http://ysdev.realityandapp.com',
    }}
    @result[:xml][:MsgType] = 'news' 
  end

  def login
    @result[:xml][:Content] = "您的绑定码为：#{@mp_user.shortOpenID}"
    @result[:xml][:MsgType] = 'text'
  end

  def is_login
    @result[:xml][:Content] = "您已经绑定帐号"
    @result[:xml][:MsgType] = 'text'
  end

  def comment
    @result[:xml][:Content] = "留言成功"
    @result[:xml][:MsgType] = 'text'
  end

  def get_comments(page = 1)
    @mp_contents = MpContent.where(Content: /^留言 /).recent.not_user(ENV['MP_ADMINS'].split(',')).page(page)
    @result[:xml][:Content] = "留言第#{page || 1}页,共#{@mp_contents.count}条消息:\n"
    content_regex = /^留言 ?(?<content>\W+)?/
      @mp_contents.each do |mp_content|
      content_regex =~ mp_content.Content
      content = $~[:content]
      @result[:xml][:Content] += "#{content}\n"
      end
    @result[:xml][:MsgType] = 'text'
  end

  def get_commodities(page = 1)
    commodities = Commodity.opening.recent.page(page).per(1)
    @result[:xml][:ArticleCount] = commodities.to_a.count
    commodity = commodities.first
    @result[:xml][:Articles] = #[]
      #   commodities.each do |commodity|
      #     @result[:xml][:Articles].push(
      {
      item:{
      Title: commodity.name,
      Description: commodity.text,
      PicUrl: ENV['DOMAIN'] + commodity.picture.image.list.url,
      Url: commodity_url(commodity, host: ENV['DOMAIN_WITHOUT_HTTP']),
    }
    }
    #)
    #   end
    @result[:xml][:MsgType] = 'news'    
  end
end
