<%@ page import="java.util.List"%>
<%@ include file="/WEB-INF/views/common/header2.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTP-8">
<title>Insert title here</title>
<link href="../resources/css/bbs/style.css" rel="stylesheet">
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
					<h3 class="tit">자유 토크</h3>
					<p>마이펫 자랑, 고민 등 자유롭게 작성하는 게시판 입니다!!</p>
				</div>
				<form action="freeListSearch" method="get">
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
							value="${paging.word}" />
							
					</div>

					<div class="bt">
						<button type="submit" style="cursor: pointer;"
							class="btn btn-sm btn-blue">조회하기</button>
					</div>
					<table class="list">
					<colgroup>
						<col style="width: 80px;">
						<col style="width: 140px;">
						<col>
						<col style="width: 65px;">
						<col style="width: 100px;">
						<col style="width: 100px;">
						<col style="width: 80px;">
						<col style="width: 80px;">
					</colgroup>
					<thead>
						<tr>
							<th class="noBrd">No</th>
							<th>분류</th>
							<th colspan="2">제목</th>
							<th>작성자</th>
							<th>날짜</th>
							<th>댓글수</th>
							<th>조회수</th>
						</tr>
					</thead>
</body>
</html>