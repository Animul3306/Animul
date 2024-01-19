<%@page import="com.multi.animul.retrieve.InsuranceVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#customers {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #04AA6D;
	color: white;
}
</style>
<title>Insert title here</title>
</head>

<%
	List<InsuranceVO> list = (List<InsuranceVO>) request.getAttribute("list");
int result = 0;
if (list != null) {//보험회 클릭시
	result = list.size();
}
%>
<body>
	<table>
	<tr><th>
		<a href="insurance_select?insurance_company=KB">KB다이렉트</a></th>
		<th>
		<a href="insurance_select?insurance_company=hyundai">현대해상</a></th>
		</tr>
	</table>
	<h3 align= "right"><a href="retrieve.jsp">돌아가기 </a>
		</h3>
	<%
		if (result > 0) {

		for (InsuranceVO bag : list) {
	%>

	<table id="customers">
		<tr>
			<td>보험 명</td>
			<td><%=bag.getInsurance_name()%></td>
		</tr>
		<tr>
			<td>가입 대상</td>
			<td><%=bag.getInsurance_subscription()%></td>
		</tr>
		<tr>
			<td>보장 기간</td>
			<td><%=bag.getInsurance_period()%></td>
		</tr>
		<tr>
			<td>1일 한도</td>
			<td><%=bag.getInsurance_limitday()%></td>
		</tr>
		<tr>
			<td>연간한도</td>
			<td><%=bag.getInsurance_limityear()%></td>
		</tr>
		<tr>
			<td>자기부담금</td>
			<td><%=bag.getInsurance_self()%></td>
		</tr>
		<tr>
			<td>배상책임</td>
			<td><%=bag.getInsurance_disclaimer()%></td>
		</tr>
		<tr>
			<td>면책기간</td>
			<td><%=bag.getInsurance_Schadenersatz()%></td>
		</tr>
		<tr>
			<td>보험료 할인</td>
			<td><%=bag.getInsurance_discount()%></td>
		</tr>
		<tr>
			<td>특징</td>
			<td><%=bag.getInsurance_feature()%></td>
		</tr>
		<tr>
			<td>보상 비율</td>
			<td><%=bag.getInsurance_reward()%></td>
		</tr>
		<tr>
			<td>보혐료</td>
			<td><%=bag.getInsurance_price()%></td>
		</tr>
	</table>
	<%
		}
	%>

	<%
		}
	%>



</body>
</html>