$(function(){
  function buildHTML(message){
    var html = $('<li>'
                  + '<p class=message--name>' + message.name + '</p>'
                  + '<p class=message--time>' + message.created_at + '</p>'
                  + '<p class=message>' + message.body + '</p></li>');
    return html;
  }

  $('.js-form').on('submit',function(e){
    e.preventDefault();
    $('.resavation-second-panel').click();
    var pathName = location.pathname + '/messages';
    var form = $('.js-form').get()[0];
    var formData = new FormData(form);
    $.ajax({
      type: 'POST',
      url: pathName,
      data: formData,
      dataType: 'json',
      contentType: false,
      processData: false
    })
    .done(function(data){
      debugger;
      var html = buildHTML(data.message);
      $('.messages-list').append(html);
    })
    .fail(function(data){
      alert('error');
    });
  });
});
