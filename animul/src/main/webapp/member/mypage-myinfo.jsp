<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" 	 prefix="form" %>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>

<html>
	<head>
		<title>My Page INFO</title>
		<!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/join.css" /> -->
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
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
                            '<tr><td>생일</td><td>' + data.member_birthday + '</td></tr>' +
                            '<tr><td>성별</td><td>' + data.member_gender + '</td></tr>' +
                            '<tr><td>회원 탈퇴</td><td> <button id="button_withdrawal" onclick="func_withdrawal()">회원 탈퇴</button>' +
                            '</table>'
                        );
                    }
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
                <!-- <table>
                    <tr>
                        <td>이름</td>
                        <td>${member.name}</td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td>${member.email}</td>
                    </tr>
                    <tr>
                        <td>닉네임</td>
                        <td>${member.nickname}</td>
                    </tr>
                    <tr>
                        <td>생일</td>
                        <td>${member.birthday}</td>
                    </tr>
                    <tr>
                        <td>성별</td>
                        <td>${member.gender}</td>
                    </tr>
                    <tr>
                        <td>회원 탈퇴</td>
                        <td><input type="button" value="회원 탈퇴"></td>
                    </tr>
                </table> -->
            </div>
        </div>
	</body>
</html>