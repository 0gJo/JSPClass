<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 28.-오전 9:02:02</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <style>
       /* Set the size of the div element that contains the map */
      #map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
       }
    </style>
<link rel="stylesheet" type="text/css" href="">
<script>
   $(document).ready(function (){
	 
   });
</script>

</head>
<body>
<a href="ex02.html">한독빌딩</a>
  <h3>My Google Maps Demo</h3>
    <!--The div element for the map -->
    <div id="map"></div>
     <script>
// Initialize and add the map
function initMap() {
  // The location of Uluru
  var uluru = {lat: -25.344, lng: 131.036};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 4, center: uluru});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: uluru, map: map});
}
</script>   
    
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD22gGuJambID4g4M2bHWgxOCmWCArzTzM&callback=initMap">
</script>


</body>
</html>