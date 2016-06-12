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
    	var dayMap2 = new Array(new Array(1),new Array(2));
    	var point1 = new Array();
    	var point2 = new Array();
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
    	<c:if test="${(fn:substring(detailDTO.sd_tdid, 0, 1)) == 2}">
    		<script>
    			var str2 = '${detailDTO.sd_map}';
    			var s2 = str2.split(':');
    			var j2 = parseInt('${i.count}');
    			point2[point2.length] = '${detailDTO.sd_startpoint}';
    			dayMap2[point2.length-1] = s2;
			</script>
    	</c:if>
    </c:forEach>
    <script>
		var map;
		var markers = [];
		var infowindow = null;
		var po = point1;
		var po2	 = point2;
		function initMap() {
			
			map = new google.maps.Map(document.getElementById('schedule-map'), {
				center: {lat: parseFloat(dayMap[0]), lng: parseFloat(dayMap[1])},
				mapTypeId: google.maps.MapTypeId.ROADMAP,
				zoom: 4
			});
			
		  	var flightPlanCoordinates = new Array() ;
		  	var flightPlanCoordinates2 = new Array() ;
		  	var mks =  dayMap;
		  	var mks2 = dayMap2;
		  	for(var i = 0 ; i < dayMap.length ; i++){
		  		var mkk = mks[i];
		  		flightPlanCoordinates[flightPlanCoordinates.length] = {lat: parseFloat(mkk[0]) , lng:parseFloat(mkk[1])}; 
		  	}
		  	
		  	for(var a = 0 ; a < dayMap2.length ; a++){
		  		var mkk2 = mks2[a];
		  		flightPlanCoordinates2[flightPlanCoordinates2.length] = {lat: parseFloat(mkk2[0]) , lng:parseFloat(mkk2[1])}; 
		  	}
		  
		  	for(var i = 0 ; i < flightPlanCoordinates.length ; i++){
				var mk = mks[i];
				var poi = po[i];
				
				addMap(mk , poi);
		
			}
		  	
		  	for(var i = 0 ; i < flightPlanCoordinates2.length ; i++){
				var mk2 = mks2[i];
				var poi2 = po2[i];
				
				addMap(mk2 , poi2);
		
			}
		  
		  	if(flightPlanCoordinates.length > 0){
		  		fp(flightPlanCoordinates ,'#FF0000' );
		  	}
		  	if(flightPlanCoordinates2.length > 0){
		  		fp(flightPlanCoordinates2 ,'#FF5E00' );
		  	}
		  	
		}
		function fp(fpc , color){
			var flightPath = new google.maps.Polyline({
		        path: fpc,
		        strokeColor: color,
		        strokeOpacity: 1.0,
		        strokeWeight: 4,
			});
			 flightPath.setMap(map);
		}
		
		function addMap(mk,poi){
				var infowindow = new google.maps.InfoWindow();
				var marker = new google.maps.Marker({
				    position: {lat:parseFloat(mk[0]), lng:parseFloat(mk[1])},
				    map: map,
				    animation: google.maps.Animation.DROP,
				    title: 'Hello World!'
				});
				
				google.maps.event.addListener(marker, 'click', function() { 
					infowindow.setContent("<h4>"+poi+"</h4>");
					infowindow.open(map, this);
				});
		}
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDt8pJQNw2nr0vxe8gZ-ur3zvAW5zrsKrw&callback=initMap" async defer></script>
  </head>
  <body>
    <div id="schedule-map"></div>
  </body>
</html>