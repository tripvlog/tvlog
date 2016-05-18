<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
.controls {
  margin-top: 10px;
  border: 1px solid transparent;
  border-radius: 2px 0 0 2px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  height: 32px;
  outline: none;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

#pac-input {
  background-color: #fff;
  font-family: Roboto;
  font-size: 15px;
  font-weight: 300;
  margin-left: 12px;
  padding: 0 11px 0 13px;
  text-overflow: ellipsis;
  width: 300px;
}

#pac-input:focus {
  border-color: #4d90fe;
}

.pac-container {
  font-family: Roboto;
}

#type-selector {
  color: #fff;
  background-color: #4d90fe;
  padding: 5px 11px 0px 11px;
}

#type-selector label {
  font-family: Roboto;
  font-size: 13px;
  font-weight: 300;
}

    </style>
    <title>Places Searchbox</title>
    <style>
      #target {
        width: 345px;
      }
    </style>
  </head>
  <body>
    <input id="pac-input" class="controls" type="text" placeholder="Search Box">
    <div id="map"></div>
    <script>
// This example adds a search box to a map, using the Google Place Autocomplete
// feature. People can enter geographical searches. The search box will return a
// pick list containing a mix of places and predicted search terms.
var marker = [];
function initAutocomplete() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 36, lng: 127}, // 처음 지도를 띄웠을 때 위치
    zoom: 3, // 처음 지도를 띄웠을때 확대 수치
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
 
  // Create the search box and link it to the UI element.
  var input = document.getElementById('pac-input');
  var searchBox = new google.maps.places.SearchBox(input);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  // Bias the SearchBox results towards current map's viewport.
  map.addListener('bounds_changed', function() {
    searchBox.setBounds(map.getBounds());
  });
  
  var infowindow = new google.maps.InfoWindow();
	
	google.maps.event.addListener(marker, 'click', function() { 
			infowindow.setContent("afasdfasdf");
			infowindow.open(map, this);
	});

  searchBox.addListener('places_changed', function() {
    var places = searchBox.getPlaces();
	var info = new google.maps.InfoWindow();
	info.setContent("12345");
	
    if (places.length == 0) {
      return;
    }
    marker.forEach(function(marker) {
      marker.setMap(null);
    });
    marker = [];

    // For each place, get the icon, name and location.
    var bounds = new google.maps.LatLngBounds();
    places.forEach(function(place) {
      // Create a marker for each place.
     	marker.push(new google.maps.Marker({
        map: map,
        title: place.name,
        position: place.geometry.location
      }));
      
		alert(place.name + " : " + place.geometry.location); // 검색 위치 좌표값으로 받기
		
      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
    });
    map.fitBounds(bounds);
  });
  // [END region_getplaces]
}


    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDt8pJQNw2nr0vxe8gZ-ur3zvAW5zrsKrw&libraries=places&callback=initAutocomplete"
         async defer></script>
  </body>
</html>