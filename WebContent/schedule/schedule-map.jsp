<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <style>
      #schedule-map {
      	width: 960px;
        height: 400px;
        Border-radius:10px;
      }
    </style>
    <script>
		var map;
		var markers = [];
		var infowindow = null;
		
		function initMap() {
			
			map = new google.maps.Map(document.getElementById('schedule-map'), {
				center: {lat: 37.772, lng: -122.214},
				mapTypeId: google.maps.MapTypeId.ROADMAP,
				zoom: 4
			});
			
		  	var flightPlanCoordinates = [
		                               {lat: 37.772, lng: -122.214},
		                               {lat: 21.291, lng: -157.821},
		                               {lat: -18.142, lng: 178.431},
		                               {lat: -27.467, lng: 153.027}
		                             ];
		  	var mks =  [
		                [37.772,-122.214],
		                [21.291,-157.821],
		                [-18.142,178.431],
		                [-27.467,153.027],
		              ];
			
		  	for(var i = 0 ; i < flightPlanCoordinates.length ; i++){
				var mk = mks[i];
				var marker = new google.maps.Marker({
				    position: {lat:mk[0], lng:mk[1]},
				    map: map,
				    animation: google.maps.Animation.DROP,
				    title: 'Hello World!'
				});
				markers.push(marker);
				
				var infowindow = new google.maps.InfoWindow();
		
				google.maps.event.addListener(marker, 'click', function() { 
						infowindow.setContent("afasdfasdf");
						infowindow.open(map, this);
				});
		
			}
		  	
			var flightPath = new google.maps.Polyline({
		        path: flightPlanCoordinates,
		        strokeColor: '#FF0000',
		        strokeOpacity: 1.0,
		        strokeWeight: 2,
			});
			 flightPath.setMap(map);	 
		}
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDt8pJQNw2nr0vxe8gZ-ur3zvAW5zrsKrw&callback=initMap" async defer></script>
  </head>
  <body>
    <div id="schedule-map"></div>
  </body>
</html>