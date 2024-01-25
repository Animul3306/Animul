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

.list {
	font-weight: bold; 
	font-size: 2em;
}

.col ui {
  width: 50%;
  list-style-type: none;
}


.col li {
  list-style-type: none;
  font-weight: bold; 
}

a {
  position: relative;
  font-size: 16px;
  text-decoration: none;
  color: #000;
  transition: all 0.2s;
}

.col li a:hover {
  color: #01c9ca;  
}

.col li a:before {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  display: block;
  width: 100%;
  height: 1px;
  background: #000;
  transform: scale(0);
  transition: all 0.2s;
}

.col li a:hover:before {
  background: #01c9ca;
  transform: scale(1);
}
</style>
<div class="col">
	<ul>
		<li>
			<div class="list" >검진 · 접종</div>
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
			<div class="list" >치료</div>
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
			<div class="list" >수술</div>
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