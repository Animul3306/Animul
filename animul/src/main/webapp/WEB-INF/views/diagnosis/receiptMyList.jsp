<%@page import="com.multi.animul.diagnosis.ReceiptVO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<script>
$(function() {	
	var table = document.getElementById('myListTable');
    var rowList = table.rows;

    // Attach click event to each row
    for (var i = 1; i < rowList.length; i++) {
        // Use a closure to capture the value of i
        (function(index) {
            $("#myListTable tr").eq(index).on("click", function () {
                //console.log(rowList[index].cells[0].textContent);
                $.ajax({
                    url: "${pageContext.request.contextPath}/diagnosis/receiptItemList",
                    type: "post",
                    data: {
                    	receipt_item_receiptid: rowList[index].cells[0].textContent,
                    },
                    success: function (list) {
                    	$('#resultDiv2').html(list)
                        console.log(list);
                    }//success
                })//ajax    
            });
        })(i);
    }   
});
</script>
<table id="myListTable" class="table table-hover">
	<tr>
        <td>번호</td>
		<td>병원명</td>
		<td>주소</td>
		<td>진단항목</td>
		<td>결제일</td>
		<td>결제금액</td>
	</tr>
	<c:forEach var="x" items="${receiptMyResult}" varStatus="status">
		<tr>
        	<td style="display:none;">${x.receipt_id}</td>
        	<td>${status.count}</td>
        	<td>${x.receipt_hospitalname}</td>
			<td>${x.receipt_address}</td>
			<td>${diagnosisMyResult[status.index].receipt_item_diagnosisname}</td>
			<td>
				<c:set var="y" value="${x.receipt_date}" />
				<fmt:formatDate var="sysYear" value="${y}" pattern="yyyy/MM/dd" />
				<c:out value="${sysYear}" />
			</td>
			<td>${x.receipt_price}</td>
		</tr>      
	</c:forEach>      
</table>