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
</head>
<body>
	<div id="container">
		<div class="wid1300">
			<div id="lm" class="cs">
				<h2 class="lm-tit">
					<span>Community</span> <strong>커뮤니티</strong>
				</h2>

				<ul id="snb">
					<li><a href="/animul/bbs/free">자유 토크</a></li>
					<li><a href="/animul/bbs/local">산책 메이트ㆍ멍냥이 찾기</a></li>
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
					<h3 class="tit">자유 토크</h3>
					<p>마이펫 자랑, 고민 등 자유롭게 작성하는 게시판 입니다!!</p>
				</div>


				<div class="hd-sch">
					<form action="update">
						<input type="hidden" name="bbs_menu" value="1"> <label
							for="exampleFormControlInput1" class="form-label">카테고리</label> <select
							class="form-select" aria-label="Default select example"
							name="bbs_cate">
							<option value="자유 토크">자유 토크</option>
							<option value="마이펫 자랑">마이펫 자랑</option>
							<option value="고민 상담">고민 상담</option>
							<option value="무료 나눔">무료 나눔</option>
						</select><br>

						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">제목</label>
							<input type="text" name="bbs_title" class="form-control"
								id="exampleFormControlInput1" value="${vo.bbs_title}">
							<label for="exampleFormControlInput1" class="form-label">작성자</label>
							<input type="text" name="member_id" class="form-control"
								id="exampleFormControlInput1" value="${vo.member_id}"> <label
								for="exampleFormControlTextarea1" class="form-label">내용</label>
							<textarea name="bbs_content" class="form-control" id="exampleFormControlTextarea1" 
										rows="6" >${vo.bbs_content}</textarea>

							<label for="formFile" class="form-label">첨부파일</label> <input
								class="form-control" type="file" id="formFile" name="bbs_file"><br>
							<br>

							<div class="btn-box">
								<button type="submit" class="btn btn-blue wide">수정</button> 
								<a href="free" class="btn btn-gray wide">목록</a>
							</div>
					</form>
				</div>

			</div>
</body>
</html>