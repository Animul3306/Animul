<%@page import="com.multi.animul.diagnosis.ApiKey"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>
<%
	ApiKey apiKey = new ApiKey();
	apiKey.readApiKey();
	String admin = apiKey.getAdminId();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/diagnosis/main2.css" />
<script type="text/javascript">
	$(function() {	
		var swiper = new Swiper(".mySwiper", {
		      navigation: {
		        nextEl: ".swiper-button-next",
		        prevEl: ".swiper-button-prev",
		      },
		      autoplay: {
		        delay: 3000
		      },
		      slidesPerView: 3,
		      spaceBetween: 20,
		      resistance : false,
		      loop: true,
		      scrollbar: {
		        el: '.swiper-scrollbar',
		        hide: true
		      },
		 
		    });
		
		
		
		$.ajax({
			url:"${pageContext.request.contextPath}/diagnosis/diagnosisList",
			success: function(list) {
				$('#diagnosisList').html(list)
			}//success
		})//ajax
		
		$.ajax({
			url:"${pageContext.request.contextPath}/diagnosis/avgPrice",
			dataType:"json",
			success: function(list) {
			        for(var i=0;i<list.length;i++){
			        	var click = "location.href='diagnosisOne?diagnosis_name=" + list[i].receipt_item_diagnosisname + "'"
			        	swiper.appendSlide("<div class='swiper-slide'" + "onClick=\"" + click + "\">" + list[i].receipt_item_diagnosisname + '<br>평균가 ' +list[i].allAvgPrice+ "원</div>");   	
			       }
			       swiper.update();
			}//success
		})//ajax
		
		$('#search').on("propertychange change keyup paste input", function() {
			if($('#search').val() != "") {
				document.getElementById("searchList").style.display = "block"; 
				$.ajax({
					url: "${pageContext.request.contextPath}/diagnosis/diagnosisFind",
					data: {
						diagnosis_name : $('#search').val(),
					},
					success: function(list) {
						$('#searchList').html(list)
					}//success
				})//ajax	
			} else {
				document.getElementById("searchList").style.display = "none";
			}
		})//search	
	})//$
</script>

</head>
<body>
<div class="btnCon">
	<button id="b1" class="btn btn-outline-primary" onclick="location.href='./myReceipt.jsp' "> 내 영수증 내역(가격 비교) </button>
	<% if(String.valueOf(session.getAttribute("loggedInUser")).equals(admin)) { %>
			<button id="b2" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/diagnosis/receiptList'"> 전체 영수증 내역 </button>
	<% } %>
</div>
<div class="container mt-3">
	<form class="d-flex">
		<div class="input-group">
			<input type="text" class="form-control" id="search" value="" placeholder="" >
			<button class="btn btn-outline-primary" type="submit">
				<svg xmlns="http://www.w3.org/2000/svg" width="45" height="45" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
				</svg>
			</button>
		</div>
	</form> 
	<div class="suggestions suggestions_pannel" id = "searchList"></div>
</div>

<div class="swiperCon">
<div class="swiper mySwiper">
    <div class="swiper-wrapper">
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>
</div>

<div class="rowList">
		<div class="row w-50" id="diagnosisList"></div>
</div>

</body>
</html>