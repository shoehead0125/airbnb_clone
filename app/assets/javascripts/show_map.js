$(function(){
  var lat = gon.latlng.lat;
  var lng = gon.latlng.lng;
  var mapOpt = {
    center: new google.maps.LatLng(lat, lng),
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("map-canvas-show"),mapOpt);
  
  var CircleOptions = {
  center: new google.maps.LatLng(lat, lng) , // 中心の位置座標
  map: map ,  // 設置する地図
  radius: 300 , // 半径
  } ;
  new google.maps.Circle( CircleOptions ) ;

  $('#scroll-area').on('click', function(e){
    e.preventDefault();
    var element = document.getElementById( 'scroll-target' ) ;
    var rect = element.getBoundingClientRect() ;
    var positionX = rect.left + window.pageXOffset ;  // 要素のX座標
    var positionY = rect.top + window.pageYOffset ; // 要素のY座標

    // 要素の位置にスクロールさせる
    window.scrollTo( positionX, positionY ) ;
  });
});
