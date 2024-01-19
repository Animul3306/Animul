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
			receipt_myid: "apple",  //나중에 로그인 세션으로 바꾸기
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
	        			var complete = confirm("영수증 등록 성공, 등록한 영수증을 확인하시겠습니까?")
	        			if(complete) {
	        				alert("네")
	        			} else {
	        				alert("아니요")				
	        			}
	            	} else {
	            		alert("영수증 등록 실패")
	            	}
	            },
	            error:function (e) {
	                alert("오류 발생" + e);
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
            <input type="submit" value="가격 비교 결과 확인">        
        </form>
		
	</div>
	<div class="row mt-3" id="resultDiv2"></div>
	<div class="row mt-3" id="resultDiv"></div>
</div>
</body>
</html>