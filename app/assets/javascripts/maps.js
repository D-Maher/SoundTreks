function initMap() {
  var dbc = {lat: 41.8762180, lng: -87.6531470}

  var map = new google.maps.Map(document.getElementId('map'), {
    zoom: 15,
    center: dbc
  });

  var marker = new google.maps.Marker({
    position: dbc,
    map: map
  })
}
