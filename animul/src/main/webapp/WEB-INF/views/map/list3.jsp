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

<style>
 
</style>
<!--  <link href="../resources/map/map.css" rel="stylesheet"> -->  

</head>

<body>
	<div id="map_wrap2" class="bg_white">	        
        <div class="hAddr">
       		<span class="title"></span>
       		<span id="centerAddr2"></span>
       		<span id="latlang"></span>
   		</div>
  	</div>
		 
	<div style="display:flex;padding:10px;">
	<form name="curPositionAddr">
	<!-- 	<label>검색 위치 : </label> -->
		<label id="centerAddr"></label>
	</form>
	</div>
	
	<div id="radioInfo" style="display:flex;padding:10px;">	
	<form action="" name="RadioForm">	 
		<input type="radio" name="radiokeyword" value="동물병원" onclick="SearchAddingWord()" checked />
		<label>동물병원</label>	
		<input type="radio" name="radiokeyword" value="반려동물용품" onclick="SearchAddingWord()" disabled />
		<label>펫샾</label>	
		<input type="radio" name="radiokeyword" value="동물보호" onclick="SearchAddingWord()" disabled />
		<label>동물보호센터</label>			 	
	</form>
	</div>
	
	<div id="keywordse" style="display:flex;padding:10px;">
 	<form action="list3" method="get">
 		<label> 키워드 검색 </label> 	
		<input type="text" id="keywordSearch1" name="keywordSearch1" value='${keywd}'>			
		<input type="submit" value="검색"> 	
 	</form>	
	</div>
	
	<div id="region" style="display:flex;padding:10px;">	
	<form action="list2" method="get">
	<label> 주소 선택 </label> 	
  		<select name="addressRegion" id="addressRegion2"></select>
		<select name="addressDo" id="addressDo2"></select>
		<select name="addressSiGunGu" id="addressSiGunGu2" onchange="RegionClass2(this); return false;"></select>
	</form>								 
 		
	<form action="list2" method="get" >
		<input type="text" id="centerAddr1" name="centerAddr1" value='${addr}'>			
		<input type="submit" value="검색">
	</form>
	</div>		
 
	
	<br>
	<div style="display:flex;padding:10px;">	
	<div id="map" style="width:99%;height:450px;"></div>
	</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
 	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5454a62e5d0c9bb2b98dbfd591e5b4cb&libraries=services"></script>
 	<script type="text/javascript" src="../resources/js/address.js"></script>		
	<script>
