$(function(){
  function makeMapAndMarkers(hidden_keyword, i) {
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
        $(gon.latlng[0]).each(function(j){
          var latlng = new google.maps.LatLng( gon.latlng[i][j].lat, gon.latlng[i][j].lng, false );
          var marker_j = new google.maps.Marker({
          map: map,
          position: latlng
          });
        });
      }else {
        alert("地名が入力されなかった為、検索できませんでした。");
      }
    });
  }
  var hidden_keyword = gon.keyword[0];
  makeMapAndMarkers(hidden_keyword, 0);
  $('.panel-label').on('click', function(){
    var target = $(this);
    var target_id = target.attr('id');
    hidden_keyword = gon.keyword[+target_id];
    makeMapAndMarkers(hidden_keyword, +target_id);
  });
});
