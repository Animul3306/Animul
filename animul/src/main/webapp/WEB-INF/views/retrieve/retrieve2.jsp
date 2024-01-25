<%@page import="com.multi.animul.retrieve.SymptomVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
/* div#side_left {
	width: 200px;
	height: 400px;
	background-color: skyblue;
	float: left;
	margin: 5px;
}

#side_left2 {
	width: 200;
	height: 700;
	background-color: skyblue;
	float: left;
	margin: 5px;
}

#mid_content {
	width: 400px;
	height: 400px;
	background-color: skyblue;
	float: left;
	margin: 5px;
}

#side_content_box {
	display: inline;
	background-color: skyblue;
	margin: 5px;
}

#side_rigth {
	width: 200px;
	height: 400px;
	background-color: skyblue;
	float: left;
	margin: 5px;
}

#side_rigth_box {
	width: 95%;
	height: 45%;
	background-color: skyblue;
	margin: 5px;
	margin-top: 95%;
} */
a {
  text-decoration: none;
}
</style>
</head>
<%
	List<SymptomVO> list = (List<SymptomVO>) request.getAttribute("list");
int result = 0;
if (list != null) {
	result = list.size();
}
%>

<%
	String result1 = "";
String result2 = "";
String result3 = "";

for (SymptomVO bag : list) {

	int region_id = bag.getRegion_id();
	if (region_id == 1) { //"눈 이상" //<a href='retrieve2?symptom_id=4'>
		result1 = result1 + "<tr><td><a href='retrieveDetail?symptom_id=" + bag.getSymptom_id() +"'>" +  bag.getSymptom_text() + "</a></tr></td>";

	} else if (region_id == 2) { //"코 이상"
		result2 = result2 + "<tr><td><a href='retrieveDetail?symptom_id=" + bag.getSymptom_id() +"'>" + bag.getSymptom_text() + "</a></tr></td>";
	} else if (region_id == 3) { //"다리 이상"
		result3 = result3 + "<tr><td><a href='retrieveDetail?symptom_id=" + bag.getSymptom_id() +"'>" + bag.getSymptom_text() + "</a></tr></td>";
	}
}
%>
<!-- 일단 빨리떠라 -->
<body>

	<div><h2>
		눈이상</h2>
		<table border="1" width ="200" >
			<%=result1%>
		</table>
	</div>

	<div><h2>
		코이상</h2>
		<table border="1" width ="200"  >
			<%=result2%>
		</table>
	</div>
	<div><h2>
		다리이상</h2>
		<table border="1" width ="200"  >
			<%=result3%>
		</table>
	</div>

</body>
</html>