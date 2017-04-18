$(function(){
  $('.date_input').on('click',function(){
    $('.input-group-addon').css('visibility','visible')
  });
  $('.input-daterange').datepicker({
    language: "ja",
    startDate: new Date()
  });
});
