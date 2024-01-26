<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.multi.animul.map.PageVO"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Animul [동물병원/반려동물용품점/동물보호센터]</title>

 
 <link href="../resources/css/map/mapstyle.css" rel="stylesheet">
 
</head>

<body>
<div id="container">  
 
	<div class="login_group">  
		<a href="SearchCenter.jsp" data-tooltip="kakao API를 사용하는 지도로 이동합니다."> API Map Link </a>			
	</div>
   
	<div class="borderbox-medium">	
		<form action="list2" name="RadioForm">	 
			<input type="radio" id="radio1" name="radiokeyword" value="동물병원" ${centerType1 eq 1 ? "checked" : ""} onclick="checkRadio()" />
			<label>동물병원</label>
			<input type="radio" id="radio2" name="radiokeyword" value="반려동물용품" ${centerType1 eq 2 ? "checked" : ""} onclick="checkRadio()" />
			<label>펫샾</label>	
			<input type="radio" id="radio3" name="radiokeyword" value="동물보호" ${centerType1 eq 3 ? "checked" : ""} onclick="checkRadio()" disabled />
			<label>동물보호센터</label>				 	
		</form>	 
	
		<div class="borderbox-small" >	
			<form action="list2" method="get">
			<label> 주소 </label>&ensp;	
		  		<select name="addressRegion" id="addressRegion2"></select>
				<select name="addressDo" id="addressDo2"></select>
				<select name="addressSiGunGu" id="addressSiGunGu2" onchange="RegionClass2(this); return false;"></select>				
		
				<input type="hidden" id="centerAddr1" name="centerAddr1" value='${addr}' style="background-color:#e6e6e6">	
				<input type="hidden" id="centerType" name="centerType" value='${centerType1}' >		&ensp;	 			
				<input type="submit" value="검색" class="button" onclick="nullcheck()">
			</form>
		</div>		
 	 
		<div class="borderbox-small">	
		 	<form action="list3" method="get">
		 		<label> 상호 </label> &ensp;	
				<input type="text" id="keywordSearch1" name="keywordSearch1">	
				<input type="hidden" id="centerType2" name="centerType2" value="${centerType1}">	&ensp;			
				<input type="submit" value="검색" class="button" onclick="nullcheck()">
		 	</form>	
		</div>
	 
	<br>
 	</div>
 	
	<div id="map" class="borderbox-map"></div>
 
	<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5454a62e5d0c9bb2b98dbfd591e5b4cb&libraries=services"></script>
 	<script type="text/javascript" src="../resources/js/address.js"></script>		
	<script>
	
