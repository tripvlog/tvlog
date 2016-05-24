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
	<script>
      var script = '<script type="text/javascript" src="../src/markerclusterer';
      if (document.location.search.indexOf('compiled') !== -1) {
        script += '_compiled';
      }
      script += '.js"><' + '/script>';
      document.write(script);
    </script>
	<script>
		var mks = new Array();
	</script>

	<c:forEach var="loc" items="${location}">
		<script>
			loc = "${loc.diary_location}".substring(1, "${loc.diary_location}".length - 1);
			mks.push(loc);
		</script>
	</c:forEach>
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
			var aaaaa = [];
			for (var i = 0; i < mks.length; i++) {
				var mk = mks[i];
				mk = mk.split(",");
				marker = new google.maps.Marker({
					position : { lat : parseInt(mk[0]), lng : parseInt(mk[1]) },
					map: map
				});
				aaaaa.push(marker);
			}
			var markerCluster = new MarkerClusterer(map, aaaaa);
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

<!-- http://werty.co.kr/blog/3061 -->