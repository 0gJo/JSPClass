<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k¡Õn¢®k (2019. 5. 28.-¿ÀÀü 9:50:29)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
</style>
<script>
   $(document).ready(function (){	  
   });
</script>
</head>
<body>
<div id="map" style="width:100%;height:500px;"></div>

<script>
var lat = 37.499327;
var lng = 127.033162;

function myMap() {
  var mapCanvas = document.getElementById("map");
  var myCenter = new google.maps.LatLng(lat, lng); // 
  var mapOptions = {center: myCenter, zoom: 15};
  var map = new google.maps.Map(mapCanvas, mapOptions);
  
  google.maps.event.addListener(map, 'click'
		  , function(event) { /* googlemap의 event객체  */
			    placeMarker(map, event.latLng);
			}
  );
}

function placeMarker(map, location) {
  var marker = new google.maps.Marker({
    position: location,
    map: map
  });
  var infowindow = new google.maps.InfoWindow({
    content: 'Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
  });
  infowindow.open(map,marker);
}
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=XXXXXX&callback=myMap"></script>

</body>
</html>