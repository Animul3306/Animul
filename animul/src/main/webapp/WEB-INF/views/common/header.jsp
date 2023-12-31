<!-- <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> -->
<div>d</div>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Insert title here</title>
        <style>
            body {
                margin: 0;
                padding: 0;
            }
    
            header {
                background-color: #8EC693;
                width: 100%;
                height: 100px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 0 20px;
            }
    
            #logo {
                display: flex;
                align-items: center;
            }
    
            #logo img {
                max-height: 100%;
            }
    
            nav {
                display: flex;
            }
    
            nav a {
                margin: 0 10px;
                color: white;
                text-decoration: none;
            }
            
            .login_group {
                float: right;
                margin-left: auto;
                width: auto;
            }
            .login_group a {
                margin: 0 10px;
                color: white;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <header>
            <div id="logo">
                <!-- 로고 이미지를 넣어주세요. -->
                <img src="./resources/img/logo_transparent_resized.png" alt="Logo">
            </div>
            <nav>
                <a href="#">진료비 조회</a>
                <a href="#">주변시설 찾기</a>
                <a href="#">질병 조회</a>
                <a href="#">게시판</a>

                </div>
            </nav>
            <div class="login_group">
                <a href="#">로그인</a>
                <a href="#">회원가입</a>
            </div>  
        </header>
        <!-- 나머지 내용을 계속 작성하세요. -->
    </body>
</html>