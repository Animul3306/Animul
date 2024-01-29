<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" 	 prefix="form" %>

<html>
	<head>
		<title>MyPage</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/join_owner.css" />
		<style>
            .input {
                display: flex;
                align-items: center;
                font-family: "NotoSans_Regular";
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
            $(document).ready(function() {                
                $.ajax({
                    url: 'userInfo.do',
                    type: 'GET',
                    success: function(data) {
                        $("#owner_id").val(data.id);
                    },
                    statusCode: {
                        403: function() {
                            console.log("세션이 만료되었습니다.");
                        }
                    }
                });

				$('#birth').change(function() {
					var currentDate = new Date();
					var birthDate = new Date($('#birth').val());

					var age = currentDate.getFullYear() - birthDate.getFullYear();

					if (currentDate.getMonth() < birthDate.getMonth() || (currentDate.getMonth() === birthDate.getMonth() && currentDate.getDate() < birthDate.getDate())) {
						age--;
					}

					$('#age').val(age);
				});
            });
        </script>
	</head>
	<body>
        <form:form action="../mypet/addPet.do" name="joinForm" method="post">
        <table class="join-table">
            <tbody>
                <tr>
                    <th>펫 이름</th>
                    <td>
                        <div class="input_button">
                            <input required="required" type="text" maxlength="20" class="input w400" name="name" id="name">
                            <label id="label_name"></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>주인 아이디</th>
                    <td>
                        <div class="input_button">
                            <input required="required" type="text" maxlength="20" class="input w400" name="owner_id" id="owner_id" disabled>
                            <label id="label_owner"></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>펫 종류</th>
                    <td>
                        <div class="input_button">
                            <input required="required" type="text" maxlength="20" class="input w400" name="category" id="category">
                            <label id="label_category"></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>견종 (묘종)</th>
                    <td>
                        <div class="input_button">
                            <input required="required" type="text" maxlength="20" class="input w400" name="variety" id="variety">
                            <label id="label_variety"></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>
                        <div class="input_button">
                            <select id="gender" name="gender" class="input w400">
                                <option value="" disabled selected hidden>메뉴를 선택하세요</option>
                                <option value="남자">수컷</option>
                                <option value="여자">암컷</option>
                                <option value="none">알리지않음</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>생일</th>
                    <td>
                        <div class="input_button">
                            <input name="birth" required="required" type="date" class="input w400" id="birth">
                            <label id="label_birth"></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>나이</th>
                    <td>
                        <div class="input_button">
                            <input required="required" type="text" maxlength="20" class="input w400" name="age" id="age" disabled>
                            <label id="label_age"></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>무게</th>
                    <td>
                        <div class="input_button">
                            <input required="required" type="text" maxlength="20" class="input w400" name="weight" id="weight">
                            <label id="label_weight"></label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>중성화 여부</th>
                    <td>
                        <div class="input_button">
                            <select id="neutralization" name="neutralization" class="input w400">
                                <option value="" disabled selected hidden>메뉴를 선택하세요</option>
                                <option value="true">중성화 함</option>
                                <option value="false">중성화 안함</option>
                                <option value="false">알리지않음</option>
                            </select>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <div id="div_button">
            <a href="${pageContext.request.contextPath}/member/mypage-mypet.jsp"><input type="button" id="button_cancel" value="취소"></input></a>
            <input type="button" id="button_join" onclick="document.joinForm.submit();" value="등록하기"></button>
        </div>
        </form:form>
	</body>
</html>