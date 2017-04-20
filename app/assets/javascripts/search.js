$(function(){
  var hidden_keyword = gon.keyword;
  if (hidden_keyword.length) {
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({ "address": hidden_keyword }, function(results, status){
      if (status == google.maps.GeocoderStatus.OK) {
        var lat = results[0].geometry.location.lat().toFixed(6);
        var lng = results[0].geometry.location.lng().toFixed(6);
        var mapOpt = {
          center: new google.maps.LatLng(lat, lng),
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"),mapOpt);

        $(gon.latlng).each(function(i){
          var latlng = new google.maps.LatLng( gon.latlng[i].lat, gon.latlng[i].lng, false );
          var info_window = new google.maps.InfoWindow({
            position: latlng,
            maxWidth: 50,
            content: '<div class="infoWindow_span_' + gon.room_id[i] + '">' + gon.price[i] + '円</div>'
          });
          $(window).on('load', function(){
            info_window.open(map);
          });
        });
      }else {
        alert("地名が入力されなかった為、検索できませんでした。");
      }
    });
  }
  $('.listingCardWrapper').hover(
    function(){
      roomId = $(this).attr('id');
      target = '.infoWindow_span_' + roomId;
      $(target).css('background-color', 'red');
    },
    function(){
      roomId = $(this).attr('id');
      target = '.infoWindow_span_' + roomId;
      $(target).css('background-color', 'white');
    }
  );
});
