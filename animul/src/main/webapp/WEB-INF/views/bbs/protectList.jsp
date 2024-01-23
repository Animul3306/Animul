<%@ page import="java.util.List"%>
<%@ include file="/WEB-INF/views/common/header2.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<html>
<head>
<meta charset="UTP-8">
<title>Insert title here</title>
<link href="../resources/css/bbs/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script>
var value;
var uprSelect;

function showSlides(n) {
    var currentPage = location.href;
    var index = currentPage.indexOf("page=");

    if (index != -1) {
        var page = parseInt(currentPage.substring(index + 5, currentPage.length));
        uprSelect = document.getElementById("upr");
        value = uprSelect.options[uprSelect.selectedIndex].value;
        
        console.log("uprSelect" + uprSelect);
        console.log("value = " + value);
        console.log("page = " + page);
        location.href = "protectList?upr_cd=" + value + "&page=" + (page + n);
        
    } else if (n != -1) {
    	uprSelect = document.getElementById("upr");
    	value = uprSelect.options[uprSelect.selectedIndex].value;
    	console.log("uprSelect" + uprSelect);
        console.log("value = " + value);
        console.log("page = " + page);
    	location.href = "protectList?upr_cd=" + value + "&page=" + (n + 1);
        
        
    }
}

function selectUpr() {
    uprSelect = document.getElementById("upr");
    value = uprSelect.options[uprSelect.selectedIndex].value;
    
    console.log(value);
    
    //location.href = "protectList?upr_cd=" + value ;

    
    
/*      const len = uprSelect.options.length;
    
    for (let i=0; i<len; i++){  
      	//select box의 option value가 입력 받은 value의 값과 일치할 경우 selected
        if(uprSelect.options[i].value == value){
        	console.log("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ");
        	uprSelect.options[i].selected = true;
        }
      }  
    value2 = uprSelect.options[uprSelect.selectedIndex].value; */
    
    //console.log(value2); 
  
    
}

</script>
</head>
<body>


	<div id="container">
		<div class="wid1300">
			<div id="lm" class="cs">
				<h2 class="lm-tit">
					<span>Community</span> <strong>커뮤니티</strong>
				</h2>
				<ul id="snb">
					<li><a href="/animul/bbs/freeList">자유 토크</a></li>
					<li><a href="/animul/bbs/localList">산책 메이트ㆍ멍냥이 찾기</a></li>
					<li><a href="/animul/bbs/protectList">유기동물보호센터 보호중</a></li>
					<li><a href="/animul/bbs/shelterList">유기동물보호센터 보호소 </a></li>
				</ul>
				<div style="padding-top: 20px;"></div>
			</div>

			<div id="contents">
				<div class="pt-titarea">
					<h3 class="tit">유기동물보호센터 보호중</h3>
					<p>전국 유기동물 보호센터에 보호중인 동물들 입니다.</p>
				</div>
				<form action="protectList" method="get">
				<div class="hd-sch">
					<div class="hd">지역 검색</div>
					<div class="bd">
				<select id="upr" name="upr_cd" class="input" onchange="selectUpr()">
			    <%
			        // 백엔드에서 전달받은 upr_cd 값을 얻어오기
			        String uprCdFromBackend = (String) request.getAttribute("upr_cd");
			
			        // 옵션 리스트 정의
			        String[][] options = {
			            {"6110000", "서울특별시"},
			            {"6260000", "부산광역시"},
			            {"6270000", "대구광역시"},
			            {"6280000", "인천광역시"},
			            {"6290000", "광주광역시"},
			            {"5690000", "세종특별자치시"},
			            {"6300000", "대전광역시"},
			            {"6530000", "울산광역시"},
			            {"6430000", "경기도"},
			            {"6440000", "강원특별자치도"},
			            {"6540000", "충청북도"},
			            {"6460000", "충청남도"},
			            {"6470000", "경상북도"},
			            {"6480000", "경상남도"},
			            {"6500000", "제주특별자치도"}
			        };
			
			        // 옵션 리스트를 돌며 각각의 옵션에 대한 HTML 코드 생성
			        for (String[] option : options) {
			            String value = option[0];
			            String label = option[1];
			
			            // upr_cd 값과 현재 옵션의 value 값이 일치하는지 확인하여 selected 속성 추가
			            String selectedAttribute = (uprCdFromBackend != null && uprCdFromBackend.equals(value)) ? "selected" : "";
			    %>
			    <option value="<%= value %>" <%= selectedAttribute %>><%= label %></option>
			    <%
			        }
			    %>
				</select>
					
							
					</div>

					<div class="bt">
						<button type="submit" style="cursor: pointer;"
							class="btn btn-sm btn-blue">조회하기</button>
					</div>
			 </form>
					 
					<div class="pro-lst" style="border-top:#E8EDF0 1px solid; margin-top:10px; padding-left:20px;">
					<c:forEach items="${list}" var="vo" >
                        <div class="probx">
                            <a href="${pageContext.request.contextPath}/bbs/protectOne?desertionNo=${vo.desertionNo}">
                                <span class="thumb">
                                <img src="${vo.popfile}" alt="" style="width:315px;height:315px;"></span>
                                <div class="row">
	                                <span>발견 날짜</span>
	                                <span>${vo.happenDt}</span>
        						</div>
        						<div class="row">
	                                <span>발견 장소</span>
	                                <span>${vo.happenPlace}</span>
                                </div>
                                <div class="row">
	                                <span>품종</span>
	                                <span>${vo.kindCd}</span>
                                </div>
                                <div class="row">
	                                <span>성별</span>
	                                <span>${vo.sexCd}</span>
                                </div>
                                <div class="row">
	                                <span>특징</span>
	                                <span>${vo.specialMark}</span>
                                </div>
                                <div class="row">
	                                <span>상태</span>
	                                <span>${vo.processState}</span>
                                </div>
                                <div class="row">
	                                <span>보호센터</span>
	                                <span>${vo.careNm}</span>
                                </div>
                                

                            </a>
                		</div>
                		</c:forEach>
                	</div>	
                	
                	
                	
                	<div class="paging" style="padding-top:20px">
                		<a onclick="showSlides(-1)" class="direction prev">&#10094;</a>
                		<a onclick="showSlides(1)" class="direction next">&#10095;</a>
				
				
				<%-- <c:choose>
					<c:when test="${paging.page<=1}">
					<span><a class="direction prev"></a></span>
					</c:when>
					<c:otherwise>
						<a href="protectList?page=${paging.page-1}" class="direction prev">[이전]</a>
						
						
					</c:otherwise>
				</c:choose>
				
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
					var="i" step="1">
					<c:choose>
						<c:when test="${i eq paging.page}">
							<span>${i}</span>
						</c:when>

						<c:otherwise>
							<a href="protectList?page=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${paging.page>=paging.maxPage}">
						<span><a class="direction next"></a></span>
					</c:when>
					<c:otherwise>
						<a href="protectList?page=${paging.page+1}" class="direction next">[다음]</a>
					</c:otherwise>
				</c:choose>
				
			</div>
			 --%>
       

	
</body>
</html>