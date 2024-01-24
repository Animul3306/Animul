<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" 	 prefix="form" %>

<html>
	<head>
		<title>My Page INFO</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/mypage-myinfo.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/join_owner.css" />
        <style>
            #button_withdrawal {
                width: 100px;
                height: 40px;
                border: none;
                border-radius: 10px;
                background: #8ec693;

                display: flex;
                justify-content: center;
            }
        </style>
        
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
            function ms2Date(ms) {
                var year = new Date(ms).getFullYear();
                var month = (new Date(ms).getMonth() + 1);
                var date = new Date(ms).getDate();

                month = (month < 10 ? '0' : '') + month;

                return year + "-" + month + "-" + date;
            }
			function ageCalc(birth) {
				var currentDate = new Date();
				var birthDate = new Date(birth);

				var age = currentDate.getFullYear() - birthDate.getFullYear();

				if (currentDate.getMonth() < birthDate.getMonth() || (currentDate.getMonth() === birthDate.getMonth() && currentDate.getDate() < birthDate.getDate())) {
					age--;
				}

				return age;
			}

            $(document).ready(function() {
                // 페이지 로드 시 유저 정보 비동기로 가져오기
                $.ajax({
                    url: 'userInfo.do',
                    type: 'GET',
                    success: function(data) {
                        // 성공 시 유저 정보를 출력
                        // $('#userInfo').html(
                        //     '<table>' +
                        //     '<tr><td>이름</td><td>' + data.member_name + '</td></tr>' +
                        //     '<tr><td>이메일</td><td>' + data.member_email + '</td></tr>' +
                        //     '<tr><td>닉네임</td><td>' + data.member_nickname + '</td></tr>' +
                        //     '<tr><td>생일</td><td>' + ms2Date(data.member_birthday) + '</td></tr>' +
                        //     '<tr><td>성별</td><td>' + data.member_gender + '</td></tr>' +
                        //     '<tr><td>회원 탈퇴</td><td> <button id="button_withdrawal" onclick="func_withdrawal()">회원 탈퇴</button>' +
                        //     '</table>'
                        // ); // id name birth gender age email nickname
                        $("#id").text(data.id);
                        $("#name").text(data.member_name);
                        $("#birth").text(data.member_birthday);
                        $("#gender").text(data.member_gender);
                        $("#age").text( ageCalc(ms2Date(data.member_birthday)) );
                        $("#email").text(data.member_email);
                        $("#nickname").text(data.member_nickname);
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
        <table class="join-table">
            <tbody>
                <tr>
                    <th>아이디</th>
                    <td>
                        <label class="input w400" name="id" id="id"></label>
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td><label name="name" class="input w400" id="name"></label></td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td>
                        <label name="birth" class="input w400" id="birth"></label>
                    </td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>
                        <label name="gender" class="input w400" id="gender"></label>
                    </td>
                </tr>
                <tr>
                    <th>나이</th>
                    <td>
                        <label name="age" type="number" class="input w400" id="age"></label>
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>
                        <label name="emali" class="input w400" id="email"></label>
                    </td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td>
                        <label class="input w400" id="nickname" name="nickname"></label>
                    </td>
                </tr>
                <tr>
                    <th>회원 탈퇴</th>
                    <td>
                        <input type="button" id="button_withdrawal" onclick="func_withdrawal()" value="회원 탈퇴">
                    </td>
                </tr>
            </tbody>
        </table>
        <div id="div_button">
            <a href="${pageContext.request.contextPath}/member/mypage.jsp" target="_parent"><input type="button" id="button_cancel" value="취소"></input></a>
            <input type="button" id="button_join" value="수정하기">
        </div>
	</body>
</html>