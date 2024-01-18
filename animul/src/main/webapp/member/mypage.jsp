<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>

<html>
	<head>
		<title>MyPage</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/mypage.css" />
        <style>
            #menu_list {
                display: flex;
                flex-direction: column;
            }

            iframe {
                width: 100%;
                height: 750px;
                border: none;
            }

            #main_bar {
                width: 100%;
                height: 750px;

                display: flex;
                flex-direction: row;
            }
        </style>
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
            var flagInterval = false;

            setInterval(function() {
                if (!flagInterval) {
                    $.ajax({
                        url: 'checkSessionStatus.do',
                        method: 'GET',
                        success: function(response) {
                            if (response === 'SESSION_EXPIRED') {
                                flagInterval = true;
                                alert('회원이 아닙니다. 메인 페이지로 돌아갑니다.');

                                location.href="${pageContext.request.contextPath}/main.jsp";
                            }
                        }
                    });
                }
            }, 2000);
            
        </script>
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
            <div id="main_bar">
                <iframe src="mypage-myinfo.jsp" id="iframe" name="iframe"></iframe>
            </div>
        </div>
	</body>
</html>