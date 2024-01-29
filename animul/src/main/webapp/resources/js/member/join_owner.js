var checkId = false;
			var checkPassword = false;
			var checkEmail = false;
			var checkNickname = false;
			
			var authNumber = 'abcd';

			function changeInvisible() {
				var terms_box = document.getElementById('terms_box');
				var join_box = document.getElementById('join_box');
                
				var top_h3 = document.getElementById('top_h3');
				var top_img = document.getElementById('top_img');
                var top_img2 = document.getElementById('top_img2');

				terms_box.style.display = 'none';
				join_box.style.display = 'block';

				top_h3.textContent = "회원가입";

                top_img.style.display = 'none';
                top_img2.style.display = 'block';
			}

			function checkboxControl() {
				var join_agree1 = document.getElementById("join_agree1");
				var join_agree2 = document.getElementById("join_agree2");
				var join_agree3 = document.getElementById("join_agree3");

				if (join_agree1.checked & join_agree2.checked) { join_agree3.checked = 1; button_next.style.backgroundColor = "#8ec693"; button_next.focus(); }
				else { join_agree3.checked = 0; button_next.style.backgroundColor = "#5e5e5e"; }
			}
			function checkboxControl2() {
				var join_agree1 = document.getElementById("join_agree1");
				var join_agree2 = document.getElementById("join_agree2");
				var join_agree3 = document.getElementById("join_agree3");

				var button_next = document.getElementById("button_next");

				if (join_agree3.checked) { join_agree1.checked = 1; join_agree2.checked = 1; button_next.style.backgroundColor = "#8ec693"; button_next.focus(); }
				else {join_agree1.checked = 0; join_agree2.checked = 0; button_next.style.backgroundColor = "#5e5e5e";} 
			}

            function nextStep(){
				var join_agree3 = document.getElementById("join_agree3");

				if (join_agree3.checked) { changeInvisible(); }
				else { alert("필수 항목을 모두 체크해 주세요."); }
			}

			function showLoginError() {
				alert('회원가입에 성공하셨습니다.');
			}
			
			function checkAllClear() {
				if ( !checkId ) {
					alert("아이디를 확인해 주세요.");

					$("#id").focus();
				} else if ( !checkPassword ) {
					alert("비밀번호를 확인해 주세요.");

					$("#password").focus();
				} else if ( !checkEmail ) {
					alert("이메일을 확인해 주세요.");

					$("#email").focus();
				} else if ( !checkNickname ) {
					alert("닉네임을 확인해 주세요.");

					$("#nickname").focus();
				} else {
					return true;
				}

				return false;
			}

			$(document).ready(function() {
				$('#pass').on('focusout', function() {
					var pass = $('#pass').val();
					var passcheck = $('#passcheck').val();
					var pass_not_same = $('#pass_not_same');
					var pass_not_same2 = $('#pass_not_same2');

					pass_not_same.css("display", "block");
					pass_not_same2.css("display", "block");
					
					if (pass == '' || pass.length == 0) {
						pass_not_same.text("비밀번호는 공백일 수 없습니다.");
						pass_not_same.css('color', 'red');
						
						checkPassword = false;
					} else if (pass != passcheck) {
						pass_not_same.text("비밀번호와 비밀번호 확인이 다릅니다.");
						pass_not_same.css('color', 'red');
						pass_not_same2.text("비밀번호와 비밀번호 확인이 다릅니다.");
						pass_not_same2.css('color', 'red');

						checkPassword = false;
					} else {
						pass_not_same.text("사용 가능한 비밀번호 입니다.");
						pass_not_same.text2("비밀번호 일치");
						pass_not_same.css('color', 'lightgreen');
						pass_not_same2.css('color', 'lightgreen');

						checkPassword = true;
					}
				});

				$('#passcheck').on('focusout', function() {
					var pass = $('#pass').val();
					var passcheck = $('#passcheck').val();
					var pass_not_same = $('#pass_not_same');
					var pass_not_same2 = $('#pass_not_same2');

					pass_not_same.css("display", "block");
					pass_not_same2.css("display", "block");
					
					if (passcheck == '' || passcheck.length == 0) {
						pass_not_same2.text("비밀번호는 공백일 수 없습니다.");
						pass_not_same2.css('color', 'red');
						
						checkPassword = false;
					} else if (pass != passcheck) {
						pass_not_same2.text("비밀번호와 비밀번호 확인이 다릅니다.");
						pass_not_same2.css('color', 'red');

						checkPassword = false;
					} else {
						pass_not_same.text("사용 가능한 비밀번호 입니다.")
						pass_not_same2.text("비밀번호 일치");
						pass_not_same.css('color', 'lightgreen');
						pass_not_same2.css('color', 'lightgreen');

						checkPassword = true;
					}
				})

				$('#birth').change(function() {
					var currentDate = new Date();
					var birthDate = new Date($('#birth').val());

					var age = currentDate.getFullYear() - birthDate.getFullYear();

					if (currentDate.getMonth() < birthDate.getMonth() || (currentDate.getMonth() === birthDate.getMonth() && currentDate.getDate() < birthDate.getDate())) {
						age--;
					}

					$('#age').val(age);
				});

				$('#id').on("focusout", function() {
					var id = $("#id").val();

					if(id == '' || id.length == 0) {
						$('#label_id').css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
						
						checkId = false;
						return false;
					}

					$.ajax({
						url : 'ConfirmId.do',
						data : {
							id : id
						},
						type : "POST",
						dataType : 'json',
						success : function(result) {
							if ( result == true ) {
								$("#label_id").css("color", "lightgreen").text("사용 가능한 ID 입니다.");

								checkId = true;
							} else {
								$("#label_id").css("color", "red").text("사용할 수 없는 ID 입니다.");

								checkId = false;
							}
						}
					});
				});
				
				$('#emailCheck').on("click", function() {
					var email = $("#email").val();
					var emailPatten = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

					if(email == '' || email.length == 0 || !emailPatten.test(email)) {
						$('#label_email').css("color", "red").text("이메일 형식을 확인해 주세요");

						checkEmail = false;
						return false;
					}

					$.ajax({
						url : 'ConfirmEmail.do',
						data : {
							email : email
						},
						type : "POST",
						dataType : 'json',
						success : function(result) {
							if ( result == true ) {
								$("#label_email").css("color", "lightgreen").text("사용 가능한 이메일 입니다.");
								$("#emailCheckNumber").css("display", "block");

								$.ajax({
									url: 'MailCheck.do',
									data: {
										email: email
									},
									type: "GET",
									dataType: 'text',
									success: function(result) {
										console.log("data: " + result);

										authNumber = result;
										alert('인증번호를 보냈습니다.');
									}
								});

							} else {
								$("#label_email").css("color", "red").text("사용할 수 없는 이메일 입니다.");

								checkEmail = false;
							}
						}
					});
				});

				$('#emailCheckNumber').on("focusout", function() {
					var checkNumber = $("#emailCheckNumber").val();

					if (authNumber == checkNumber) {
						$("#label_email_check").css("color", "lightgreen").text("이메일 인증에 성공했습니다.");

						checkEmail = true;
					} else {
						$("#label_email_check").css("color", "red").text("이메일 인증에 실패했습니다.");
						
						checkEmail = false;
					}	
				});
				
				$('#nickname').on("focusout", function() {
					var nickname = $("#nickname").val();

					if(nickname == '' || nickname.length == 0) {
						$('#label_nickname').css("color", "red").text("공백은 닉네임으로 사용할 수 없습니다.");

						checkNickname = false;
						return false;
					}

					$.ajax({
						url : 'ConfirmNickname.do',
						data : {
							nickname : nickname
						},
						type : "POST",
						dataType : 'json',
						success : function(result) {
							if ( result == true ) {
								$("#label_nickname").css("color", "lightgreen").text("사용 가능한 닉네임 입니다.");
						
								checkNickname = true;
							} else {
								$("#label_nickname").css("color", "red").text("사용할 수 없는 닉네임 입니다.");
				
								checkNickname = false;
							}
						}
					});
				});


				$("#button_join").on("focusout", function() {
					// var checkId = false;
					// var checkPassword = false;
					// var checkEmail = false;
					// var checkNickname = false;
					if ( checkAllClear ) {
                        document.joinForm.submit();
					}
				});
			})