<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
	<style>
	h3 {
  background-color: lightblue;
  }
  p {
  font-size =50px
}
	</style>
</head>
<body>
<br>
<h3 align= "center">어서오세요 애니멀입니다 어떤 도움이 필요하신가요?</h3>

<p><table border ="0" class="table table-hover" align= "center" >
<tr>
<td>
<button type="button">
  <img src="${pageContext.request.contextPath}/resources/img/insurance.png" alt="insurance" width="150" height="150" onclick="location.href='insurance'" >
</button>
</td>
<td>
<button type="button">
  <img src="${pageContext.request.contextPath}/resources/img/retrieve.png" alt="retrieve" width="150" height="150" onclick="location.href='./insurance.jsp'" >
</button>
</td>
</tr>
</table></p>
</body>
</html>