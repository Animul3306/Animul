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
		<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
		<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.6.0/kakao.min.js"
			integrity="sha384-6MFdIr0zOira1CHQkedUqJVql0YtcZA1P0nbPrQYJXVJZUkTk/oX4U9GhUIs3/z8" crossorigin="anonymous"></script>

		<script>
			function showLoginError() {
				alert('로그인에 실패했습니다. 아이디 또는 비밀번호를 확인해주세요.');
			}

			// Naver 로그인
			var naverLogin = new naver.LoginWithNaverId({
				clientId: "IiKV8tXSr1Yc4wBnAFBF",
				callbackUrl: "http%3a%2f%2flocalhost%3a8888%2fanimul%2fmember%2fnaverLogin%2fOAuth2C",
				isPopup: false,
				loginButton: {color: "white", type: 3, height: 60} 
			});
			naverLogin.init();

			function loginWithNaver() {
				const url = 'https://nid.naver.com/oauth2.0/authorize?response_type=code%client_id=IiKV8tXSr1Yc4wBnAFBF&redirect_url=http%3a%2f%2flocalhost%3a8888%2fanimul%2fmember%2fnaverLogin%2fOAuth2C&state=1234';

				this.showSocialLoginPopup(url);
			}

			// Kakao 로그인
			Kakao.init('36bde7f7f79d1b16d493771a35ec50df');

			function loginWithKakao() {
				Kakao.Auth.authorize({
					redirectUri: 'http://localhost:8888/animul/member/kakaoLogin/OAuth2C',
				});

				displayToken()
			}

			function displayToken() {
				var token = getCookie('authorize-access-token');

				if(token) {
				Kakao.Auth.setAccessToken(token);
				Kakao.Auth.getStatusInfo()
					.then(function(res) {
					if (res.status === 'connected') {
						document.getElementById('token-result').innerText
						= 'login success, token: ' + Kakao.Auth.getAccessToken();
					}
					})
					.catch(function(err) {
					Kakao.Auth.setAccessToken(null);
					});
				}
			}

			function getCookie(name) {
				var parts = document.cookie.split(name + '=');
				if (parts.length === 2) { return parts[1].split(';')[0]; }
			}

			// $(document).ready(function() {
			
			// }
		</script>
	</head>
	<body>
		<form:form action="Login.do" method="post" modelAttribute="loginForm">
		<div id="login">
			<div>
				<span>로그인<br></span>
				<br>
				<div id="login_box">
					<input name="id" id="id" class="login_input" type="text" placeholder="아이디"  value='${not empty cookie.rememberedId ? cookie.rememberedId.value : ""}' />
					<input name="password" id="password" class="login_input" type="password" placeholder="비밀번호" />
					<label style="display:flex; align-items: center;"><input type="checkbox" name="remember_id" id="remember_id" />아이디 저장</label>
				</div>
			</div>
			
			<br>
			
			<div id="login_button">
				<button class="login_button h45" id="normal_button" type="submit">로그인</button>
				<input type="button" class="login_button h45" id="naver_button" onclick="" value="Naver로 로그인"></input>
				<input type="button" class="login_button h45" id="kakao_button" onclick="loginWithKakao()" value="Kakao로 로그인"></input>
				<!-- <div class="text-center">
					<a 	href="https://kauth.kakao.com/oauth/authorize"
						th:href="@{https://kauth.kakao.com/oauth/authorize(client_id=36bde7f7f79d1b16d493771a35ec50df, redirect_uri=http%3A%2F%2Flocalhost%3A8888%2Fanimul%2Fmember%2FkakaoLogin%2FOAuth2C, response_type='code')}">
						<img src="${pageContext.request.contextPath}/resources/img/member/kakao_login_medium_narrow.png">
					</a>
				</div> -->
				<input type="button" class="login_button h45" id="apple_button" value="Google로 로그인"></input>
			</div>

			<div id="underbar">
				<span>|</span>
				<span class="undertext"><a href="./join_owner.jsp">회원가입</a></span>
				<span>|</span>
				<span class="undertext"><a href="./forgot.jsp">아이디 · 비밀번호 찾기</a></span>
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