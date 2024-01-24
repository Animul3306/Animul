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

				display: flex;
				flex-direction: column;
				align-items: flex-start;
				justify-content: center;
			}
		</style> -->

		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<script>
			let petList = [];

			$(document).ready(function() {
				$.ajax({
                    url: "../mypet/simple_inquiry.do",
					type: 'GET',
                    success: function(data) {
						if (data.length != 0) {
							console.log(data);

							petList = data;

							createPetCard(petList, 0);	
						}
                    }
                });
			});

			function createPetCard(data, idx) {
				var pet = data[idx];
				console.log(pet);
				
				$("#_idx").val(idx);
				$("#_id").val(pet.mypet_id);

				$("#mypet-name").text(pet.mypet_name);
				if (pet.mypet_birthday != null) {
					$("#mypet-age").text(ageCalc(pet.mypet_birthday));
				}
				$("#mypet-category").text(pet.mypet_category);
				$("#mypet-gender").text(pet.mypet_gender);
			}
			
			function showSlide(n) {
				var currentPage = parseInt($("#_idx").val()) + n;
				
				if (currentPage < 0) {
					alert("처음 펫 입니다.");
				} else if (currentPage >= petList.length) {
					alert("마지막 펫 입니다.");
				} else {
					createPetCard(petList, currentPage);	
				}
			}

			function ageCalc(birth) {
				var currentDate = new Date();
				var birthDate = new Date(birth);

				var age = currentDate.getFullYear() - birthDate.getFullYear();

				if (currentDate.getMonth() < birthDate.getMonth() || (currentDate.getMonth() === birthDate.getMonth() && currentDate.getDate() < birthDate.getDate())) {
					age--;
				}

				return age;
			}

			function goInfo() {
				var petId = $("#_id").val();

				document.cookie = "id=" + petId;
				location.href="mypage-mypetInfo.jsp";
			}
        </script>
	</head>
	<body>
        <div class="mypet-container">
			<div class="mypet-list-container">
				<div role="button" class="button-prev">
					<a class="prev" onclick="showSlide(-1)">&#10094;</a>
				</div>
				<div class="empty"></div>
				<div class="mypet-card">
					<div class="mypet-card-inner">
						<label id="_idx" style="display: none"></label>
						<label id="_id" style="display: none"></label>
						<!-- <label id="_data" style="display: none"></label> -->
						<div class="mypet-content-container"> <label class="mypet-name">아이 이름</label> <label class="mypet-content-text" id="mypet-name"></label> </div>
						<div class="mypet-content-container"> <label class="mypet-content">나이</label> <label class="mypet-content-text" id="mypet-age"></label> </div>
						<div class="mypet-content-container"> <label class="mypet-content">품종</label> <label class="mypet-content-text" id="mypet-category"></label> </div>
						<div class="mypet-content-container"> <label class="mypet-content">성별</label> <label class="mypet-content-text" id="mypet-gender"></label> </div>
						<div class="empty"></div>
						<div class="mypet-card-button">
							<input type="button" id="button-detail" onclick="goInfo()" value="상세 정보">
						</div>
					</div>
				</div>
				<div class="empty"></div>
				<div role="button" class="button-next">
					<a class="next" onclick="showSlide(1)">&#10095;</a>
				</div>
			</div>
			<div class="mypet-add-container">
				<input type="button" id="button-add" onclick="location.href='mypage-mypetAdd.jsp'" value="+ 마이펫 추가하기">
			</div>
		</div>
	</body>
</html>