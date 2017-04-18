$(function(){
  var setFileInput = $('#user_image');

  setFileInput.change(function(){
    var file = $(this).prop('files')[0],
    fileRdr = new FileReader(),
    target = $('.image-box');
    target.append('<img alt="user_image" class="imgView" height="50px" width="50px" >');
    var prevElm = $('.imgView');
    fileRdr.onload = function() {
      prevElm.attr('src', fileRdr.result);
    }
    fileRdr.readAsDataURL(file);
  });
});
