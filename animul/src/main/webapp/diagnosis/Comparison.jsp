<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function () {
    // submit 했을 때 처리
    $('#ocrForm').on('submit', function (event) {
        event.preventDefault();
        var formData = new FormData($('#ocrForm')[0]);
        var fileName = $('#uploadFile').val().split("\\").pop();
        $.ajax({
            url : "clovaOCR",
            type : "post",
            enctype : "multipart/form-data",
            data : formData,
            processData : false,
            contentType : false,
            success:function (result) {
                $('#resultDiv').text(result);
            },
        });
    })
})
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
	<div class="row">
		<form id="ocrForm" enctype="multipart/form-data">
            파일 선택: <input type="file" id="uploadFile" name="uploadFile"> 
            <button type="submit" class="btn btn-secondary">OCR판독</button>    
		</form>
	</div>
</div>
</body>
</html>