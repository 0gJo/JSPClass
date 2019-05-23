<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jsp/servelet class - 0gJo 2019. 5. 23.-오전 9:50:42</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
/*     var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];
    $( "#tags" ).autocomplete({
      source: availableTags
    }); */
    
   var params =  $("#form1").serialize();
    
    $("#tags").keyup(function() {
		$.ajax({
			url:"ex03_autocomplete_json.jsp"
			,dataType:"json"
			,type:"get"
			,data : params
			,cache:false //  기억*** : 항상 새로 읽어오겠다 
			,success:function(data){ // callback 함수 : 성공했을때 
				console.log(data);
				  $( "#tags" ).autocomplete({
				      source: data
				    }); 
			}
		    ,error:function(){
		    	alert("에러~~~~")
		    } 
		});
    })
    
    
  } );
  </script>
</head>
<body>
 <form id="form1" >
<div class="ui-widget">
  <label for="tags">Tags: </label>
  <input id="tags" name="searchWord">
</div>
</form>
</body>
</html>