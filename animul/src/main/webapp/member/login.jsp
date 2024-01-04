<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>
<html>
	<head>
		<title>Login</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/login.css" />
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<script>
			// 로그인 실패 시 알림창을 띄우는 함수
			function showLoginError() {
				alert('로그인에 실패했습니다. 아이디 또는 비밀번호를 확인해주세요.');
			}
		</script>
	</head>
	<body>
		<form:form action="Login.do" method="post" modelAttribute="loginForm">
		<div id="login">
			<div>
				<span>로그인<br></span>
				<br>
				<div id="login_box">
					<input name="id" id="id" type="text" placeholder="아이디" />
					<input name="password" id="password" type="password" placeholder="비밀번호" />
					<label style="display:flex; align-items: center;"><input type="checkbox" id="save_id" />아이디 저장</label>
				</div>
			</div>
			
			<br>
			
			<div id="login_button">
				<button id="normal_button" type="submit">로그인</button>
				<button id="naver_button">Naver로 로그인</button>
				<button id="kakao_button">Kakao로 로그인</button>
				<button id="apple_button">Apple로 로그인</button>
			</div>

			<div id="underbar">
				<span>|</span>
				<span class="undertext"><a href="#">회원가입</a></span>
				<span>|</span>
				<span class="undertext"><a href="#">아이디 · 비밀번호 찾기</a></span>
				<span>|</span>
			</div>
		</div>
		</form:form>

		<c:if test="${not empty sessionScope.loginError}">
	        <script>
	            showLoginError();
	        </script>
	        <c:remove var="loginError" scope="session" />
   		</c:if>

	</body>
</html>