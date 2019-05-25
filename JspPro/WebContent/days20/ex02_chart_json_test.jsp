<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 5. 24.-오전 9:35:02)</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/JspPro/dhtmlxChart_v51_std/dhtmlxChart_v51_std/codebase/fonts/font_roboto"/>
<link rel="stylesheet" type="text/css" href="/JspPro/dhtmlxChart_v51_std/dhtmlxChart_v51_std/codebase/dhtmlxchart.css"/>
<script src="/JspPro/dhtmlxChart_v51_std/dhtmlxChart_v51_std/codebase/dhtmlxchart.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
 .container{
   position: relative;
   width:450px;
   height:350px;
   border:dotted 1px #555;
   padding:10px;
   margin-top: 10px;
 }
 .loader{
   position: absolute;
   top:0;
   left:0;
   width:100%;
   height: 100%;
   background: rgba(255,255,255,0) url('ajax-loader.gif') no-repeat 50% 50%;
 }
</style>
<script>

var myLineChart; //

$(document).ready(function(){

    // JSON 
    // res.loader  == <div class='loader'></div>
    // res.container == 
 
	var res = {
			  loader:$("<div />",{ class:'loader'}),
			  container:$('.container')
			};
	 
	//
	$('a.load').on('click',function(){
		 $.ajax({
			 url:"ex02_chart_json.jsp",
			 dataType:"json",
			 type:"get",
			 cache:false,
			 beforeSend:function (xhr){ // ajax 처리 전에..
				 res.container
				 .empty()
				 .append(res.loader);
			 },
			 success:function(data){
				
				 res.container.find(res.loader).remove();
				 
				//$(".container").text( data.emp[0].ename );
				// 차트 그리기...
			 
				myLineChart =  new dhtmlXChart({
						view:"line",
						container:"chartbox",
						value:"#sal#",
						label:"#sal#",
						item:{
							borderColor: "#1293f8",
							color: "#ffffff"
						},
						line:{
							color:"#1293f8",
							width:3
						},
						xAxis:{
							template:"'#ename#"
						},
						offset:0,
						yAxis:{
							start:0,
							end:10000,
							step:1000,
							template:function(obj){
								return (obj%20?"":obj)
							}
						}
					}); 
					myLineChart.parse( data.emp ,"json"); 
					 	
			 }  //success
		 }); //  $.ajax({ 닫기
	 }); // $('a.load').on( 닫기
}); 
</script>
</head>
<body>

<a href="javascript:test('bar')">bar</a><br>
<a href="javascript:test('line')">line</a><br>
<hr>
<a href="#" class="load">Ajax Chart</a>
<div id="chartbox"
     class="container" 
     style="width:600px;height:250px;border:1px solid #c0c0c0;"></div>
</body>

</body>
</html>










