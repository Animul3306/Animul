<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Animul [동물병원/동물용품점/동물보호센터]</title>

<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
.map_wrap2 {position:relative;width:100%;height:700px;}
.title {font-weight:bold;display:block;}
.hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
#centerAddr2 {display:block;margin-top:2px;font-weight: normal;}
.bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.region {padding:15px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}


.tooltip {
  position: fixed;
  padding: 10px 20px;
  border: 1px solid #b3c9ce;
  border-radius: 4px;
  text-align: center;
  font: italic 14px/1.3 sans-serif;
  color: #333;
  background: #fff;
  box-shadow: 3px 3px 3px rgba(0, 0, 0, .3);
}

p.groove {border-style: groove;}
   
</style>
<!--   <link href="../resources/css/map/map.css" rel="stylesheet"> -->   
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>

<body>
	<div>

	</div>
	<div class="login_group">
		<label id="notice_move" style="color:#ff8080"></label>
	<!-- 	<button id="toggle">kakao.map.status</button> -->						
		<select id="kakaoStatus" onchange="movetoDB()">
			<option value="OK">OK</option>
			<option value="NG">NG</option>
		</select>
			
		<a id="link_b" href="list2" data-tooltip="데이터베이스 사용하는 지도로 이동합니다."> DB Data Map Link </a>
	</div>
 	
<table>
	
	<tr>
	<div id="map_wrap2" class="bg_white">	        
        <div class="hAddr">
       		<span class="title"></span>
       		<span id="centerAddr2"></span>
       		<span id="latlang"></span>
   		</div>
  	</div>
	</tr>
	
	<div style="display:flex;padding:10px;">
	<form name="curPositionAddr">
		<label>검색 위치: </label>
		<label id="centerAddr"></label>
	</form>
	</div>
 	<tr>
 	<div style="width:380px;border:3px solid lightgray;padding:10px; margin:5px;">
  
	<form name="RadioForm">	 
		<input type="radio" name="radiokeyword" value="동물병원" onclick="SearchAddingWord()" checked />
		<label>동물병원</label>	
		<input type="radio" name="radiokeyword" value="반려동물용품" onclick="SearchAddingWord()"/>
		<label>펫샾</label>	
		<input type="radio" name="radiokeyword" value="동물보호" onclick="SearchAddingWord()"/>
		<label>동물보호센터</label>
	</form>
  <br>
	<form onsubmit="RegionClass(); return false;">
		<select name="addressRegion" id="addressRegion1"></select>
		<select name="addressDo" id="addressDo1"></select>
		<select name="addressSiGunGu" id="addressSiGunGu1"></select>
		<button type="submit">지역검색</button>
	</form> 
	 
	</div>
		 	
	<div class="map_wrap" style="display:flex;padding:10px;">
	
	    <div id="map4" style="width:99%;height:100%;overflow:hidden;"></div>

	    <div id="menu_wrap" class="bg_white">
	        <div class="option">
	            <div>
                	<form onsubmit="searchPlaces(); return false;">
	                 키워드 : <input type="text" id="keyword" value="" size="15"> 
	                	    <button type="submit">검색하기</button> 
	                </form>	 
	            </div>
	        </div>	        
	        <hr>
	        <ul id="placesList"></ul>
	        <div id="pagination"></div>
	    </div>
	</div>
</table>	
	<br><br>

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
	var searchaddingkeyword = "동물병원";
	SearchAddingWord();
	
	function movetoDB() {
		var result={}
		const status1 = document.getElementById('kakaoStatus');
		result.status1 = status1.options[status1.selectedIndex].value;
		
		if(result.status1 == 'NG') {
			setTimeout("location.href='list2?page=1'",3000);
			document.getElementById("notice_move").innerText = "3초 후 DB를 사용하는 지도로 이동합니다." 		
		}		
	}
	
	function RegionClass(){
		var inputData = document.getElementById("addressDo1").value;
		inputData += " ";
		inputData += document.getElementById("addressSiGunGu1").value;
		inputData += " " + searchaddingkeyword;
		searchPlaces2(inputData);
		document.getElementById('keyword').value = "";
	}
 
	function SearchAddingWord(){
		searchaddingkeyword = document.querySelector('input[name="radiokeyword"]:checked').value;
//		alert(searchaddingkeyword);
	}
 
	// map4 지도 
	// 검색 리스트 
	// 마커를 담을 배열입니다
	var markers = [];

	/////////////////////////////////////////////////////////////////////////////////
	var mapContainer4 = document.getElementById('map4'), // 지도를 표시할 div 
    mapOption4 = {
	//	center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
    	center: new kakao.maps.LatLng(37.566826, 126.9786567),
        level: 4 // 지도의 확대 레벨
    };

