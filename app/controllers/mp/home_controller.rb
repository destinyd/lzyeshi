class Mp::HomeController < ApplicationController
  layout nil
  def index
    render text: params[:echostr]
  end

  def create
    mp = Mp.new params
    #render xml: {ToUserName: params[:xml][:FromUserName], FromUserName: params[:xml][:ToUserName], CreateTime: Time.now.to_i, MsgType: 'text', Content: '接收成功', FuncFlag: 0}
    render xml: mp.get
  end
end
