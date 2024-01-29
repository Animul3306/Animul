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
		<script src="${pageContext.request.contextPath}/resources/js/member/join_owner.js"></script>
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
				<img src="../resources/img/member/tab2.png" id="top_img2" style="display: none">
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
					<input type="button" id="button_cancel" onclick="location.href='${pageContext.request.contextPath}/main'" value="취소"></input>
					<input type="button" id="button_next" onclick="nextStep()" value="다음 단계로"></input>
				</div>
			</div>

			<form:form action="Join.do" name="joinForm" method="post">
				<div id="join_box">
					<table class="join-table">
						<tbody>
							<tr>
								<th>아이디*</th>
								<td>
									<div class="input_button">
										<input required="required" type="text" maxlength="20" class="input w400" name="id" id="id">
										<label class="valid_label" id="label_id"></label>
									</div>
								</td>
							</tr>
							<tr>
								<th>비밀번호*</th>
								<td>
									<div class="input_button">
										<input id="pass" name="password" required="required" type="password" placeholder="8~20자리 영문, 숫자 특수문자" autoComplete="off" class="input w400">
										<label class="valid_label" id="pass_not_same"></label>
									</div>	
								</td>
							</tr>
							<tr>
								<th>비밀번호 확인*</th>
								<td>
									<div class="input_button">
										<input id="passcheck" required="required" type="password" placeholder="8~20자리 영문, 숫자 특수문자" autoComplete="off" class="input w400">
										<label class="valid_label" id="pass_not_same2"></label>	
									</div>
								</td>
							</tr>
							<tr>
								<th>이름*</th>
								<td>
									<div class="input_button">
										<input name="name" required="required" type="text" class="input w400" id="name">
										<label class="valid_label" id="label_name"></label>
									</div>
								</td>
							<tr>
								<th>생년월일*</th>
								<td>
									<div>
										<input name="birth" required="required" type="date" class="input w400" id="birth">
										<label class="valid_label" id="label_birth"></label>
									</div>
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
									<div class="input_button">
										<input name="age" type="number" class="input w400" id="age">
										<!-- <label class="valid_label" id="label_age"></label> -->
									</div>
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
									<div >
										<div class="onput_button">
											<div class="input_button" >
												<input required="required" type="email" maxlength="320" class="input w330" id="email" name="email">
												<input type="button" class="w70" id="emailCheck" value="인증하기">
												<label class="valid_label" id="label_email"></label>
											</div>
										</div>
										<div class="input_button">
											<input required="required" id="emailCheckNumber" class="input w400" style="display: none" placeholder="인증 번호">
											<label class="valid_label" id="label_email_check"></label>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th>닉네임*</th>
								<td>
									<div class="input_button" style="margin-top: 10px;">
										<input required="required" type="text" maxlength="20" class="input w400" id="nickname" name="nickname">
										<label class="valid_label" id="label_nickname"></label>
									</div>
								</td>
							</tr>
						</tbody>
					</table>

					<div id="div_button">
						<input type="button" id="button_cancel" onclick="location.href='${pageContext.request.contextPath}/main'" value="취소"></input>
						<input type="button" id="button_join" value="가입하기"></button>
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