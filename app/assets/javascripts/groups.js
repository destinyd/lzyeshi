var hash_pictures = {};
var array_pictures_ids = new Array();

function hash_to_qquploader(){
  var html = '';
  //array_pictures_ids = new Array();
  $.each(hash_pictures,function(key,val){
    ////var tmp = '<div class="picture"><a target="_blank" href="' + val.image.url + '"><img src="'+ val.image.thumb.url +'" /><br /></div>';
    //var tmp = '<a target="_blank" href="' + val.image.url + '"><img src="'+ val.image.thumb.url +'" /></a>';
    //html += tmp;
    //array_pictures_ids.push(val._id);
    picture_append_qquploader(val);
  });
  //$('#pictures_list').html(html);
  $('#group_pictures_ids').val(array_pictures_ids.join(','));
  //console.log(array_pictures_ids);
}

function picture_append_qquploader (picture) {
    var tmp = '<a target="_blank" href="' + picture.image.url + '"><img src="'+ picture.image.thumb.url +'" /></a>';
    $('#pictures_list').append(tmp);
    array_pictures_ids.push(picture._id);
}
