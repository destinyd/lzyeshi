function init_faye (faye_url,subcribe) {
  window.faye = new Faye.Client(faye_url);
  faye.subscribe("/n/" + subcribe , function(data) {
    humane.alter('您有新消息!<a href="http://user.ysdev.realityandapp.com/got_chat_messages/'+ data.chat_message_id + '">点击查看</a>');
      $('#unread_messages_count').html(data.count.toString());
  });
}
