<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>
<html>
<head>
	<title>Animul</title>
	<style>
		ul {
			align-items: center;
			list-style: none;
		}
		
		li {
			float: left;
			margin-left: 20px;
		}
		
		.disease { 
			width: 100%;
            display: flex;
            justify-content: center;
            margin-left: auto;
            margin-right: auto;
		}
		
		 .disease a {
            margin: 0 10px;
        }
	</style>

	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/slider.css"/>">
</head>
<body>
    <c:set var="imageList" value="/resources/img/ad_banner01.png,/resources/img/ad_banner02.png,/resources/img/ad_banner03.jpg" />
	<c:set var="imageArray" value="${fn:split(imageList, ',')}" />

    <div class="slideshow-container">
        <c:forEach var="image" items="${imageList}">
            <div class="mySlides">
                <img src="${pageContext.request.contextPath}${image}" alt="Slide">
            </div>
        </c:forEach>

        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>
    <script src="<c:url value="/resources/js/slider.js"/>"></script>
    
<div class="disease">
	<a href="#"><img src="${pageContext.request.contextPath}/resources/img/disease_search.png"></a>
	<a href="#"><img src="${pageContext.request.contextPath}/resources/img/search.png"></a>
	<a href="#"><img src="${pageContext.request.contextPath}/resources/img/info.png"></a>
</div>

</body>
</html>
