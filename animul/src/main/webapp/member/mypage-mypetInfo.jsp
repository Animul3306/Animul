<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" 	 prefix="form" %>

<html>
	<head>
		<title>MyPage</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/join_owner.css" />
		<style>
            .input {
                color: black;
                display: flex;
                align-items: center;
                font-family: "NotoSans_Regular";
            }
            .join-table tr th {
                font-family: "NotoSans_Bold";
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
			function ageCalc(birth) {
				var currentDate = new Date();
				var birthDate = new Date(birth);

				var age = currentDate.getFullYear() - birthDate.getFullYear();

				if (currentDate.getMonth() < birthDate.getMonth() || (currentDate.getMonth() === birthDate.getMonth() && currentDate.getDate() < birthDate.getDate())) {
					age--;
				}

				return age;
			}

            function getCookie(cookieName) {
                var name = cookieName + "=";
                var decodedCookie = decodeURIComponent(document.cookie);
                var cookieArray = decodedCookie.split(';');

                for(var i = 0; i < cookieArray.length; i++) {
                    var cookie = cookieArray[i];
                    while (cookie.charAt(0) == ' ') {
                        cookie = cookie.substring(1);
                    }
                    if (cookie.indexOf(name) == 0) {
                        return cookie.substring(name.length, cookie.length);
                    }
                }
                
                return "";
            }

            $(document).ready(function() {
                $.ajax({
                    url: "../mypet/inquiry.do",
                    data: {
                        petId: getCookie("id")
                    },
                    type: 'GET',
                    success: function(data) {
                        console.log(data);

                        $("#name").text(data.mypet_name);
                        $("#owner_name").text(data.mypet_owner);
                        $("#category").text(data.mypet_category);
                        $("#variety").text(data.mypet_variety);
                        $("#gender").text(data.mypet_gender);
                        if (data.mypet_birthday != null) {
                            $("#age").text(ageCalc(data.mypet_birthday));
                            $("#birthday").text(data.mypet_birthday.substring(5, data.mypet_birthday.length));
                        }
                        $("#weight").text(data.mypet_weight);
                        $("#neutralization").text(data.is_neutralization);
                    }
                })
            });
        </script>
	</head>
	<body>
        <table class="join-table">
            <tbody>
                <tr>
                    <th>펫 이름</th>
                    <td>
                        <div class="input_button">
                            <label class="input w400" id="name"></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="font-size: 17px">주인 아이디</th>
                    <td>
                        <div class="input_button">
                            <label class="input w400" id="owner_name"></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>펫 종류</th>
                    <td>
                        <div class="input_button">
                            <label class="input w400" id="category"></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>견종 (묘종)</th>
                    <td>
                        <div class="input_button">
                            <label class="input w400" id="variety"></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>
                        <div class="input_button">
                            <label class="input w400" id="gender"></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>나이</th>
                    <td>
                        <div class="input_button">
                            <label class="input w400" id="age"></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>생일</th>
                    <td>
                        <div class="input_button">
                            <label class="input w400" id="birthday"></label>
                        </div>
                    </td>
                </tr>

                <tr>
                    <th>무게</th>
                    <td>
                        <div class="input_button">
                            <label class="input w400" id="weight"></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th style="font-size: 17px">중성화 여부</th>
                    <td>
                        <div class="input_button">
                            <label class="input w400" id="neutralization"></label>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <div id="div_button">
            <a href="${pageContext.request.contextPath}/member/mypage-mypet.jsp"><input type="button" id="button_cancel" value="취소"></input></a>
            <input type="button" id="button_join" onclick="location.href='./mypage-mypetModify.jsp'" value="수정하기"></button>
        </div>
	</body>
</html>