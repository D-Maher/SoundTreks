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
    $("#new-sound-trek-container").html(response);
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

function storeLocation() {
  $('#create-sound-trek').on("click", function(event) {
    event.preventDefault();
    getLocation();
  })
}

function createSoundTrek() {
  $('#new-sound-trek-container').on("submit", "#new-sound-trek-form", function(event) {
    event.preventDefault();
    formData = $(this).serialize();
    action = $(this).attr('action');

    $.ajax({
      url: action,
      type: 'POST',
      data: formData,
    })
    .done(function() {
      console.log("LOCO BUENNNOOOOOOOO!!!!");

    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });


  })
}
