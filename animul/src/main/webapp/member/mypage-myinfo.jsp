<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" 	 prefix="form" %>

<html>
	<head>
		<title>My Page INFO</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/mypage-myinfo.css" />
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
            function ms2Date(ms) {
                var year = new Date(ms).getFullYear();
                var month = (new Date(ms).getMonth() + 1);
                var date = new Date(ms).getDate();

                month = (month < 10 ? '0' : '') + month;

                return year + "-" + month + "-" + date;
            }

            $(document).ready(function() {
                // 페이지 로드 시 유저 정보 비동기로 가져오기
                $.ajax({
                    url: 'userInfo.do',
                    type: 'GET',
                    success: function(data) {
                        // 성공 시 유저 정보를 출력
                        $('#userInfo').html(
                            '<table>' +
                            '<tr><td>이름</td><td>' + data.member_name + '</td></tr>' +
                            '<tr><td>이메일</td><td>' + data.member_email + '</td></tr>' +
                            '<tr><td>닉네임</td><td>' + data.member_nickname + '</td></tr>' +
                            '<tr><td>생일</td><td>' + ms2Date(data.member_birthday) + '</td></tr>' +
                            '<tr><td>성별</td><td>' + data.member_gender + '</td></tr>' +
                            '<tr><td>회원 탈퇴</td><td> <button id="button_withdrawal" onclick="func_withdrawal()">회원 탈퇴</button>' +
                            '</table>'
                        );
                    },
                    statusCode: {
                        403: function() {
                            console.log("세션이 만료되었습니다.");
                        }
                    }
                });

                $("#button_modify").on("click", function() {
                    location.href="./mypage-infoModify.jsp";
                });
            });

            function func_withdrawal() {
                console.log("Hello");
                var confirm_ok = confirm("정말로 탈퇴 하시겠습니까?");

                if (confirm_ok == true) {
                    // location.href="withdrawal.do";

                    document.form_withdrawal.submit();
                }
            }
        </script>
	</head>
	<body>
        <form:form action="withdrawal.do" name="form_withdrawal" method="post"></form:form>
        <div>
            <div>
                내 정보 관리
            </div>
            <div id="userInfo">

            </div>
            <div id="div_modify">
                <input type="button" id="button_modify" value="정보 수정">
            </div>
        </div>
	</body>
</html>