<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
전체 영수증 리스트
<table class="table table-bordered">
	<tr>
        <td>번호</td>
		<td>병원명</td>
		<td>주소</td>
		<td>진단항목</td>
		<td>결제일</td>
		<td>결제금액</td>
	</tr>
	<c:forEach var="x" items="${receiptResult}"  varStatus="status">
        <tr>
        	<td>${status.count}</td>
        	<td>${x.receipt_hospitalname}</td>
			<td>${x.receipt_address}</td>
			<td>${diagnosisResult[status.index].receipt_item_diagnosisname}</td>
			<td>
				<c:set var="y" value="${x.receipt_date}" />
				<fmt:formatDate var="sysYear" value="${y}" pattern="yyyy/MM/dd" />
				<c:out value="${sysYear}" />
			</td>
			<td>${x.receipt_price}</td>
		</tr>   
	</c:forEach>      
</table>