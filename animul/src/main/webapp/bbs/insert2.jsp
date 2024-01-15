<%@ include file="/WEB-INF/views/common/header2.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="../resources/css/bbs/style.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	
</head>
<body>
	<div id="container">
		<div class="wid1300">
			<div id="lm" class="cs">
				<h2 class="lm-tit">
					<span>Community</span> <strong>커뮤니티</strong>
				</h2>

				<ul id="snb">
					<li><a href="/animul/bbs/freeList">자유 토크</a></li>
					<li><a href="/animul/bbs/localList">산책 메이트ㆍ멍냥이 찾기</a></li>
					<li><a
						href="https://www.animal.go.kr/front/awtis/protection/protectionList.do?menuNo=1000000060">유기동물보호센터
							보호중</a></li>
					<li><a
						href="https://www.1365.go.kr/vols/search.do?query=%EC%9C%A0%EA%B8%B0">유기동물보호센터
							봉사관련</a></li>
				</ul>
				<div style="padding-top: 20px;"></div>
			</div>

			<div id="contents">
				<div class="pt-titarea">
					<h3 class="tit">산책 메이트 와 멍냥이 찾기</h3>
					<p>산책 메이트 와 멍냥이 찾는 게시판 입니다!!</p>
				</div>


				<div class="hd-sch">
					<form action="localInsert" enctype="multipart/form-data" method="post"> 
					<input type="hidden" name="bbs_menu" value="2">
						<label for="exampleFormControlInput1" class="form-label">카테고리</label> 
						<select class="form-select" aria-label="Default select example" name="bbs_cate">							
							<option value="산책 메이트 찾기">산책 메이트 찾기</option>
							<option value="멍냥이 찾기">멍냥이 찾기</option>

						</select><br>
						
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">제목</label>
							<input type="text" name="bbs_title" class="form-control"
								id="exampleFormControlInput1" placeholder="제목을 입력해주세요">
							<label for="exampleFormControlInput1" class="form-label">작성자</label>
							<input type="text" name="member_id" class="form-control"
								id="exampleFormControlInput1" placeholder=""> <label
								for="exampleFormControlTextarea1" class="form-label">내용</label>
							<textarea name="bbs_content" class="form-control"
								id="exampleFormControlTextarea1" rows="6"></textarea>
								
								
						<div class="inputArea">
							<label for="bbs_img" class="form-label">첨부파일(이미지)</label> <br>
							<input type="file" id="bbs_img" name="file" />
							
							<div class="select_img"><img src="" /></div>
							<script>
								$("#bbs_img").change(function() {
									if (this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img img").attr("src", data.target.result).width(300);
										}
											reader.readAsDataURL(this.files[0]);
										}
								});
							</script>
							<%= request.getRealPath("/") %>
							</div>
						<div class="btn-box">
						<button type="submit" class="btn btn-blue wide">글쓰기</button>
					
						<a href="localList" class="btn btn-gray wide">목록으로</a>
						</div>
					</form>
					</div>

				</div>
</body>

<script type="text/javascript">

   function readURL(input) {
      var file = input.files[0] 
      console.log(file)
      if (file != '') {
         var reader = new FileReader();
         reader.readAsDataURL(file);
         reader.onload = function (e) { 
	     console.log(e.target)
		console.log(e.target.result)
           $('#preview').attr('src', e.target.result);
          }
      }
  }  
</script>
</html>