var hash_pictures = {};
var array_pictures_ids;

function hash_to_qquploader(){
  var html = '';
  array_pictures_ids = new Array();
  $.each(hash_pictures,function(key,val){
    //var tmp = '<div class="picture"><a target="_blank" href="' + val.image.url + '"><img src="'+ val.image.thumb.url +'" /><br /></div>';
    var tmp = '<a target="_blank" href="' + val.image.url + '"><img src="'+ val.image.thumb.url +'" /></a>';
    html += tmp;
    array_pictures_ids.push(val._id);
  });
  $('#pictures_list').html(html);
  $('#group_pictures_ids').val(array_pictures_ids.join(','));
  console.log(array_pictures_ids);
}