// 지도를 생성합니다
	var map4 = new kakao.maps.Map(mapContainer4, mapOption4);
		
	if(map4) {
		console.log(map4);
	}else {
		setTimeout("location.href='list2?page=1'",3000);
		document.getElementById("notice_move").innerText = "3초 후 DB를 사용하는 지도로 이동합니다."
	}
		
	if ("geolocation" in navigator) {	/* geolocation 사용 가능 */
		
		navigator.geolocation.getCurrentPosition(function(position) {	
        
		var lat = position.coords.latitude, // 위도
           	lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">현재 위치 (주변지역 마우스 원클릭 검색 click ) </div>'; // 인포윈도우에 표시될 내용입니다
        
         		// 지도 중심을 부드럽게 이동시킵니다	            
            map4.panTo(locPosition);            
            
            // 마커와 인포윈도우를 표시합니다
        	displayMarker(locPosition, message);
    
      });
    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..';
 	
	    displayMarker(locPosition, message);
	    
	}
	
	function displayMap(lat, lon) {
        
		map4.setLevel(4, {
			anchor: new kakao.maps.LatLng(lat, lon)
		});
		
		var moveLatLon = new kakao.maps.LatLng(lat, lon);
        
        // 지도 중심을 부드럽게 이동시킵니다
        // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
        map4.panTo(moveLatLon); 
        
	}
	
	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {
	
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({  
	        map: map4, 
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
	    infowindow.open(map4, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map4.setCenter(locPosition);    
	    
	}
	/////////////////////////////////////////////////////////////////////////////////
 
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  
	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	// 키워드로 장소를 검색합니다
	//	searchPlaces(); 
	//	CurrentLocation();
	/////////////////////////////////////////////////////////////////////////////////////
	// 지동 이동 주소 반환 //
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

	var marker2 = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	infowindow2 = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

	//현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	searchAddrFromCoords(map4.getCenter(), displayCenterInfo);
 	
	//지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map4, 'click', function(mouseEvent) {
	searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	    	
	    	var detailLat = mouseEvent.latLng.getLat(),
	    		detailLng = mouseEvent.latLng.getLng()
	    	
	        var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	        detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
			detailLatlng = '<span class="latlng"> 위도: </span>' + detailLat + 
           					'<span class="latlang"> 경도: </span>' + detailLng + '</div>' +
           					'<span class="latlang"> </span>' + mouseEvent.latLng + '</div>';
  
	        var content = '<div class="bAddr">' +
	                        '<span class="title">클릭 위치 주소</span>' + 
	                        detailAddr + 
	                    '</div>';
	      
	        // 마커를 클릭한 위치에 표시합니다 
	        marker2.setPosition(mouseEvent.latLng);
	        marker2.setMap(map4);
	
	        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	        infowindow2.setContent(content);
	        infowindow2.open(map4, marker2);
	        
	        // 상세 주소와 상세 위도경도 정보를 함수로 전달합니다
	        info_win(detailLatlng);
	        inputTextAddr(result[0].address.address_name);
	        
			panTo(detailLat, detailLng);
			
			var addr = result[0].address.address_name + searchaddingkeyword;
	
			searchPlaces2(addr);
		//	searchPlaces();
	    }   
	  });
	});
 
	//지도를 (클릭)드래그했을 때 (중심) 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map4, 'click', function() {
		var message = map4.getCenter().toString();
		console.log(message);

		searchDetailAddrFromCoords(map4.getCenter(), function(result, status) {
	    if (status === kakao.maps.services.Status.OK)
	    {
	    	var detailLat = map4.getCenter().getLat().toString(),
	    		detailLng = map4.getCenter().getLng().toString();
	    	
	        var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	        detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
			detailLatlng = '<span class="latlng"> 위도2: </span>' + detailLat + 
           					'<span class="latlang"> 경도2: </span>' + detailLng + '</div>';
  
	        var content = '<div class="bAddr">' +
	                        '<span class="title">클릭 위치 주소</span>' + 
	                        detailAddr +
	                    '</div>';
		//	console.log(content);
			
	        // 마커를 클릭한 위치에 표시합니다 
	        marker2.setPosition(map4.getCenter());
	        marker2.setMap(map4);
	
	        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	        infowindow2.setContent(content);
	        infowindow2.open(map4, marker2);

	        inputTextAddr(result[0].address.address_name);
	        //setCenter(detailLat, detailLng);
			panTo(detailLat, detailLng);
			
			var addr = result[0].address.address_name + searchaddingkeyword;
			console.log("drag : " + addr);
			searchPlaces2(addr);
	    }   
	  });
	});
 
	function inputTextAddr(addr) {
		document.getElementById('keyword').value = addr;
	}
    function panTo(lat, lon) {
        // 이동할 위도 경도 위치를 생성합니다 
        var moveLatLon = new kakao.maps.LatLng(lat, lon);
       
        // 지도 중심을 부드럽게 이동시킵니다
        // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
        map4.panTo(moveLatLon);            
    }   
	
    function setCenter(lat, lng) {   
        // 이동할 위도 경도 위치를 생성합니다 
        var moveLatLon = new kakao.maps.LatLng(lat, lng);
        
        // 지도 중심을 이동 시킵니다
        map4.setCenter(moveLatLon);
    }
    
	function info_win(detail) {
		console.log(detail);	
	}
 
	//중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map4, 'idle', function() {		
		searchAddrFromCoords(map4.getCenter(), displayCenterInfo);
	});
	
	function searchAddrFromCoords(coords, callback) {
	// 좌표로 행정동 주소 정보를 요청합니다
		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}
	
	function searchDetailAddrFromCoords(coords, callback) {
	// 좌표로 법정동 상세 주소 정보를 요청합니다 
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
	
	//지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
		if (status === kakao.maps.services.Status.OK) {
		    var infoDiv = document.getElementById('centerAddr');
			var infoDiv2 = document.getElementById('keyword').textContent;
			
		    for(var i = 0; i < result.length; i++) {
		        // 행정동의 region_type 값은 'H' 이므로
		        if (result[i].region_type === 'H') {
		            infoDiv.innerHTML = result[i].address_name;
		            infoDiv2.innerHTML = result[i].address_name;		           	
		            break;
		        }
		    }		    
		}   		
	}
	// 지도 이동 주소 반환 //		
	///////////////////////////////////////////////////////////////////////////////////////

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
	//	document.getElementById('keyword').value = document.getElementById('centerAddr').innerText;
	//	document.getElementById('keyword').value+= " " + searchaddingkeyword;
		
	    var keyword =  document.getElementById('keyword').value + " " +
	    				document.getElementById('centerAddr').innerText;
					
	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
		console.log(keyword);
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB);		    
	}
	
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces2(place) {
		
	    var keyword2 = place;
	 	console.log(keyword2);
	    if (!keyword2.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
 		
	    // 서울시 강남구 지도 중심 클릭.
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다.
	    ps.keywordSearch( keyword2, placesSearchCB);
	    
	}
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {

	    if (status === kakao.maps.services.Status.OK) {
					    					
	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);

	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);
	
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
	     //   alert('검색 결과가 존재하지 않습니다.');
	        return;
	
	    } else if (status === kakao.maps.services.Status.ERROR) {
	
	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;
	
	    }
	}
	
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    var infoEl = document.getElementById('info');
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
	            
	            var placeDetail = '<div style="padding:10px;z-index:1;">' + '<h5>' + places[i].place_name + '</h5>' + '<br>' +
	            							places[i].address_name + '<br>' +
	            							places[i].phone + '</div>';
	          //  console.log("place detail:" + placeDetail);

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
		
	        // 지도 마커를 클릭-마우스업 했을 때.
	         (function(marker, places1) {
	        	// 	console.log(places1.place_name + '<br> ' + places1.place_url);
	    		    var content =  places1.place_name + '<br> ' + places1.address_name + '<br> ' + places1.phone +  ' ';	
	    		    var placeUrl = places1.place_url;
		            kakao.maps.event.addListener(marker, 'mouseup', function() {
		            	// 맵의 팝업창
		            	displayInfowindow2(marker, content, placeUrl);
		            });
		            // 리스트 작동
		            itemEl.onmouseover =  function () {			              
		                event.target.style.color = "#fbdd97";
		            };
		            itemEl.onmouseout =  function () {			              
		                event.target.style.color = "#000000";
		            };	
	         })(marker, places[i]);

	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	        	// 맵 마커
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);		                
	            });
	
	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	            //    infowindow.close();
	            });

	         	// 리스트 항목
	           itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	                event.target.style.color = "#fbdd97";
	            };
	
	            itemEl.onmouseout =  function () {
	                infowindow.close();
	                event.target.style.color = "#000000";
	            };		            

	        })(marker, places[i].place_name);
	
	        fragment.appendChild(itemEl);
	    }
	
	    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map4.setBounds(bounds);
	}
	// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
		var linkId = places.place_url.substring(places.place_url.lastIndexOf('/')+1, places.place_url.length);

	    var el = document.createElement('li'),

	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';

	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }	

	    itemStr += '  <span class="tel">' + places.phone  ;
	    itemStr += '<a href=https://map.kakao.com/link/to/' + linkId + ' target=_blank rel=noopener noreferrer>' + " 길찾기 클릭" + '</a>' + '</span>' +
		'</div>';
	//	console.log(itemStr);
	    el.innerHTML = itemStr;
	    el.className = 'item';
	
	    return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
	    marker.setMap(map4); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
	    return marker;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	
	    infowindow.setContent(content);
	    infowindow.open(map4, marker);
	}

	function displayInfowindow2(marker, detail, url) {
		
		var linkId = url.substring(url.lastIndexOf('/')+1, url.length);
		console.log(linkId);
 	    var content = '<div style="padding:5px;z-index:1;">' + detail + '</div>';
 	   	var content2 = '<div style="background-color:yellow;text-decoration:underline;text-decoration-color:blue;padding:5px;z-index:1;">' +	 	   					
 	   					'<a href=https://map.kakao.com/link/to/' + linkId + ' target=_blank rel=noopener noreferrer>' + " 길찾기 클릭" + '</a>' + '</div>';
	    infowindow.setContent(content+content2);
	    infowindow.open(map4, marker);
	}

	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
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

</script>
 

</body>
</html>