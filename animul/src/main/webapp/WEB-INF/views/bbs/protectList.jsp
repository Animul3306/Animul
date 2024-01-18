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
					<h3 class="tit">유기동물보호센터 보호중..</h3>
					<p>전국 유기동물 보호센터에 보호중인 동물들 입니다.</p>
				</div>
				<form action="" method="get">
				<div class="hd-sch">
					<div class="hd">게시글 검색</div>
					<div class="bd"> 
					
					<select name="type" class="input">
							<option value="title"
								<c:if test="${Type eq 'title'}">selected</c:if>>제목</option>
							<option value="content"
								<c:if test="${Type eq 'content'}">selected</c:if>>내용</option>
							<option value="title_content"
								<c:if test="${Type eq 'title_content'}">selected</c:if>>제목+내용</option>
							<option value="writer"
								<c:if test="${Type eq 'writer'}">selected</c:if>>작성자</option>
						</select> <input type="text" class="input" name="word"
							placeholder="검색어를 입력 하세요." style="width: 250px;"
							value="" />
							
					</div>

					<div class="bt">
						<button type="submit" style="cursor: pointer;"
							class="btn btn-sm btn-blue">조회하기</button>
					</div>
					 
					<div class="pro-lst" style="border-top:#E8EDF0 1px solid; margin-top:10px; padding-left:20px;">
					<c:forEach items="${list}" var="vo" >
                        <div class="probx">
                            <a href="${vo.desertionNo}" target="_blank">
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

                            </a>
                		</div>
                		</c:forEach>
                	</div>	
                	
       
 <%--      				 <c:forEach items="${list}" var="vo" >
						<tr class="">
							<td>${vo.desertionNo}</td>
							<td><src="${vo.filename}"></td>
							<td>${vo.happenDt}</td>
							<td>${vo.happenPlace}</td>
							<td>${vo.kindCd}</td>
							<td>${vo.age}</td>
							<td>${vo.weight}</td>
							<td>${vo.noticeSdt}</td>
						</tr>
					</c:forEach> --%>
	
</body>
</html>