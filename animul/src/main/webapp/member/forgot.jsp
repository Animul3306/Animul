<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>

<html>
	<head>
		<title>Login</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member/forgot.css" />
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
            $(document).ready(function() {
                // $('#forgot_id_name')
                // $('#forgot_id_email')
                $('#forgot_pwd_id').on('change', function() {
                    $('#id').val($('#forgot_pwd_id').val());
                })
                // $('#forgot_pwd_name')
                // $('#forgot_pwd_email')
                $('#button_id').on("click", function() {
                    var name = $('#forgot_id_name').val();
                    var email = $('#forgot_id_email').val();
                    var button = $('#button_id').val();

                    if (name == '' || name.length == 0) {
                        alert('이름은 공백일 수 없습니다.');
                        name.focus = 1;

                        return false;
                    }
                    if (email == '' || email.length == 0) {
                        alert('이메일은 공백일 수 없습니다.');
                        email.focus = 1;

                        return false;
                    }
                    if (!email.includes('@') || !email.includes('.')) {
                        alert('이메일 형식을 확인해 주세요.');
                        email.focus = 1;

                        return false;
                    }

                    $.ajax({
                        url: 'FindId.do',
                        data: {
                            name: name,
                            email: email
                        },
                        type: "GET",
                        dataType: "text",
                        success: function(result) {
                            if ( result ) {
                                alert(name + '님의 아이디는 ' + result + ' 입니다.')
                            } else {
                                alert("해당 정보로 가입한 회원이 없습니다.");
                            }
                        }
                    })
                });
                
                $('#button_pwd').on("click", function() {
                    var id = $('#forgot_pwd_id').val();
                    var name = $('#forgot_pwd_name').val();
                    var email = $('#forgot_pwd_email').val();
                    var button = $('#button_pwd').val();

                    if (id == '' || id.length == 0) {
                        alert('아이디는 공백일 수 없습니다.');
                        id.focus = 1;

                        return false;
                    }
                    if (name == '' || name.length == 0) {
                        alert('이름은 공백일 수 없습니다.');
                        name.focus = 1;

                        return false;
                    }
                    if (email == '' || email.length == 0) {
                        alert('이메일은 공백일 수 없습니다.');
                        email.focus = 1;

                        return false;
                    }
                    if (!email.includes('@') || !email.includes('.')) {
                        alert('이메일 형식을 확인해 주세요.');
                        email.focus = 1;

                        return false;
                    }

                    $.ajax({
                        url: 'FindPwd.do',
                        data: {
                        	id: id,
                            name: name,
                            email: email
                        },
                        type: "GET",
                        dataType: "json",
                        success: function(result) {
                            if ( result ) {
                                $('.forgot_area').css('display', 'none');
                                $('.pwd_reset').css('display', 'flex');
                            } else {
                                alert("해당 정보로 가입한 회원이 없습니다.");
                            }
                        }
                    })
                });
                
                $('#button_reset').on('click', function() {
                    var pwd1 = $('#forgot_pwd_reset').val();
                    var pwd2 = $('#forgot_pwd_reset2').val();

                    var id = $('#forgot_pwd_id').val();

                    if (pwd1 != pwd2) {
                        alert('비밀번호와 비밀번호 확인이 다릅니다. \n다시 확인해 주세요');

                        return false;
                    } 
                    if (pwd1 == '' || pwd1.length == 0) {
                        alert('비밀번호는 공백일 수 없습니다.');

                        return false;
                    }

                    if (pwd1 == pwd2) {
                        document.logoutForm.submit();

                        // $.ajax({
                        //     url: 'ResetPwd.do',
                        //     data: {
                        //         id: id,
                        //         password: pwd1
                        //     },
                        //     type: "POST",
                        //     dataType: 'json',
                        //     success: function(result) {
                        //         if (result && result.status === 'success') {
                        //             alert('비밀번호 변경이 완료되었습니다.');

                        //             window.location.href = '/member/login.jsp';
                        //         } else {
                        //             alert('오류가 발생했습니다.');
                        //         }
                        //     },
                        //     error: function(xhr, status, error) {
                        //         alert('에러가 발생했습니다.');
                        //     }
                        // });

                        // var xhr = new XMLHttpRequest();

                        // xhr.open('POST', 'ResetPwd.do', true);

                        // var formData = 'id=' + id + '&password=' + pwd1;
                        // xhr.send(formData);

                        // xhr.onreadystatechange = function() {
                        //     if (xhr.readyState === XMLHttpRequest.DONE) {
                        //         if (xhr.status === 200) {
                        //             alert('비밀번호 변경이 완료되었습니다.');

                        //             console.log(xhr.responseText);
                        //         } else {
                        //             alert('오류가 발생했습니다.');

                        //             console.error('Request failed with status:', xhr.status);
                        //         }
                        //     }
                        // };
                    }
                })
            });
        </script>
	</head>
	<body>
        <div class="forgot_area">
            <div class="forgot_box forgot_id">
                <div class="forgot_head">
                    <h3 class="forgot_title">아이디 찾기</h3>
                </div>
                <div class="forgot_body">
                    <input type="text" id="forgot_id_name" placeholder="이름">
                    <input type="text" id="forgot_id_email" placeholder="이메일">
                    <button id="button_id">아이디 찾기</button>
                </div>
            </div>

            <div class="forgot_box forgot_pwd">
                <div class="forgot_head">
                    <h3 class="forgot_title">비밀번호 재설정</h3>
                </div>
                <div class="forgot_body">
                    <input type="text" id="forgot_pwd_id" placeholder="아이디">
                    <input type="text" id="forgot_pwd_name" placeholder="이름">
                    <input type="text" id="forgot_pwd_email" placeholder="이메일">
                    <button id="button_pwd">비밀번호 재설정</button>
                </div>
            </div>
        </div>

        <form:form name="resetPwd" action="${pageContext.request.contextPath}/member/ResetPwd.do" method="post">
            <div class="forgot_area pwd_reset">
                <div class="forgot_box">
                    <div class="forgot_head">
                        <h3 class="forgot_title">비밀번호 재설정</h3>
                    </div>
                    <div class="forgot_body">
                        <input type="text" id="id" name="id" style="display:none">
                        <input type="password" id="forgot_pwd_reset" name="pwd" placeholder="비밀번호">
                        <input type="password" id="forgot_pwd_reset2" placeholder="비밀번호 확인">
                        <button id="button_reset">비밀번호 재설정</button>
                    </div>
                </div>
            </div>
        </form:form>
        <hr>
	</body>
</html>