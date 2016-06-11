<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/tvlog/schedule/schedule.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
		
	<script src="//code.jquery.com/jquery-1.11.0.min.js"  ></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="/tvlog/schedule/schedule.js"></script>
    <style>
      #schedule-map {
      	width: 100%;
        height: 400px;
        Border-radius:10px;
      }
    </style>
    
    <script>
    	var count = parseInt('${count}');
    	var dayMap = new Array(new Array(count),new Array(2));
    	var point1 = new Array();
    </script>
    
    <c:forEach items="${detaillist}" var="detailDTO" varStatus="i">
    	<c:if test="${(fn:substring(detailDTO.sd_tdid, 0, 1)) == 1}">
    		<script>
    			var str = '${detailDTO.sd_map}';
    			var s = str.split(':');
    			
    			var j = parseInt('${i.count}');
    			point1[point1.length] = '${detailDTO.sd_startpoint}';
    			dayMap[j-1] = s;
			</script>
    	</c:if>
    </c:forEach>
    <script>
		var map;
		var markers = [];
		var infowindow = null;
		var po = point1;
		function initMap() {
			
			map = new google.maps.Map(document.getElementById('schedule-map'), {
				center: {lat: parseFloat(dayMap[0]), lng: parseFloat(dayMap[1])},
				mapTypeId: google.maps.MapTypeId.ROADMAP,
				zoom: 4
			});
			
		  	var flightPlanCoordinates = new Array() ;
		  	var mks =  dayMap;
		  	
		  	for(var i = 0 ; i < dayMap.length ; i++){
		  		var mkk = mks[i];
		  		flightPlanCoordinates[flightPlanCoordinates.length] = {lat: parseFloat(mkk[0]) , lng:parseFloat(mkk[1])}; 
		  	}
		  	
		  	var marker = new Array(po.length);
		  	var infowindow = new Array(po.length);
		  	for(var i = 0 ; i < flightPlanCoordinates.length ; i++){
				var mk = mks[i];
				var poi = po[i];
				
				marker[i] = new google.maps.Marker({
				    position: {lat:parseFloat(mk[0]), lng:parseFloat(mk[1])},
				    map: map,
				    animation: google.maps.Animation.DROP,
				    title: 'Hello World!'
				});
				
				 infowindow[i] = new google.maps.InfoWindow();
				
				google.maps.event.addListener(marker[i], 'click', function() { 
						
						infowindow[i].setContent(poi);
						infowindow[i].open(map, marker[i]);
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