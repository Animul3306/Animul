<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>

<html>
	<head>
		<title>MyPage</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/mypage.css" />
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	</head>
	<body>
        <div style="display: flex; flex-direction: row; height: auto;">
            <div id="left_bar">
                <div>
                    <label>마이페이지</label>
                </div>
                <div id="menu_list">
                    <label>내 정보 수정</label>
                    <label>마이펫</label>
                    <label>커뮤니티 내역</label>
                </div>
            </div>
            <div>
                <iframe src="mypage-myinfo.jsp"></iframe>
            </div>
        </div>
	</body>
</html>