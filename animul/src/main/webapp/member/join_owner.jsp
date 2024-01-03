<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>

<html>
	<head>
		<title>Login</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/join_owner.css" />
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<script>
			function changeInvisible() {
				var terms_box = document.getElementById('terms_box');
				var join_box = document.getElementById('join_box');

				var button_next = document.getElementById("button_next");
				var button_join = document.getElementById("button_join");

				terms_box.style.display = 'none';
				join_box.style.display = 'block';

				button_next.style.display = 'none';
				button_join.style.display = 'block';
			}

			function checkboxControl() {
				var join_agree1 = document.getElementById("join_agree1");
				var join_agree2 = document.getElementById("join_agree2");
				var join_agree3 = document.getElementById("join_agree3");

				if (join_agree1.checked & join_agree2.checked) { join_agree3.checked = 1;}
				else { join_agree3.checked = 0; }
			}
			function checkboxControl2() {
				var join_agree1 = document.getElementById("join_agree1");
				var join_agree2 = document.getElementById("join_agree2");
				var join_agree3 = document.getElementById("join_agree3");

				if (join_agree3.checked) { join_agree1.checked = 1; join_agree2.checked = 2;}
				else {join_agree1.checked = 0; join_agree2.checked = 0;}
			}

            function nextStep(){
				var join_agree3 = document.getElementById("join_agree3");

				if (join_agree3.checked) { changeInvisible(); }
				else { alert("필수 항목을 모두 체크해 주세요."); }
			}
		</script>
	</head>
	<body>
        <div>
            <div id="join_text">
                <span>회원가입<br></span>
            </div>
			<div id="terms_box">
				<span id="terms_text">이용약관 (필수)</span>

				<div class="box01 scroll">
					<iframe id="terms01" src="./terms/terms01.jsp" title="이용약관(필수)"></iframe>
				</div>

				<div class="agree">
					<label for="join_agree1" class="check">
						<input type="checkbox" name="join_agree" id="join_agree1" onclick="checkboxControl()">
						<span>이용약관에 동의합니다.</span>
					</label>
				</div>


				<span id="terms_text">개인정보의 수집 및 이용에 대한 동의 (필수)</span>

				<div class="box01 scroll">
					<iframe id="terms01" src="./terms/terms02.jsp" title="개인정보의 수집 및 이용에 대한 동의 (필수)"></iframe>
				</div>

				<div class="agree">
					<label for="join_agree2" class="check">
						<input type="checkbox" name="join_agree2" id="join_agree2" onclick="checkboxControl()">
						<span>개인정보처리방침에 동의합니다.</span>
					</label>
					<label for="join_agree3" class="check">
						<input type="checkbox" name="join_agree3" id="join_agree3" onclick="checkboxControl2()">
						<span>전체 동의합니다.</span>
					</label>
				</div>
			</div>
			<div id="join_box">
				가입
			</div>
			<div id="div_button">
				<button id="button_cancel" onclick="location.href='${pageContext.request.contextPath}/main.jsp'">취소</button>
				<button id="button_next" onclick="nextStep()">다음 단계로</button>
				<button id="button_join">가입하기</button>
			</div>
        </div>

	</body>
</html>