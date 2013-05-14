function init_faye (faye_url,subcribe) {
  window.faye = new Faye.Client(faye_url);
  faye.subscribe("/n/" + subcribe , function(data) {
    humane.alter('您有新消息!<a href="/got_chat_messages/'+ data.chat_message_id + '">点击查看</a>');
    try{
      var count = Number($('#unread_messages_count').html()) + 1;
      $('#unread_messages_count').html(count.toString())
    }
    catch(e){
    }
  });
}
