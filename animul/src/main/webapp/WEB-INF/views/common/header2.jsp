<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css" />
        <script>
            function logout(){
                document.logoutForm.submit();
            }
        </script>
    </head>
    <body>
        <div class="login_group">
            <% 
                Object loggedInUser = session.getAttribute("loggedInUser");

                if(loggedInUser != null) {
            %>
            
                    <form:form name="logoutForm" action="${pageContext.request.contextPath}/member/Logout.do" method="post" style="display: flex">
                        <a href="#" onclick="logout()">로그아웃</a>
                    </form:form>
            		
            		<a href="${pageContext.request.contextPath}/member/mypage.jsp">마이페이지</a>
            		
            <%
                } else {
            %>
            
            <a href="${pageContext.request.contextPath}/member/login.jsp">로그인</a>
            
            <a href="${pageContext.request.contextPath}/member/join.jsp">회원가입</a>
            
            <%
                }
            %>
          
            <a href="cs.jsp">고객센터</a>
        </div>  
        
        <header>
            <nav id="nav_left">
                <a href="${pageContext.request.contextPath}/diagnosis/diagnosisMain.jsp">진료비 조회</a>
                <a href="${pageContext.request.contextPath}/map/hospital.jsp">주변시설 찾기</a>
            </nav>
            
            <div id="logo">
                <!-- 로고 이미지를 넣어주세요. -->
                <a href="${pageContext.request.contextPath}/main.jsp"><img src="${pageContext.request.contextPath}/resources/img/logo_transparent_resized.png" alt="Logo"></a>
            </div>

            <nav id="nav_right">
                <a href="${pageContext.request.contextPath}/retrieve/retrieve.jsp">질병 조회</a>
                <a href="${pageContext.request.contextPath}/bbs/freeList">게시판</a>
            </nav>
        </header>
        <!-- 나머지 내용을 계속 작성하세요. -->
        <br>
    </body>
</html>