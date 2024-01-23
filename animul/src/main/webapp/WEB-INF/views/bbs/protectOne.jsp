<%@ include file="/WEB-INF/views/common/header2.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTP-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../resources/css/bbs/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<style>
</style>
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
					<li><a href="/animul/bbs/shelterList">유기동물보호센터 봉사관련</a></li>
				</ul>
				<div style="padding-top: 20px;"></div>
			</div>

			<div id="contents">
				<div class="pt-titarea">
					<h3 class="tit">유기동물 보호센터 보호중</h3>
					<p>유기동물 보호센터에 보호중인 유기동물 상세정보입니다.</p>
				</div>
				<div class="vew-wr">
					<h4 class="subject"></h4>
					
						<div class="top1">
							<div class="img-container">
       			          <img src="${vo.popfile}">
                                </div>
                                <div class="description1">
                                	<div class="noticeNo1">
                                	<span>공고번호</span>
                                	<span>${vo.desertionNo}</span>
                                	</div>
                                <div class="table1">
                                <div class="row1">
	                                <span>발견 날짜</span>
	                                <span>${vo.happenDt}</span>
        						</div>
        						<div class="row1">
	                                <span>발견 장소</span>
	                                <span>${vo.happenPlace}</span>
                                </div>
                                <div class="row1">
	                                <span>품종</span>
	                                <span>${vo.kindCd}</span>
                                </div>
                                <div class="row1">
	                                <span>성별</span>
	                                <span>${vo.sexCd}</span>
                                </div>
                                <div class="row1">
	                                <span>나이</span>
	                                <span>${vo.age}</span>
                                </div>
                                <div class="row1">
	                                <span>특징</span>
	                                <span>${vo.specialMark}</span>
                                </div>
                                <div class="row1">
	                                <span>상태</span>
	                                <span>${vo.processState}</span>
                                </div>
                                <div class="row1">
	                                <span>보호센터</span>
	                                <span>${vo.careNm}</span>
                                </div>
                                <div class="row1">
	                                <span>보호센터 TEL</span>
	                                <span>${vo.careTel}</span>
                                </div>
                                <div class="row1">
	                                <span>보호센터 위치</span>
	                                <span>${vo.careAddr}</span>
                                </div>
                               
                             </div>
                             </div>
 						</div>
   					
					</div>
					<div class="btn-box">
               			<a href="protectList" class="btn btn-gray wide">목록</a>
          		 	</div>
				</div>
	

	


        
            </div><!-- /wid1300 -->
             
        </div>
   

</body>
<script>


	
</script>
</html>