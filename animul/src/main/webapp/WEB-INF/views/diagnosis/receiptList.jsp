<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
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
                    	receipt_address: rowList[index].cells[3].textContent
                    },
                    success: function (list) {
                    	$('#resultDiv2').html("<span style='font-weight: bold; font-size: 1.5em;'>병원명: " + rowList[index].cells[2].textContent + "</span>");
                    	$('#resultDiv2').append(list)
                        console.log(list);
                    }//success
                })//ajax    
            });
        })(i);
    }   
});
</script>
<style>
.row {
    margin: 0px 100px;
	padding: 25px;
	background-color: #8EC693;
	border-radius: 30px;
    }
</style>
</head>
<body>
<div class="container mt-3">
	<div class="row mt-3" id="resultDiv2"></div>
	<div class="row" id="resultDiv">
		<div  style="font-weight: bold; font-size: 1.5em" >전체 영수증 리스트</div>
		<table id="myListTable" class="table table-hover">
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
		        	<td style="display:none;">${x.receipt_id}</td>
		        	<td>${status.count}</td>
		        	<td>${x.receipt_hospitalname}</td>
					<td>${x.receipt_address}</td>
					<td>${diagnosisResult[status.index].receipt_item_diagnosisname}</td>
					<td>
						<c:set var="y" value="${x.receipt_date}" />
						<fmt:formatDate var="sysYear" value="${y}" pattern="yyyy/MM/dd HH:mm:ss" />
						<c:out value="${sysYear}" />
					</td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${x.receipt_price}"/></td>
				</tr>   
			</c:forEach>      
		</table>
	</div>
</div>
</body>
</html>