///////////////////// Tooltip
	 
	   let tooltipElem;

	    document.onmouseover = function(event) {
	      let target = event.target;

	      // data-tooltip 속성이 있는 요소
	      let tooltipHtml = target.dataset.tooltip;
	      if (!tooltipHtml) return;

	      // 툴팁 요소를 만듭니다.

	      tooltipElem = document.createElement('div');
	      tooltipElem.className = 'tooltip';
	      tooltipElem.innerHTML = tooltipHtml;
	      document.body.append(tooltipElem);

	      // 툴팁 요소를 data-tooltip 속성이 있는 요소 위, 가운데에 위치시킵니다.
	      let coords = target.getBoundingClientRect();

	      let left = coords.left + (target.offsetWidth - tooltipElem.offsetWidth) / 2;
	      if (left < 0) left = 0; // 툴팁이 창 왼쪽 가장자리를 넘지 않도록 합니다.

	      let top = coords.top - tooltipElem.offsetHeight - 5;
	      if (top < 0) { // 툴팁이 창 위로 넘치면 요소 아래에 보여줍니다.
	        top = coords.top + target.offsetHeight + 5;
	      }

	      tooltipElem.style.left = left + 'px';
	      tooltipElem.style.top = top + 'px';
	    };

	    document.onmouseout = function(e) {

	      if (tooltipElem) {
	        tooltipElem.remove();
	        tooltipElem = null;
	      }

	    };
	 
	/////////////////////
 
	function RegionClass2(s){
		var inputData = document.getElementById("addressDo2").value;
		inputData += " ";					 
		inputData += s[s.selectedIndex].text; // document.getElementById("addressSiGunGu2").text;
		document.getElementById("centerAddr1").value = inputData;
	//	addressSearchKeword= inputData;
		
		return inputData;
	}
 
	function checkRadio() {		
	    if (document.getElementById('radio1').checked) {
	        document.getElementById('centerType').value = "1";
	        document.getElementById('centerType2').value = "1";
	    
	    }	    
	    if (document.getElementById('radio2').checked) {
    	 	document.getElementById('centerType').value = "2";
    	 	document.getElementById('centerType2').value = "2";
	    }	    
	    if (document.getElementById('radio3').checked) {
	    	 document.getElementById('centerType').value = "3";
	    	 document.getElementById('centerType2').value = "3";	
	    }
	
	}
	
	function nullcheck(){
		if (document.getElementById('radio1').checked == false && document.getElementById('radio2').checked == false){
			alert("검색 하려는 버튼 [O 동물병원 O 펫샾]을 선택하세요.");	
			return;		
		}
 	}
	// map 지도

	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 4 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	var bounds = new kakao.maps.LatLngBounds(); //지도 범위를 설정

	// 마커를 표시할 위치와 title 객체 배열입니다	 
	var positions = new Array();

	<c:forEach items="${list2}" var="vo">
		positions.push({ title: '${vo.searchCenter_name}',
						 latlng: new kakao.maps.LatLng(${vo.searchCenter_latitude}, ${vo.searchCenter_longitude}),
						 address: '${vo.searchCenter_address}',
						 tel: '${vo.searchCenter_phone}',
						 working: '${vo.searchCenter_time}'
						});	
 	</c:forEach>

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
					
     
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 37); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map : map, // 마커를 표시할 지도
	        position : positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다	       
	        address : positions[i].address,
	        tel : positions[i].tel,
	        working : positions[i].working,
	        image : markerImage // 마커 이미지 
	    });
	    
	    displayMarker(positions[i]);
  	    
		bounds.extend(new kakao.maps.LatLng(positions[i].latlng.getLat(), positions[i].latlng.getLng() ));
		map.setBounds(bounds); // 지도 범위를 재설정합니다	
	}
 	
	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker2(locPosition, message) {
	
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({  
	        map: map, 
	        position: locPosition
	    }); 
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;
	
	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    infowindow.open(map, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);    
	    
	}
	
	function displayMarker(place) {
 
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(positions[i].latlng.getLat(), positions[i].latlng.getLng()) 
	    });	    
	    
	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	       var contents = '<div style="padding:3px;font-size:13px;">' + '<span>' + place.title + '</span> <br>' + 
	        					  '<span>주소 : ' + place.address + '</span> <br>' +
	        					  '<span>전화번호 : ' + place.tel + '</span> <br>' +
	        					  '<span>운영시간 : ' + place.working + '</span>' + '</div>';
	        					  
	        infowindow.setContent(contents);
	        infowindow.open(map, marker);
	    });

	}
	/////////////////////
// 주소 select box

$(function(){
    areaSelectMaker("select[name=addressRegion]");
});

var areaSelectMaker = function(target){
    if(target == null || $(target).length == 0){
        console.warn("Unkwon Area Tag");
        return;
    }
  // var area
    for(i=0; i<$(target).length; i++){
        (function(z){
            var a1 = $(target).eq(z);
            var a2 = a1.next();
            var a3 = a2.next();

            //초기화
            init(a1, true);

            //권역 기본 생성
            var areaKeys1 = Object.keys(area);
            areaKeys1.forEach(function(Region){
                a1.append("<option value="+Region+">"+Region+"</option>");
            });

            //변경 이벤트
            $(a1).on("change", function(){
                init($(this), false);
                var Region = $(this).val();
                var keys = Object.keys(area[Region]);
                keys.forEach(function(Do){
                    a2.append("<option value="+Do+">"+Do+"</option>");    
                });
            });

            $(a2).on("change", function(){
                a3.empty().append("<option value=''>선택</option>");
                var Region = a1.val();
                var Do = $(this).val();
                var keys = Object.keys(area[Region][Do]);
                keys.forEach(function(SiGunGu){
                    a3.append("<option value="+area[Region][Do][SiGunGu]+">"+area[Region][Do][SiGunGu]+"</option>");    
                });
            });
        })(i);        

        function init(t, first){
            first ? t.empty().append("<option value=''>선택</option>") : "";
            t.next().empty().append("<option value=''>선택</option>");
            t.next().next().empty().append("<option value=''>선택</option>");
        }
    }
}

