<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" 	 prefix="form" %>

<html>
	<head>
		<title>My Page INFO</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/mypage-mypet.css" />
		<!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slider.css"> -->
		<!-- <style>
			@font-face {
				font-family: 'NotoSans_Bold';
				src: url('./font/NotoSansKR-Bold.ttf') format('truetype')
			}
			@font-face {
				font-family: 'NotoSans_Regular';
				src: url('./font/NotoSansKR-Regular.ttf') format('truetype')
			}

			.mypet-card {
				width: 324px;
				height: 457px;
				padding: 3px 3px;
			}

			.mypet-card_inner {
				width: 264px;
				height: 377px;
				padding: 40px 30px;
ㄴㅇㄹㄴ fdgdfgdg
				display: flex;
				flex-direction: column;
				align-items: flex-start;
				justify-content: center;
			}
		</style> -->

		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
            var currentPage = 1;
			function showSlide(n) {
				currentPage += i;
				var path = "protectList?page=" + currentPage;

				location.href=path;
			}
        </script>
	</head>
	<body>
        <div class="mypet-container">
			<div class="mypet-list-container">
				<div role="button" class="button-prev">
					<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
				</div>
				<div class="empty"></div>
				<div class="mypet-card">
					<div class="mypet-card-inner">
						<label class="mypet-name">아이 이름</label> <label></label>
						<label class="mypet-content">나이</label> <label></label>
						<label class="mypet-content">품종</label> <label></label>
						<label class="mypet-content">성별</label> <label class="mypet-content-text" id="gender"></label>
						<div class="empty"></div>
						<div class="mypet-card-button">
							<input type="button" id="button-detail" value="상세 정보">
						</div>
					</div>
				</div>
				<div class="empty"></div>
				<div role="button" class="button-next">
					<a class="next" onclick="plusSlides(1)">&#10095;</a>
				</div>
			</div>
			<div class="mypet-add-container">
				<input type="button" id="button-add" value="+ 마이펫 추가하기">
			</div>
		</div>
	</body>
</html>