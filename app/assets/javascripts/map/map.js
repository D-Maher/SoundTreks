//DBC coordinates
// var dbc = {lat: 41.8762180, lng: -87.6531470};

function centerMapOnCurrentLocation() {
  navigator.geolocation.getCurrentPosition(initMap, error, options)
}

// remember to handle errors
function getLocation() {

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(successPosition, error, options)
  }
}

function successPosition(position) { // success

  var latitude = position.coords.latitude
  var longitude = position.coords.longitude

  // create a location record in database
  $.ajax({
    url: '/locations',
    type: 'POST',
    data: {location:{latitude: latitude, longitude: longitude}}
  })
  .done(function(response) {
    console.log("success");
    $("#new-sound-trek-form").html(response);
    // Don't forget to delete form from page on form submission
  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
  });
}

function initMap(location) {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: location.coords.latitude, lng: location.coords.longitude},
    zoom: 15
  });
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
  $('#create-sound-trek').on("click", function(event) {
    event.preventDefault();
    getLocation();
  })
}
// when a user clicks button to make a soundtrek, a Location object is created and associated with that user id. Then the user is taken to a form to make a new Soundtrek object

// function to take us to make soundtrek page when button clicked
//


// function handleLocationError(browserHasGeoLocation, infoWindow, currentPosition) {
//   infoWindow.setPosition(currentPosition);
//   infoWindow.setContent(browserHasGeoLocation ?
//                           "Error: The Geolocation service failed." :
//                           "Error: Your browser does not support geolocation.")
// }
