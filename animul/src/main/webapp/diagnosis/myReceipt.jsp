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
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
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
	            	$('#resultDiv2').html(result);
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
    
#ocrForm {
    flex-direction: column;
    align-items: center;
}   

input[type="file"] {
  position: relative;
}

input[type="file"]::file-selector-button {
  width: 136px;
  color: transparent;
}

/* Faked label styles and icon */
input[type="file"]::before {
  position: absolute;
  pointer-events: none;
  top: 10px;
  left: 16px;
  height: 20px;
  width: 20px;
  content: "";
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%230964B0'%3E%3Cpath d='M18 15v3H6v-3H4v3c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2v-3h-2zM7 9l1.41 1.41L11 7.83V16h2V7.83l2.59 2.58L17 9l-5-5-5 5z'/%3E%3C/svg%3E");
}

input[type="file"]::after {
  position: absolute;
  pointer-events: none;
  top: 11px;
  left: 40px;
  color: #0964b0;
  content: "Upload File";
}

/* ------- From Step 1 ------- */

/* file upload button */
input[type="file"]::file-selector-button {
  border-radius: 4px;
  padding: 0 16px;
  height: 40px;
  cursor: pointer;
  background-color: white;
  border: 1px solid rgba(0, 0, 0, 0.16);
  box-shadow: 0px 1px 0px rgba(0, 0, 0, 0.05);
  margin-right: 16px;
  transition: background-color 200ms;
}

/* file upload button hover state */
input[type="file"]::file-selector-button:hover {
  background-color: #f3f4f6;
}

/* file upload button active state */
input[type="file"]::file-selector-button:active {
  background-color: #e5e7eb;
}

/* Style for the submit button */
input[type="submit"] {
    margin-top: 10px;
    padding: 10px 20px;
    background-color: #0964b0;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

input[type="submit"]:hover {
    background-color: #074a7e;
    cursor: pointer;
}

</style>
</head>
<body>
<div class="container mt-3">
	<div id="ocr" class="row">
		<form id="ocrForm" enctype="multipart/form-data">
            <input type="file" id="file" name="file">
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