////////////////////////////////////////
// var h_type = document.querySelector('input[name="radiokeyword"]:checked').value;
</script>

<br>
<body>
	
 <div id="tablelist2" style="display:flex;padding:10px;color:black;">
	<table width="99%">
	    <tr bgcolor="lightgray">
	        <td>id</td>
	        <td>상호</td>	        
	        <td>주소</td>		        
	        <td>전화번호</td>
	        <td>홈페이지</td>
	        <td>운영시간</td>
	        <td>휴일</td>		        
	    </tr>
    	
	<c:forEach items="${list2}" var="vo">
	    <tr>
	        <td>${vo.searchCenter_id}</td>		        
	        <td>${vo.searchCenter_name}</td>		        
	        <td>${vo.searchCenter_address}</td>
	        <td>${vo.searchCenter_phone}</td>
	        <c:choose>
			 <c:when test ="${vo.searchCenter_link eq '정보없음'}" > 
			  	<td>${vo.searchCenter_link}</td>			  			 	        
	         </c:when>
	         <c:otherwise>
	       		<td><a href="${vo.searchCenter_link}" target=_blank> ${vo.searchCenter_link} </a></td>
	         </c:otherwise>
	        </c:choose>
	        <td>${vo.searchCenter_time}</td>
	        <td>${vo.searchCenter_off}</td>  
		</tr>
	</c:forEach>
</table>
 </div>
	 	
	<br>		
<div id="tablelistpages2" style="display:flex;padding:10px;">	
 	<a href="list2?page=<%=1%>&centerAddr1=${addr}&centerType=${centerType1}">
		<button style="background:#d3cfe3"> First </button>
	</a> 	 		

	<%
	PageVO vo = (PageVO)request.getAttribute("page");	
	System.out.println(vo.toString());
	int lastIndex = 0;
	lastIndex = (int)request.getAttribute("pages");
	int startIndex = 0;
	
	//전체페이지 11, 페이지 1~10, 11
	//전체페이지 4, 페이지 1~10 (0)
	
	//1~201 레코드
	// 처음실행 1~10페이지 10개씩 10페이지
	// next클릭 11~20페이지 10개식 10페이지
	// next클릭 21페이지	1개 1페이지
	
	// 페이지가 10개 이하
	if( vo.getTotalPageCount() <= 10 )
	{
		startIndex = vo.getStart();
		lastIndex = vo.getEnd();	
	}
	else if( vo.getTotalPageCount() > 10 )
	{
		//페이지 10개 출력
		startIndex = vo.getPage();
		lastIndex = vo.getPage() + 9;		
		//Next button 다음 페이지 10개 출력		
	}

	for(int v=startIndex; v<=lastIndex; v++) {
	%>	
		<a href="list2?page=<%=v%>&centerAddr1=${addr}&centerType=${centerType1}"> 
			<button style="background:#e6e6e6"><%=v%></button>
		</a>
	<%	
	}
	%>
	<% int last = (int)request.getAttribute("pages"); %>
 	<a href="list2?page=<%=last%>&centerAddr1=${addr}&centerType=${centerType1}">
		<button style="background:#d3cfe3"> Last </button>
	</a>
	 </div>
 	 
 	<br>
 	<div id="tablelistpagesnums2" style="display:flex;padding:10px;">	
    <span> 현재 페이지: ${page.page}, 전체 페이지: ${pages}개 ,	전체 게시물 수: ${count}개  </span> <br>		
	</div>
</div>	
</body>
</html>