<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" 	 prefix="form" %>

<html>
	<head>
		<title>MyPage</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/join_owner.css" />
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
                $.ajax({
                    url: "userInfo.do",
                    type: 'GET',
                    success: function(data) {
                        $("#id").val(data.id);
                        $("#id").attr("disabled", true);

                        $("#name").val(data.member_name);
                        $("#birth").val(ms2Date(data.member_birthday));
                        $("#gender").val(data.member_gender);
                        $("#age").val(data.member_age);
                        $("#email").val(data.member_email);
                        $("#nickname").val(data.member_nickname);
                    }
                })

                $("#button_join").on("click", function() {
                    var password = $("#pass").val();
                    var name = $("#name").val();
                    var birth = $("#birth").val();
                    var gender = $("#gender").val();
                    var age = $("#age").val();
                    var email = $("#email").val();
                    var nickname = $("#nickname").val();

                    $.ajax({
                        url: "Update.do",
                        data: {
                            password: password,
                            name: name,
                            birth: birth,
                            gender: gender,
                            age: age,
                            email: email,
                            nickname: nickname
                        },
                        type: "POST",
                        success: function(result) {
                            alert("수정이 완료되었습니다.");

                            location.href="${pageContext.request.contextPath}/member/mypage-mypet.jsp";
                        } 
                    });
                })
            });
        </script>
	</head>
	<body>
        <table class="join-table">
            <tbody>
                <tr>
                    <th>아이디*</th>
                    <td>
                        <div class="input_button">
                            <input required="required" type="text" maxlength="20" class="input w400" name="id" id="id">
                            <label id="label_id"></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호*</th>
                    <td>
                        <div class="input_button">
                            <input id="pass" name="password" required="required" type="password" placeholder="8~20자리 영문, 숫자 특수문자" autoComplete="off" class="input w400">
                            <label id="pass_not_same"></label>
                        </div>	
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 확인*</th>
                    <td>
                        <div class="input_button">
                            <input id="passcheck" required="required" type="password" placeholder="8~20자리 영문, 숫자 특수문자" autoComplete="off" class="input w400">
                            <label id="pass_not_same2"></label>	
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>이름*</th>
                    <td><input name="name" required="required" type="text" class="input w400" id="name"> </td>
                </tr>
                <tr>
                    <th>생년월일*</th>
                    <td>
                        <input name="birth" required="required" type="date" class="input w400" id="birth">
                    </td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>
                        <select id="gender" name="gender" class="input w400">
                            <option value="" disabled selected hidden>메뉴를 선택하세요</option>
                            <option value="male">남자</option>
                            <option value="female">여자</option>
                            <option value="none">알리지않음</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>나이</th>
                    <td>
                        <input name="age" type="number" class="input w400" id="age">
                    </td>
                </tr>
                <tr>
                    <th>이메일*</th>
                    <td>
                        <div>
                            <div>
                                <div class="input_button" >
                                    <input required="required" type="email" maxlength="320" class="input w330" id="email" name="email">
                                    <input type="button" class="w70" id="emailCheck" value="인증하기">
                                </div>
                                <label id="label_email"></label>
                            </div>
                            <div class="input_button">
                                <input required="required" id="emailCheckNumber" class="input w400" style="display: none" placeholder="인증 번호">
                            </div>
                            <label id="label_email_check"></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>닉네임*</th>
                    <td>
                        <div class="input_button" style="margin-top: 10px;">
                            <input required="required" type="text" maxlength="20" class="input w400" id="nickname" name="nickname">
                            <label id="label_nickname"></label>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <div id="div_button">
            <a href="${pageContext.request.contextPath}/member/mypage.jsp" target="_parent"><input type="button" id="button_cancel" value="취소"></input></a>
            <input type="button" id="button_join" value="가입하기"></button>
        </div>
	</body>
</html>