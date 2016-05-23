<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
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
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script>

function initMap() {
	var center = new google.maps.LatLng(37.4419, -122.1419);
	var options = {
	  'zoom': 13,
	  'center': center,
	  'mapTypeId': google.maps.MapTypeId.ROADMAP
	};

	var map = new google.maps.Map(document.getElementById("map"), options);

	var markers = [];
	for (var i = 0; i < 100; i++) {
	  var latLng = new google.maps.LatLng(data.photos[i].latitude,
	      data.photos[i].longitude);
	  var marker = new google.maps.Marker({'position': latLng});
	  markers.push(marker);
	}
	var markerCluster = new MarkerClusterer(map, markers);
	
}

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDt8pJQNw2nr0vxe8gZ-ur3zvAW5zrsKrw&callback=initMap"
        async defer></script>
  </body>
</html>

<!-- http://werty.co.kr/blog/3061 -->