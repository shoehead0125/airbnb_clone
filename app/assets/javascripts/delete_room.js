$(function(){
  $('.panel').hover(
    function(){
      var id = this.id;
      var target = '#delete-' + id;
      $(target).css('display', 'inline');
    },
    function(){
      var id = this.id;
      var target = '#delete-' + id;
      $(target).css('display', 'none');
    }
  );
  $('.delete_mark').on('click', function(e){
    e.preventDefault();
    var str = $(this).attr('id');
    var id = (str).match(/\d+/);
    var target = '#cover-' + id;
    $(target).css('display', 'block');
  });
  $('.btn__back-btn').on('click',function(){
    var target = $(this).parents('.alert');
    $(target).css('display', 'none');
  });
});
