<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="/tvlog/main/src/markerclusterer_compiled.js"></script>

	<!-- db에서 위치값을 가져와 배열에 저장 -->
	<script>
		var dbloc = new Array();
		var styles = [{
	        url: '/tvlog/main/images/people35.png',
	        height: 35,
	        width: 35,
	        anchor: [16, 0],
	        textColor: '#ff00ff',
	        textSize: 10
	      }, {
	        url: '/tvlog/main/images/people45.png',
	        height: 45,
	        width: 45,
	        anchor: [24, 0],
	        textColor: '#ff0000',
	        textSize: 11
	      }, {
	        url: '/tvlog/main/images/people55.png',
	        height: 55,
	        width: 55,
	        anchor: [32, 0],
	        textColor: '#ffffff',
	        textSize: 12
	      }]
	</script>
	<c:forEach var="loc" items="${location}">
		<script>
			loc = "${loc.diary_location}".substring(1, "${loc.diary_location}".length - 1);
			dbloc.push(loc);
		</script>
	</c:forEach>
	
	<!-- 가져온 위치값을 지도에 띄워줌 -->
	<script>
		function initMap() {
			var center = new google.maps.LatLng(34, 132);
			var options = {
				'zoom' : 5,
				'center' : center,
				'mapTypeId' : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document.getElementById("map"),
					options);
			var marker = [];
			var markers = [];
			for (var i = 0; i < dbloc.length; i++) {
				var mk = dbloc[i];
				mk = mk.split(",");
				marker = new google.maps.Marker({
					position : { lat : parseInt(mk[0]), lng : parseInt(mk[1]) },
					map: map
				});
				markers.push(marker);
			}
			var markerCluster = new MarkerClusterer(map, markers, {
				gridSize: 50,
				styles: styles
			});
		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDt8pJQNw2nr0vxe8gZ-ur3zvAW5zrsKrw&callback=initMap"
		async defer></script>
<body>
	<div id="map"></div>
</body>
</html>
