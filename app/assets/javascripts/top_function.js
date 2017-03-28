$(function(){
  $('.input-daterange').datepicker({
    language: "ja"
  });
  function initialize() {
    var input = document.getElementById('search-input-location');
    var options = { types: ["(cities)"] };
    autocomplete = new google.maps.places.Autocomplete(input, options);
  }
  google.maps.event.addDomListener(window, "load", initialize);

  $('#search-input-location').on('keyup', function(){
    var input = $('#search-input-location');
    var word = input.val();
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({'address': word }, function(results, status){
      if(status == google.maps.GeocoderStatus.OK) {
        var lat = results[0].geometry.location.lat();
        var lng = results[0].geometry.location.lng();
        var lat1 = document.getElementById('hidden__latitude');
        var lng1 = document.getElementById('hidden__longitude');
        lat1.value = lat.toFixed(6);
        lng1.value = lng.toFixed(6);
      }
    });
  });
  var hidden_keyword = document.getElementById('keyword').innerText;
  if (hidden_keyword.length) {
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({ "address": hidden_keyword }, function(results, status){
      if (status == google.maps.GeocoderStatus.OK) {
        var lat = results[0].geometry.location.lat().toFixed(3);
        var lng = results[0].geometry.location.lng().toFixed(3);
        var mapOpt = {
          center: new google.maps.LatLng(lat, lng),
          zoom: 15,

          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"),mapOpt);
        $(gon.latlng).each(function(i){
          var latlng = new google.maps.LatLng( gon.latlng[i].lat, gon.latlng[i].lng, false );
          var marker_i = new google.maps.Marker({
          map: map,
          position: latlng
          });
        });
      }else {
        alert("地名が入力されなかった為、検索できませんでした。");
      }
    });
  }
});
