function buildWaterFall(colsBlockId, colCount, margin) {
  if (colCount < 1) {
    colCount = 1;
  }

  if (typeof margin == 'undefined' || margin < 0) {
    margin = 10;
  }

  var container = $("#" + colsBlockId);
  var columns = container.children();
  var left = 0, top = 0;
  var i = 0;
  var maxHeight = 0;
  while(i < columns.length) {
    var col = $(columns[i]);
    col.attr('id', i);
    col.css({
      'left': left + 'px',
      'top': top + 'px'
    }).show();

    var mh = computeScrollTop(col) + margin;
    if (maxHeight < mh) {
      maxHeight = mh;
    }

    i++;

    if (i % colCount == 0) {
      left = 0;
    } else {
      left += col.scrollLeft() + margin + col.width();
    }

    var aboveIndex = i - colCount;
    if (aboveIndex >= 0) {
      top = computeScrollTop($(columns[aboveIndex])) + margin;
    }
  }

  container.height(maxHeight + margin + 'px');

  $(".pinItem .pinImg").hover(function () {
    if(!$(this).children(".pinBtn").is(":animated")){//判断是否处于动画
      $(this).children(".pinBtn").fadeIn(200);
    }
  },function() {
    $(this).children(".pinBtn").fadeOut(0);
  });
}

function computeScrollTop(elem) {
  // the JQuery method 'scrollTop()' sometimes can't get the expected result,
  // especially when the columns is less than 3.
  var h = elem.css('top');
  if (typeof h != 'undefined') {
    h = parseInt(h.replace('/px/', ''));
  } else {
    h = 0;
  }
  return h + elem.height();
}

var fx = {
  "wb":{
    source:"http://service.t.sina.com.cn/share/share.php?appkey=1964588744",
    url:"url",
    title:"title",
    pic:"pic",
    des:""
  },
  "qq":{
    source:"http://v.t.qq.com/share/share.php?appkey=100291631",
    url:"url",
    title:"title",
    pic:"pic",
    des:""
  },
  "rr":{
    source:"http://widget.renren.com/dialog/share?",
    url:"resourceUrl",
    title:"title",
    pic:"pic",
    des:"&description="
  },
  "db":{
    source:"http://www.douban.com/recommend/?",
    url:"url",
    title:"title",
    pic:"pic",
    des:""
  },
  "kx":{
    source:"http://www.kaixin001.com/repaste/share.php?",
    url:"rurl",
    title:"rtitle",
    des:""
  }
}

function share_food(fid,fname,pic,type,des)
{	
  var url = fx[type].source 
    + "&" + fx[type].url+"="+encodeURIComponent("http://ysdev.realityandapp.com/posts/"+fid)
    +"&"+fx[type].title+"="+encodeURIComponent("推荐："+fname+" - ( @柳州夜市 夜市秀,分享夜市精彩) ")
    +"&"+fx[type].pic+"="+encodeURIComponent(pic)
    +fx[type].des+des;
  window.open (url, 'newwindow', 'height=600, width=500, top=300,left=300, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
  $.ajax({
    type:'POST',
    url:'/ajax.php',
    data:'_a=share_food',
    success:function(msg){
    }
  })
  return false;
}

$(function(){
  //fx hover
  $(".pinInfo").on("mouseover",".btn01" ,function(){
    $(this).find(".fx-list").show();
  }).on("mouseout",".btn01" ,function(){
    $(this).find(".fx-list").hide();
  });
});
