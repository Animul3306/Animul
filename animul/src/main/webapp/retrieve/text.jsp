<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
byte[] secretKeyBytes = secretKey.getBytes(StandardCharsets.UTF_8);
SecretKeySpec secretKeySpec = new SecretKeySpec(secretKeyBytes, "HmacSHA256");
Mac mac = Mac.getInstance("HmacSHA256");
mac.init(secretKeySpec);
byte[] signature = mac.doFinal(body.getBytes(StandardCharsets.UTF_8));
String signatureHeader = Base64.getEncoder().encodeToString(signature);
</head>
<body>

</body>
</html>