// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require kindeditor
//= require bootstrap
//= require jquery.scrollTo.min
//= require jquery.localScroll.min
//= require jquery.ui.totop.min
//= require fileuploader
//= require locations
//= require groups
//= require home
//= require devise
//= require humane
//= require traders
//= require chat_messages
//= require posts
// require_tree .
humane.timeout = 5000;
//humane.waitForMove = true;
//humane.clickToClose = true;
humane.alter = humane.spawn({ addnCls: 'humane-libnotify-info', clickToClose: true, waitForMove: true})
humane.success = humane.spawn({ addnCls: 'humane-boldlight-success'})
humane.error = humane.spawn({ addnCls: 'humane-boldlight-error'})

$(document).ready(function(){
  var $window = $(window)
  // side bar
  setTimeout(function() {
    $('.bs-docs-sidenav')
    .affix({
      offset: {
        top: function() {
          return $window.width() <= 980 ? 190 : 110
        },
      bottom: 270
      }
    })
  }, 100);
  $('ul.bs-docs-sidenav').localScroll();
  //$('ul.bs-docs-sidenav li a').click( function () {
    //$('ul.bs-docs-sidenav li').removeClass("active");
    //$(this).parent().addClass("active");
  //});
  $('#main').UItoTop();
})
