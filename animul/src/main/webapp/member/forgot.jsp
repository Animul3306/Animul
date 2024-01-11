<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>

<html>
	<head>
		<title>Login</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/forgot.css" />
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"> </script>
        <script src="${pageContext.request.contextPath}/resources/js/member/forgot.js"> </script>
	</head>
	<body>
        <div class="forgot_area">
            <div class="forgot_box forgot_id">
                <div class="forgot_head">
                    <h3 class="forgot_title">아이디 찾기</h3>
                </div>
                <br>
                <div class="forgot_body">
                    <input type="text" class="w330" id="input_id_name" placeholder="이름">
                    <div class="div_email">
                        <input type="text" class="input_email w220" id="input_id_email" placeholder="이메일">
                        <input type="button" class="button_email w100" id="button_id_email" value="이메일 인증">
                    </div>
                    <div class="div_email_check">
                        <input type="text" class="input_email w330" id="input_id_email_check" style="display: none" placeholder="인증 번호">
                        <label id="label_id_email_check"></label>
                    </div>
                    <br>
                    <button class="button_forgot" id="button_id" disabled>아이디 찾기</button>
                </div>
            </div>

            <div class="forgot_box forgot_pwd">
                <div class="forgot_head">
                    <h3 class="forgot_title">비밀번호 재설정</h3>
                </div>
                <br>
                <div class="forgot_body">
                    <input type="text" class="w330" id="input_pwd_id" placeholder="아이디">
                    <input type="text" class="w330" id="input_pwd_name" placeholder="이름">
                    <div class="div_email">
                        <input type="text" class="input_email w220" id="input_pwd_email" placeholder="이메일">
                        <input type="button" class="button_email w100" id="button_pwd_email" value="이메일인증">
                    </div>
                    <div class="div_email_check">
                        <input type="text" class="input_email w330" id="input_id_email_check" style="display: none" placeholder="인증 번호">
                        <label id="label_pwd_email_check"></label>
                    </div>
                    <br>
                    <button class="button_forgot" id="button_pwd" disabled>비밀번호 재설정</button>
                </div>
            </div>
        </div>

        <form:form name="resetPwd" action="${pageContext.request.contextPath}/member/ResetPwd.do" method="post">
            <div class="forgot_area pwd_reset">
                <div class="forgot_box">
                    <div class="forgot_head">
                        <h3 class="forgot_title">비밀번호 재설정</h3>
                    </div>
                    <br>
                    <div class="forgot_body">
                        <input type="text" id="id" name="id" style="display:none">
                        <input type="password" id="forgot_pwd_reset" name="pwd" placeholder="비밀번호">
                        <input type="password" id="forgot_pwd_reset2" placeholder="비밀번호 확인">
                        <br>
                        <button class="button_forgot" id="button_reset">비밀번호 재설정</button>
                    </div>
                </div>
            </div>
        </form:form>

        <br><br>
        <hr>
	</body>
</html>