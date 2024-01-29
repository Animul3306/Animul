<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>

<html>
	<head>
		<title>MyPage</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/mypage.css" />
        <link href="${pageContext.request.contextPath}/resources/css/bbs/style.css" rel="stylesheet">
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

                                location.href="${pageContext.request.contextPath}/main";
                            }
                        }
                    });
                }
            }, 2000);
            
            function changeIframeSrc(src) {
                var iframe = document.getElementById('iframe');
                var main_bar = document.getElementById('main_bar');

                if(src == "mypage-community.jsp") {
                    main_bar.style.width="1200px";

                    // var iframe = document.getElementById('iframe').contentWindow;
                    // var apiUrl = 'http://localhost:8888/member/mypage-community/api';

                    // iframe.postMessage(apiUrl, 'http://localhost:8888/member/mypage-community.jsp');
                } else {
                    main_bar.style.width="800px";
                }
                
                iframe.src = src;
            }
        </script>
	</head>
	<body>
        <div style="display: flex; flex-direction: row; height: auto; justify-content: center;">
            <!-- <div id="left-bar">
                <div>
                    <label class="left-bar-title">마이페이지</label>
                </div>
                <div id="menu_list">
                    <label class="left-bar-menu" onclick="changeIframeSrc('mypage-myinfo.jsp')">내 정보 수정</label>
                    <label class="left-bar-menu" onclick="changeIframeSrc('mypage-mypet.jsp')">마이펫</label>
                    <label class="left-bar-menu" onclick="changeIframeSrc('mypage-community.jsp')">커뮤니티 내역</label>
                </div>
            </div> -->
            <div id="lm" class="cs">
				<h2 class="lm-tit">
					<span>Community</span> <strong>마이페이지</strong>
				</h2>
				<ul id="snb">
					<li><a onclick="changeIframeSrc('mypage-myinfo.jsp')">내 정보 확인</a></li>
					<li><a onclick="changeIframeSrc('mypage-mypet.jsp')">마이펫</a></li>
					<li><a onclick="changeIframeSrc('mypage-community.jsp')">커뮤니티 내역</a></li>
			
				</ul>
				<div style="padding-top: 20px;"></div>
			</div>
            <div id="main_bar">
                <iframe src="mypage-myinfo.jsp" id="iframe" name="iframe"></iframe>
            </div>
        </div>
	</body>
</html>