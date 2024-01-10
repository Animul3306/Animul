<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link href="../resources/css/retrieve/insurance.css" rel="stylesheet">
	<style>
	h3 {
  background-color: lightblue;
  width: "100";
  }
  p {
  font-size =50px
}
	</style>
</head>
<body>
<br>
<h3  align= "center";>어서오세요 애니멀입니다 어떤 도움이 필요하신가요?</h3>

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
<tr>
<td class ="border" align= "center">보험</td>
<td class ="border" align= "center">질병 검색</td>
</tr>
<h3 align= "center">아래 이미지를 클릭하십시요</h3>

</table></p>
</body>
</html>