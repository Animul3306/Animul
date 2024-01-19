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


	<div style="border: 1px solid gold; float: left; width: 33%;" class="box">

		<h2><%=bag.getResult_id()%>
			<%=bag.getResult()%></h2>
		<br>

		<h2>증상 특징</h2>
		<br>
		<%=bag.getResult_text()%>
</div>

	<div style="border: 1px solid gold; float: left; width: 33%;">
	 <img src="${pageContext.request.contextPath}/resources/img/retrieve/<%=bag.getImg()%>" width ="400"/>
	</div>
	
	<%
		}
	%>

	<%
		}
	%>


</body>
</html>