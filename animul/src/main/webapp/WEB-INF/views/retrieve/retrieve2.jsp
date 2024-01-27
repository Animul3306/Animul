<%@page import="com.multi.animul.retrieve.SymptomVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="../resources/css/bbs/style.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<%
	String result = "";
List<SymptomVO> list = null;

if (request.getAttribute("list") != null) {

	list = (List<SymptomVO>) request.getAttribute("list");
%>

<%
	for (SymptomVO bag : list) {

	result = result + "<tr><td>" + bag.getRegion_text() + "<td><a href='retrieveDetail?symptom_id="
	+ bag.getSymptom_id() + "'>" + bag.getSymptom_text() + "</a></tr></td>";
}
}
%>
<!-- 일단 빨리떠라 -->
<body>
	<div id="container">
		<div class="wid1300">
			<div id="lm" class="cs">
				<h2 class="lm-tit">
					<span>?</span> <strong>보험&질병</strong>
				</h2>
				<ul id="snb">
					<li><a href="insurance"> 보험</a></li>
					<li><a href="retrieve2">질병 검색</a></li>
				</ul>
				<div style="padding-top: 20px;"></div>
			</div>

			<div id="contents">
				<div class="pt-titarea">
					<h3 class="tit">질병 검색</h3>
					<p>강아지의 건강은 견주님들의 건강이라고 생각합니다.<br>
					진단 후 병원가서 신속 검사 및 자가진단 부탁드립니다.</p>
				</div>

				<div class="hd-sch">
					<div class="hd">부위</div>
					<div class="bd"></div>
					<div class="bt">
						<a href="retrieveRegion?region_id=1"><button
								style="cursor: pointer;" class="btn btn-sm btn-blue">눈
								이상</button></a> <a href="retrieveRegion?region_id=2"><button
								style="cursor: pointer;" class="btn btn-sm btn-blue">코
								이상</button></a> <a href="retrieveRegion?region_id=3"><button
								style="cursor: pointer;" class="btn btn-sm btn-blue">다리
								이상</button></a> <a href="retrieveRegion?region_id=4"><button
								style="cursor: pointer;" class="btn btn-sm btn-blue">숨
								소리이상</button></a> <a href="retrieveRegion?region_id=5"><button
								style="cursor: pointer;" class="btn btn-sm btn-blue">귀 이상
								이상</button></a>
					</div>



				</div>






				<table class="list">
					<%=result%>
				</table>
			</div>
		</div>
</body>
</html>