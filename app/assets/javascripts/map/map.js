//DBC coordinates
// var dbc = {lat: 41.8762180, lng: -87.6531470};

function centerMapOnCurrentLocation() {
  navigator.geolocation.getCurrentPosition(initMap, error, options)
}

function initMap(location) {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: location.coords.latitude, lng: location.coords.longitude},
    zoom: 15
  });



  // map.addListener("click", function(event) {
  //   placeSoundTrek(event.latLng, map);
  // })

  console.log("GEOPOSITION:")
  console.log(location);

  console.log("COORDINATES:")
  console.log(location.coords);

  // var marker = new google.maps.Marker({
  //   position: new google.maps.LatLng(location.coords.latitude, location.coords.longitude),
  //   map: map
  // });

}

function error(err) {
  console.warn('ERROR(${error.code}): ${err.message}');
};

var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};

function createSoundTrek(latLng, map) {
  var marker = new google.maps.Marker({
    position: latLng,
    map: map
  });
}

function placeSoundTrek() {

}

$('button').on("click", function(event) {
  event.preventDefault();

  $.ajax({
// create a location
    url: '/locations',
    type: 'POST',
    data: {param1: 'value1'},
  })
  .done(function() {
    console.log("success");
  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
  });



})
// when a user clicks button to make a soundtrek, a Location object is created and associated with that user id. Then the user is taken to a form to make a new Soundtrek object

// function to take us to make soundtrek page when button clicked
//


// function handleLocationError(browserHasGeoLocation, infoWindow, currentPosition) {
//   infoWindow.setPosition(currentPosition);
//   infoWindow.setContent(browserHasGeoLocation ?
//                           "Error: The Geolocation service failed." :
//                           "Error: Your browser does not support geolocation.")
// }
