<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>

<html>
	<head>
		<title>Login</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/join.css" />
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	</head>
	<body>
        <div>
            <div id="join_text">
                <span>회원가입<br></span>
            </div>
            <div id="target_select">
            <div id="join_owner" onclick="location.href='./join_owner.jsp'">
                <span id="pet_owner">펫오너</span>
                <br>
                <br>
                <div id="pet_owner_text">
                    <span>진료비와 질병 데이터베이스</span>
                    <span>조회 및 커뮤니티를 위해</span>
                    <span>지금 바로 가입하세요</span>
                </div>
                <br>
                <br>
                <br>
  	 	        <button id="button_owner">펫오너로 가입</button>
            </div>
            <div id="join_service">
                <span id="pet_owner">펫서비스</span>
                <br>
                <br>
                <div id="pet_owner_text">
                    <span>미용 호텔 펜션 카페 훈련소 장례 및</span>
                    <span>기타 펫 업체이시면 지금 바로 가입 후,</span>
                    <span>무료로 홍보해 보세요</span>
                </div>
                <br>
                <br>
                <br>
                <button id="button_owner">펫서비스로 가입</button>
            </div>
            </div>
        </div>
	</body>
</html>