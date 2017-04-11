$(function(){
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
});
