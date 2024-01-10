<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.table td:hover {
	background-color: skyblue;
}

</style>
<table class="table table-bordered">
	<c:forEach var="x" items="${diagnosisFind}">
        <tr>
        	<td onClick="location.href='diagnosisOne?diagnosis_name=${x.diagnosis_name}'">${x.diagnosis_name}
			</td>
		</tr>   
	</c:forEach>   
</table>