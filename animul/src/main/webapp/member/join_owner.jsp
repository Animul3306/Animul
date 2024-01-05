<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"			 prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 	 prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" 	 prefix="form" %>

<html>
	<head>
		<title>Login</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/join_owner.css" />
		<!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/join/index.01a5f02e.css" /> -->
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<script>
			var checkId = false;
			var checkPassword = false;
			var checkEmail = false;
			var checkNickname = false;

			function changeInvisible() {
				var terms_box = document.getElementById('terms_box');
				var join_box = document.getElementById('join_box');

				var top_h3 = document.getElementById('top_h3');
				var top_img = document.getElementById('top_img');

				terms_box.style.display = 'none';
				join_box.style.display = 'block';

				top_h3.textContent = "회원가입";
				top_img.src = "${pageContext.request.contextPath}/resources/img/member/tab2.png";
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

			function showLoginError() {
				alert('회원가입에 성공하셨습니다.');
			}

			$(document).ready(function() {
				$('#pass').change( function() {
					var pass = $('#pass').val();
					var passcheck = $('#passcheck').val();
					var pass_not_same = $('#pass_not_same');
					var pass_not_same2 = $('#pass_not_same2');

					if (pass != passcheck) {
						pass_not_same.css('display', 'block');

						checkPassword = false;
					} else {
						pass_not_same.css('display', 'none');
						pass_not_same2.css('display', 'none');

						checkPassword = true;
					}
				});
				$('#passcheck').change( function() {
					var pass = $('#pass').val();
					var passcheck = $('#passcheck').val();
					var pass_not_same = $('#pass_not_same');
					var pass_not_same2 = $('#pass_not_same2');
					
					if (pass != passcheck) {
						pass_not_same2.css('display', 'block');

						checkPassword = false;
					} else {
						pass_not_same.css('display', 'none');
						pass_not_same2.css('display', 'none');

						checkPassword = true;
					}
				})

				$('#birth').change(function() {
					var currentDate = new Date();
					var birthDate = new Date($('#birth').val());

					var age = currentDate.getFullYear() - birthDate.getFullYear();

					if (currentDate.getMonth() < birthDate.getMonth() || (currentDate.getMonth() === birthDate.getMonth() && currentDate.getDate() < birthDate.getDate())) {
						age--;
					}

					$('#age').val(age);
				});

				$('#id').on("focusout", function() {
					var id = $("#id").val();

					if(id == '' || id.length == 0) {
						$('#label_id').css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
						
						checkId = false;
						return false;
					}

					$.ajax({
						url : 'ConfirmId.do',
						data : {
							id : id
						},
						type : "POST",
						dataType : 'json',
						success : function(result) {
							if ( result ) {
								$("#label_id").css("color", "black").text("사용 가능한 ID 입니다.");

								checkId = true;
							} else {
								$("#label_id").css("color", "red").text("사용할 수 없는 ID 입니다.");

								checkId = false;
							}
						}
					});
				});
				
				$('#email').on("focusout", function() {
					var email = $("#email").val();

					if(email == '' || email.length == 0 || !email.includes('@') || !email.includes('.')) {
						$('#label_email').css("color", "red").text("이메일 형식을 확인해 주세요");

						checkEmail = false;
						return false;
					}

					$.ajax({
						url : './ConfirmEmail.do',
						data : {
							email : email
						},
						type : "POST",
						dataType : 'json',
						success : function(result) {
							if ( result ) {
								$("#label_email").css("color", "black").text("사용 가능한 이메일 입니다.");
						
								checkEmail = true;
							} else {
								$("#label_email").css("color", "red").text("사용할 수 없는 이메일 입니다.");
						
								checkEmail = false;
							}
						}
					});
				});
				
				$('#nickname').on("focusout", function() {
					var nickname = $("#nickname").val();

					if(nickname == '' || nickname.length == 0) {
						$('#label_nickname').css("color", "red").text("공백은 닉네임으로 사용할 수 없습니다.");

						checkNickname = false;
						return false;
					}

					$.ajax({
						url : 'ConfirmNickname.do',
						data : {
							nickname : nickname
						},
						type : "POST",
						dataType : 'json',
						success : function(result) {
							if ( result ) {
								$("#label_nickname").css("color", "black").text("사용 가능한 닉네임 입니다.");
						
								checkNickname = true;
							} else {
								$("#label_nickname").css("color", "red").text("사용할 수 없는 닉네임 입니다.");
				
								checkNickname = false;
							}
						}
					});
				});
			})
		</script>
	</head>
	<body>
		<br><br>
        <div>
            <div id="join_text">
                <span>펫 오너 회원가입<br></span>
            </div>

			<div id="join_top">
				<h3 id="top_h3">이용약관</h3>
				<img src="${pageContext.request.contextPath}/resources/img/member/tab1.png" id="top_img">
				<br>
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

				<div id="div_button">
					<button id="button_cancel" onclick="location.href='${pageContext.request.contextPath}/main.jsp'">취소</button>
					<button id="button_next" onclick="nextStep()">다음 단계로</button>
				</div>
			</div>

			<form:form action="Join.do" method="post">
				<div id="join_box">
					<table class="join-table">
						<tbody>
							<tr>
								<th>아이디*</th>
								<td>
									<div class="input_button">
										<input required="required" type="text" maxlength="20" class="input w400" name="id" id="id">
										<label id="label_id"></label>
									</div>
								</td>
							</tr>
							<tr>
								<th>비밀번호*</th>
								<td>
									<div class="input_button">
										<input id="pass" name="password" required="required" type="password" placeholder="8~20자리 영문, 숫자 특수문자" autoComplete="off" class="input w400">
										<label id="pass_not_same">비밀번호와 비밀번호 확인이 다릅니다.</label>
									</div>	
								</td>
							</tr>
							<tr>
								<th>비밀번호 확인*</th>
								<td>
									<div class="input_button">
										<input id="passcheck" required="required" type="password" placeholder="8~20자리 영문, 숫자 특수문자" autoComplete="off" class="input w400">
										<label id="pass_not_same2">비밀번호와 비밀번호 확인이 다릅니다.</label>	
									</div>
								</td>
							</tr>
							<tr>
								<th>이름*</th>
								<td><input name="name" required="required" type="text" class="input w400" id="name"> </td>
							</tr>
							<tr>
								<th>생년월일*</th>
								<td>
									<input name="birth" required="required" type="date" class="input w400" id="birth">
								</td>
							</tr>
							<tr>
								<th>성별</th>
								<td>
									<select id="gender" name="gender" class="input w400">
										<option value="" disabled selected hidden>메뉴를 선택하세요</option>
										<option value="male">남자</option>
										<option value="female">여자</option>
										<option value="none">알리지않음</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>나이</th>
								<td>
									<input name="age" type="number" class="input w400" id="age">
								</td>
							</tr>
							<!-- <tr>
								<th>휴대폰</th>
								<td>
									<input name="phone01" type="number" class="input w45 num_regx" id="phone01">
									<span class="hyphen">-</span>
									<input name="phone02" type="number" class="input w45 num_regx" id="phone02">
									<span class="hyphen">-</span>
									<input name="phone03" type="number" class="input w45 num_regx" id="phone03">
								</td>
							</tr> -->
							<tr>
								<th>이메일*</th>
								<td>
									<div id="input_button">
										<input required="required" type="email" maxlength="320" class="input w400" id="email" name="email">
										<label id="label_email"></label>
									</div>
								</td>
							</tr>
							<tr>
								<th>닉네임*</th>
								<td>
									<div id="input_button">
										<input required="required" type="text" maxlength="20" class="input w400" id="nickname" name="nickname">
										<label id="label_nickname"></label>
									</div>
								</td>
							</tr>
						</tbody>
					</table>

					<div id="div_button">
						<button id="button_cancel" onclick="location.href='${pageContext.request.contextPath}/main.jsp'">취소</button>
						<button id="button_join" type="submit">가입하기</button>
					</div>
				</div>
			</form:form>
        </div>

		<c:if test="${not empty sessionScope.loginError}">
	        <script>
	            showLoginError();
	        </script>
	        <c:remove var="loginError" scope="session" />
        </c:if>
	</body>
</html>