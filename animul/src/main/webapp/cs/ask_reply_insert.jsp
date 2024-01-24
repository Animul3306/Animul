<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<title>Insert title here</title>

<style>
  .close{
  margin-left:5px;
  }


</style>
</head>
<body>
<%
	String askId = request.getParameter("askId");
%>
<div class="ask_wrap">
			<form action="ask_reply_insert" name="frm" method="post" onsubmit="return chkSubmit()">
				<div class="mx-auto p-2" style="width: 900px;">
					<p class="fs-2">1:1문의 답변하기</p>
				</div>
				<div class="container">
					<div class="mb-3">
						<input name="member_id" type="hidden" class="form-control"
							id="exampleFormControlInput1" placeholder="작성자"
							value="<%= session.getAttribute("loggedInUser") %>">
					</div>
					
					<div class="mb-3">
						<input name="ask_id" type="hidden" class="form-control"
							id="exampleFormControlInput1" placeholder="게시물 번호""
							value="<%=askId %>">
					</div>
					
					
					<div class="mb-3">
						<input name="ask_reply_title" type="text" class="form-control"
							id="exampleFormControlInput1" placeholder="제목입력">
					</div>
					

					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label">
						</label>
						<textarea name="ask_reply_content" class="form-control"
							id="exampleFormControlTextarea1" rows="7" placeholder="내용입력"></textarea>
					</div>



					<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="float:left;">
						<button class="btn btn-danger" type="submit">등록</button>
						
					</div>
				</div>
			</form>
				<div class="close" style="float:left;">
				  <button class="btn btn-danger" onclick="window.close();">취소</button>
				</div>		
		</div>
<script>
		function chkSubmit() {
			frm = document.forms['frm'];
			let title = frm['ask_reply_title'].value.trim();
			let content = frm['ask_reply_content'].value.trim();
			
			
			if (title == '' || content == '') {
				alert("제목 및 내용을 작성해주세요.");
				
				return false;
			}
			return true;
		}
	</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>