<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;600;700&display=swap" rel="stylesheet">
<style>

body {
    font-family: Noto Sans KR;
}

.col ui {
  width: 50%;
  list-style-type: none;
}


.col li {
  list-style-type: none;
}
</style>
<div class="col">
	<ul>
		<li>
			<div  style="font-weight: bold; font-size: 2em" >검진 · 접종</div>
			<hr>
		</li>
	<c:forEach var="x" items="${diagnosisList}">
		<c:if test="${x.diagnosis_category eq '검진 · 접종'}">
			<li>
			<a href="diagnosisOne?diagnosis_name=${x.diagnosis_name}">${x.diagnosis_name}</a>
			</li>
		</c:if>
	</c:forEach>
	</ul>
</div>
<div class="col">
	<ul>
		<li>
			<div  style="font-weight: bold; font-size: 2em" >치료</div>
			<hr>
		</li>
	<c:forEach var="x" items="${diagnosisList}">
		<c:if test="${x.diagnosis_category eq '치료'}">
			<li>
			<a href="diagnosisOne?diagnosis_name=${x.diagnosis_name}">${x.diagnosis_name}</a>
			</li>
		</c:if>
	</c:forEach>
	</ul>
</div>
<div class="col">
	<ul>
		<li>
			<div  style="font-weight: bold; font-size: 2em" >수술</div>
			<hr>
		</li>
	<c:forEach var="x" items="${diagnosisList}">
		<c:if test="${x.diagnosis_category eq '수술'}">
			<li>
			<a href="diagnosisOne?diagnosis_name=${x.diagnosis_name}">${x.diagnosis_name}</a>
			</li>
		</c:if>
	</c:forEach>
	</ul>
</div>