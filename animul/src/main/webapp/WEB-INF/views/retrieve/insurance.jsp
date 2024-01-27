<%@ page import="java.util.List"%>
<%@ include file="/WEB-INF/views/common/header2.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.multi.animul.retrieve.InsuranceVO"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTP-8">
<title>Insert title here</title>
<link href="../resources/css/retrieve/style.css" rel="stylesheet">
</head>
<body>
<%
	List<InsuranceVO> list = (List<InsuranceVO>) request.getAttribute("list");
int result = 0;
if (list != null) {//보험회 클릭시
	result = list.size();
}
%>
	<div id="container">
		<div class="wid1300">
			<div id="lm" class="cs">
				<h2 class="lm-tit">
					<span></span> <strong>보험&질병</strong>
				</h2>
				<ul id="snb">
					<li><a href="insurance"> 보험</a></li>
					<li><a href="retrieve2">질병 검색</a></li>
				</ul>
				<div style="padding-top: 20px;"></div>
			</div>

			<div id="contents">
				<div class="pt-titarea">
					<h3 class="tit">보험</h3>
					<p>펫보험 가입 왜 필요할까요?<br>
강아지 고양이 기르시는 분이라면 의료비 부담을 크게 느끼실 거로 생각합니다. 기르는 종에 따라 흔히 발생하는 질병이 있으며 수술을 진행할 경우 최소 수 십에서 수백만 원의 비용이 발생할 수 있습니다.
노화가 진행될수록 더욱 많은 의료 비용이 발생하게 됩니다. PET 보험에 가입 한다면 부담스러운 의료 비용을 최대 80~90%가량 보장 받을 수 있습니다.
</p>
				</div>
				
				<div class="hd-sch">
					<div class="hd">보험사</div>
					<div class="bd"> 
					</div>
					<div class="bt">
						<a href="insurance_select?insurance_company=KB"><button style="cursor: pointer;"
							class="btn btn-sm btn-blue">KB다이렉트</button></a>
						<a href="insurance_select?insurance_company=hyundai"><button style="cursor: pointer;"
							class="btn btn-sm btn-blue">현대해상</button></a>
							<a href="insurance_select?insurance_company=Meritz"><button style="cursor: pointer;"
							class="btn btn-sm btn-blue">Meritz</button></a>
							<a href="insurance_select?insurance_company=Samsung"><button style="cursor: pointer;"
							class="btn btn-sm btn-blue">삼성화재</button></a>
							<a href="insurance_select?insurance_company=DB"><button style="cursor: pointer;"
							class="btn btn-sm btn-blue">DB손해보험</button></a>
							<a href="insurance_select?insurance_company=hanwha"><button style="cursor: pointer;"
							class="btn btn-sm btn-blue">한화손해보험</button></a>
					</div>	
	
				
					
				</div>
				<%
		if (result > 0) {

		for (InsuranceVO bag : list) {
	%>

	<table class="list" id="customers">
		<colgroup>
						<col style="width: 20%;">
						<col style="width: 80%;">
						
		</colgroup>
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
			
</div>
			
			
			


</body>

</html>