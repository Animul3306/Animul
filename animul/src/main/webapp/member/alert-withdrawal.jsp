<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>
	<head>
		<title>Withdrawal</title>
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	</head>
	<body>
        <script>
            alert("회원 탈퇴 처리 되었습니다.");

			document.form_redirect.submit();
        </script>
		<form:form action="withdrawal-redirect.do" name="form_redirect" method="post"></form:form>
	</body>
</html>