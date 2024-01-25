<%@page import="com.multi.animul.retrieve.RetrieveVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.box {
	border: 5px solid darkblue;
	width: 300px;
	margin: 10%;
	padding: 5%;
	background: skyblue;
}
</style>
<title>Insert title here</title>
<script>
	function showSlides(n) {
		var currentPage = location.href;
		var index = currentPage.indexOf("page=");

		if (index != -1) {
			var page = parseInt(currentPage.substring(index + 5,
					currentPage.length));

			location.href = "retrieveDetail?symptom_id=?page=" + (page + n);
		} else if (n != -1) {
			location.href = "retrieveDetail?symptom_id=" + (n + 1);
		}
	}
</script>
</head>
<%
	List<RetrieveVO> list = (List<RetrieveVO>) request.getAttribute("list");
int result = 0;
if (list != null) {
	result = list.size();
}
%>
<body>
	<%
		if (result > 0) {

		for (RetrieveVO bag : list) {
	%>


	<!-- <div style="border: 1px solid gold; float: left; width: 25%;" class="box"> -->
	<div style="display: inline-block" " class="box">
		<h2><%=bag.getResult_id()%>
			<%=bag.getResult()%></h2>
		<br>

		<h2>증상 특징</h2>
		<br>
		<%=bag.getResult_text()%>
	</div>

	<!-- <div style="border: 1px solid gold; float: left; width: 30%;"> -->
	 
	<div style="display: inline-block">
		   <img
			src="${pageContext.request.contextPath}/resources/img/retrieve/<%=bag.getImg()%>" />
	</div>

	    
	      
		<%
 	}
 %>
		<%
			}
		%>
	
</body>
</html>