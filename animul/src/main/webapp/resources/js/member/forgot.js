var auth_id_number = '';
var auth_pwd_number = '';

$(document).ready(function() {
    // $('#forgot_id_name')
    // $('#forgot_id_email')
    $('#forgot_pwd_id').on('change', function() {
        $('#id').val($('#forgot_pwd_id').val());
    })
    // $('#forgot_pwd_name')
    // $('#forgot_pwd_email')

    $('#button_id_email').on("click", function() {
        var email = $("#input_id_email").val();

        $.ajax({
            url: 'MailCheck.do',
            data: {
                email: email
            },
            type: "GET",
            dataType: 'text',
            success: function(result) {
                console.log("data: " + result);

                auth_id_number = result;
                alert('인증번호를 보냈습니다.');

                $("#input_id_email_check").css("display", "block");
            }
        });
    });

    $('#input_id_email_check').on('focusout', function() {
        if ( $('#input_id_email_check').val() == auth_id_number ) {
            $('#label_id_email_check').css("color", "black").text("이메일 인증에 성공하였습니다.");

            $("#input_id_email").prop("disabled", true);
            $("#input_id_email_check").prop("disabled", true);

            $("#button_id").prop("disabled", false);
        } else {
            $("#label_id_email_check").css("color", "red").text("인증번호가 잘못 되었습니다.");

            $("#input_id_email_check").focus();
        }
    });

    $('#button_pwd_email').on("click", function() {
        var email = $("#input_pwd_email").val();

        $.ajax({
            url: 'MailCheck.do',
            data: {
                email: email
            },
            type: "GET",
            dataType: "text",
            success: function(result) {
                console.log("data: " + result);

                auth_pwd_number = result;
                alert('인증번호를 보냈습니다.');

                $("#input_pwd_email_check").css("display", "block");
            }
        })
    });

    $('#input_pwd_email_check').on('focusout', function() {
        if ( $('#input_pwd_email_check').val() == auth_pwd_number ) {
            $('#label_pwd_email_check').css("color", "black").text("이메일 인증에 성공하였습니다.");

            $("#input_pwd_email").prop("disabled", true);
            $("#input_pwd_email_check").prop("disabled", true);

            $("#button_pwd").prop("disabled", false);
        } else {
            $("#label_pwd_email_check").css("color", "red").text("인증번호가 잘못 되었습니다.");

            $("#input_pwd_email_check").focus();
        }
    });

    $('#button_id').on("click", function() {
        var name = $('#input_id_name').val();
        var email = $('#input_id_email').val();
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
                    alert(name + '님의 아이디는 ' + result + ' 입니다.');

                    location.href="../main.jsp"
                } else {
                    alert("해당 정보로 가입한 회원이 없습니다.");
                }
            }
        })
    });
    
    $('#button_pwd').on("click", function() {
        var id = $('#input_pwd_id').val();
        var name = $('#input_pwd_name').val();
        var email = $('#input_pwd_email').val();
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
        }
    })
});