//	const animalHospital = "동물병원";
 
	var searchaddingkeyword = "동물병원";
	SearchAddingWord();
	
	function RegionClass(){
		var inputData = document.getElementById("addressDo1").value;
		inputData += " ";
		inputData += document.getElementById("addressSiGunGu1").value;
		inputData += " " + searchaddingkeyword;
		searchPlaces2(inputData);
		document.getElementById('keyword').value = "";
		
		document.getElementById("centerAddr1").value = inputData;
		
		return inputData;
	}
	
	function RegionClass2(s){
		var inputData = document.getElementById("addressDo2").value;
		inputData += " ";					 
		inputData += s[s.selectedIndex].text;//document.getElementById("addressSiGunGu2").text;		
		 
		document.getElementById("centerAddr1").value = inputData;
		return inputData;
	}
	
	function CurrentLocation(){
		var inputData = document.getElementById("centerAddr").innerText;	
		console.log(inputData);
		inputData += " " + searchaddingkeyword;
		searchPlaces2(inputData);
	
		return inputData;
	}
	
	function getCurrentLocation() {
		var curLocation = document.getElementById("centerAddr").innerText;
		document.getElementById("centerAddr1").value = curLocation;
		
		return curLocation;
	} 
	
	function getCurrentAddr() {
	 
		var cur = document.getElementById("centerAddr").innerText;
	 	document.getElementById("centerAddr1").value = cur;
	 
	} 	
	function CurrentLocationSearch(lat, lon){
		map4.panTo(lat, lon);
	}
	
	function SearchAddingWord(){
		searchaddingkeyword = document.querySelector('input[name="radiokeyword"]:checked').value;		
//		alert(searchaddingkeyword);
	}
	
	// map 지도

	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 4 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	var bounds = new kakao.maps.LatLngBounds(); //지도 범위를 설정
	
	// 마커를 표시할 위치와 title 객체 배열입니다	 
	var positions = new Array();

	<c:forEach items="${list3}" var="vo">
		positions.push({ title: '${vo.hospital_name}',
						 latlng: new kakao.maps.LatLng(${vo.hospital_latitude}, ${vo.hospital_longitude}),
						 address: '${vo.hospital_address}',
						 tel: '${vo.hospital_phone}',
						 working: '${vo.hospital_time}'
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
	
	if ("geolocation" in navigator) {	/* geolocation 사용 가능 */
		
		navigator.geolocation.getCurrentPosition(function(position) {	
        
		var lat = position.coords.latitude, // 위도
           	lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">내 위치</div>'; // 인포윈도우에 표시될 내용입니다
        
      		// 지도 중심을 부드럽게 이동시킵니다	            
            map.panTo(locPosition);            
            
            // 마커와 인포윈도우를 표시합니다
        	displayMarker2(locPosition, message);
 
      });
    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..';
 	
	    displayMarker2(locPosition, message);
	    
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
$(function() {
	$('#b1').click(function() {
		$.ajax({
			url: "list4",
			success: function(str) {
				$('#result').text(str)
				if(str == 'list123'){
					$('#result').append("list4 일치 : " + str)
				}else {
					$('#result').append("list4 일치X : " + str)
				}
			}
			
		})
	})
})

</script>
  
<body>	
 <div id="tablelist3" style="display:flex;padding:10px;">
	<table border="1" width="99%">
	    <tr bgcolor="gray">
	        <td>id</td>
	        <td>병원명</td>	        
	        <td>주소</td>		        
	        <td>전화번호</td>
	        <td>홈페이지</td>
	        <td>운영시간</td>
	        <td>휴일</td>		        
	    </tr>
	<c:forEach items="${list3}" var="vo">
	    <tr>
	        <td>${vo.hospital_id}</td>		        
	        <td>${vo.hospital_name}</td>
	        <td>${vo.hospital_address}</td>
	        <td>${vo.hospital_phone}</td>
	        <td><a href="${vo.hospital_link}" target=_blank> ${vo.hospital_link} </a></td> 	              
	        <td>${vo.hospital_time}</td>
	        <td>${vo.hospital_off}</td>  
		</tr>
	</c:forEach>
 </table>
</div>
	 	
	<br>	
<div id="tablelistpages3" style="display:flex;padding:10px;">		
	<span>전체 페이지 수 : ${pages}개 ,	전체 게시물 수 : ${count}개  </span> <br>	
 	<a href="list3?page=<%=1%>&keywordSearch1=${keywd}"> 	
		<button style="background:#e8e6f0"> First </button>
	</a>
	 
	<%
	PageVO vo = (PageVO)request.getAttribute("page");	
	System.out.println(vo.toString());
	int lastIndex = 0;
	lastIndex = (int)request.getAttribute("pages");
	int startIndex = 0;
	
	System.out.println("0. lastIndex: " + lastIndex + " getstart: " + vo.getStart() + " getend: " + vo.getEnd() + " getpage: " + vo.getPage());
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
		<a href="list3?page=<%=v%>&keywordSearch1=${keywd}">	 
			<button style="background:#cceb34"><%=v%></button>
		</a>
	<%	
	}
	%>
	<% int last = (int)request.getAttribute("pages"); %>
 	<a href="list3?page=<%=last%>&keywordSearch1=${keywd}">
		<button style="background:#d3cfe3"> Last </button>
	</a>
  </div>

 	<br>
 	<div id="tablelistpagesnums3" style="display:flex;padding:10px;">	
    <span> 현재 페이지: ${page.page}, 전체 페이지: ${pages}개 ,	전체 게시물 수: ${count}개  </span> <br>		
	</div>
 </body>
</html>