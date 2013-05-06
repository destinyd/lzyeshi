function get_trader(target){
  var id = target.attr('trader_id');
  var div_id = 'trader_' + id;
  var url = target.attr('href') + '.json';
  $('body').append('<div id="' + div_id + '" class="sw-ui-overflowLayer"><div class="topLeftArrow"><div class="top"></div><div class="bottom"></div></div><div class="sw-ui-overflowLayer-body">读取中...</div></div>');
  var new_div = $('#' + div_id)
    new_div.css({
      left: $(target).offset().left,
      top: ($(target).offset().top + $(target).outerHeight()) + 5 ,
      display: 'block',
      position: 'absolute'
    });

  $.getJSON( url , function(data) {
    var d = new Date('2013-04-15T19:25:25Z')
    var ul = $('<ul class="unstyled" />').append('<li><a href="/traders/'+data._id+'">' +data.name + '</a></li>').append('<li><span>常驻地点：</span>' +data.address + '</li>').append('<li><span>注册时间：</span>' + d.toLocaleDateString() + '</li>')
    new_div.find('.sw-ui-overflowLayer-body').html(ul);
  });
}
function remove_trader_div(target){
  var id = target.attr('trader_id');
  var div_id = 'trader_' + id;
  $('#' + div_id).remove();
}
