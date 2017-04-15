$(function(){
  // TODO
  // まだまだ再考の余地ありだけど先に進む。
  $('.search-input').on('change', function(){
    var selected = $(this);
    var selected_id = $(selected).attr('id');
    var refine_selected = selected_id.substr(0, selected_id.length-2);
    var id_number = selected_id.match(/\d/)[0];
    var target_id_number = +id_number + 1;
    var target = $('#room__search-' + target_id_number);
    if(refine_selected == 'search-input-location'){
      var target_date = $('#search-input-date-' + id_number);
      if($(target_date).val() != ""){
          $(target).css('display', 'block');
      }
    }
    else{
      var target_location = $('#search-input-location-' + id_number);
      if($(target_location).val() != ""){
          $(target).css('display', 'block');
      }
    }
  });
  function initialize(target_id) {
    var input = document.getElementById(target_id);
    var options = { types: ["(cities)"] };
    autocomplete = new google.maps.places.Autocomplete(input, options);
  }
  $('.search-input-location').on('change',function(){
    var target = $(this);
    var target_id = target.attr('id');
    initialize(target_id);
    var word = target.val();
    var id_number = target_id.match(/\d/)[0];
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({'address': word }, function(results, status){
      if(status == google.maps.GeocoderStatus.OK) {
        var lat = results[0].geometry.location.lat();
        var lng = results[0].geometry.location.lng();
        var lat1 = document.getElementById('form_' + id_number + '_latitude');
        var lng1 = document.getElementById('form_' + id_number + '_longitude');
        lat1.value = lat.toFixed(6);
        lng1.value = lng.toFixed(6);
      }
    });
  });
});
