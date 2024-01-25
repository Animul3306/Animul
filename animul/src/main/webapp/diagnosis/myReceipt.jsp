<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js" charset="utf-8"></script>  
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-annotation"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {		
	$.ajax({
		url:"${pageContext.request.contextPath}/diagnosis/receiptMyList",
		data: {
			receipt_myid: "${loggedInUser}",  //나중에 로그인 세션으로 바꾸기
		},
		success: function(list) {
			$('#resultDiv').html(list)
		}//success
	})//ajax
	
	
	
	
	 $('#ocrForm').on('submit', function (event) {
	        event.preventDefault();
	        var formData = new FormData($('#ocrForm')[0]);
	        $.ajax({
	            type : "post",
	            enctype : "multipart/form-data",
	            url : "${pageContext.request.contextPath}/diagnosis/clovaOCR",
	            data : formData,
	            processData : false,
	            contentType : false,
	            success:function (result) {
	            	console.log(result)
	               if(result == 1) {
	            	   alert("영수증이 등록되었습니다.")
	            	} else if(result == 2){
	            		alert("영수증이 중복되었습니다.")
	            	} else {
	            		alert("진료항목이 없습니다.")
	            	}
	            },
	            error:function (e) {
	                alert("이미지 파일이 없거나 인식이 불가능한 영수증입니다.");
	            }
	        });
	        document.getElementById("file").value ='';
	    })
	
})//$
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
	<div id="ocr" class="row">
		<form id="ocrForm" enctype="multipart/form-data">
            파일 : <input type="file" id="file" name="file">
            <% if(session.getAttribute("loggedInUser") != null ) { %>
            <input type="submit" value="가격 비교 결과 확인">
			<% } else {%>
				<script>
					alert("로그인 후 이용가능합니다.")
					location.href= "${pageContext.request.contextPath}/member/login.jsp"
				</script>
			<% } %>
        </form>
		
	</div>
	<div class="row mt-3" id="resultDiv2"></div>
	<div class="row mt-3" id="resultDiv"></div>
</div>
</body>
</html>