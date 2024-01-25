<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>
<html>
<head>
	<title>Animul</title>
	<style>

		.disease2 { 
			width: 100%;
            display: flex;
            justify-content: center;
            margin-left: 50px;
            margin-right: 50px;
		}
		
		 .disease a {
            margin: 0 10px;
        }
        .bestList {
		    width: 100%;
		    margin: 35px 0 0;
		}
        
        .article:first-of-type {
   			 padding-top: 15px;
		}
		.article {
		    display: flex;
		    margin-top: 2px;
		    padding: 0 120px 0 0;
		}
		.cate {
		    display: block;
		    height: 20px;
		    margin: 5px 4px 0 0;
		    border: 1px solid #eee;
		    vertical-align: middle;
		    line-height: 18px;
		    box-sizing: border-box;
		    white-space: nowrap;
		}
		.tit {
				margin-left: 10px;
		        font-size: 14px;
			    line-height: 30px;
			    flex: 1 1 auto;
			    text-overflow: ellipsis;
			    overflow: hidden;
			    white-space: nowrap;
			    
		}
		a {
			    text-decoration: none;
			    color: #222;
			    cursor: pointer;
		}	
		
		.pets {
		 height: 100px;
      	 margin-right: 50px;
      	 background: url("resources/css/bbs/pets.png") 100% 0 no-repeat;
      	 background-size: 60% 100%
    }
		.pets2 {
		 height: 100px;
      	 margin-right: 50px;
      	 background: url("resources/css/bbs/pets2.png") 100% 0 no-repeat;
      	 background-size: 50% 100%
    }
    h3 {
   		line-height: 7;
    }
	</style>

</head>
<body>
<div class="disease2">
	<div class="bestList">
		<div class="pets">
		<h3> 게시판 인기글 </h3>
		</div>	
		
			        <c:forEach var="item" items="${bestList}">
			        <div class="article">
			            <span class="cate">${item.bbs_cate}</span>
			          	<a href="bbs/one?bbs_id=${item.bbs_id}" class="tit">${item.bbs_title}</a>
			            <div class="wrap-infor"> 
						<a href="one?bbs_id=${item.bbs_id}" class="cmt"></a>${item.bbs_hit}
						</div>
					</div>
			        </c:forEach>
    			
	</div>
		<div class="bestList">
		<div class="pets2">
		<h3> 게시판 인기글 </h3>
		</div>	
		
			        <c:forEach var="item" items="${bestList}">
			        <div class="article">
			            <span class="cate">${item.bbs_cate}</span>
			          	<a href="bbs/one?bbs_id=${item.bbs_id}" class="tit">${item.bbs_title}</a>
			            <div class="wrap-infor"> 
						<a href="one?bbs_id=${item.bbs_id}" class="cmt"></a>${item.bbs_hit}
						</div>
					</div>
			        </c:forEach>
    			
	</div>
</div>
	


</body>
</html>
