//DBC coordinates
// var dbc = {lat: 41.8762180, lng: -87.6531470};

function centerMapOnCurrentLocation() {
  navigator.geolocation.getCurrentPosition(initMap, error, options)
}

// remember to handle errors
function getCurrentLocation() {

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(successPosition, error, options)
  }
}

function successPosition(position) { // success

  var latitude = position.coords.latitude
  var longitude = position.coords.longitude

  // creates a location record in database
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
  getLocations(map);
}

function error(err) {
  console.warn('ERROR(${error.code}): ${err.message}');
};

var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};

function placeSoundTrek() {
  $('#create-sound-trek').on("click", function(event) {
    event.preventDefault();
    getCurrentLocation();
  })
}

function getLocations(map){
 $.ajax({
   url: '/locations',
   type: 'GET',
 })
 .done(function(response) {
    for (var i=0; i < response.length; i++){
      var marker = new google.maps.Marker({
      position: new google.maps.LatLng(response[i].latitude, response[i].longitude),
      map: map
      })
    }
  });
};



