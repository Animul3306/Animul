<%@ page import="java.util.List"%>
<%@ include file="/WEB-INF/views/common/header2.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<html>
<head>
<meta charset="UTP-8">
<title>Insert title here</title>
<link href="../resources/css/bbs/style.css" rel="stylesheet">
</head>
<body>

	<div id="container">
		<div class="wid1300">
			<div id="lm" class="cs">
				<h2 class="lm-tit">
					<span>Community</span> <strong>커뮤니티</strong>
				</h2>
				<ul id="snb">
					<li><a href="/animul/bbs/freeList">자유 토크</a></li>
					<li><a href="/animul/bbs/localList">산책 메이트ㆍ멍냥이 찾기</a></li>
					<li><a href="/animul/bbs/protectList">유기동물보호센터 보호중</a></li>
					<li><a href="/animul/bbs/shelterList">유기동물보호센터 보호소 </a></li>
				</ul>
				<div style="padding-top: 20px;"></div>
			</div>

			<div id="contents">
				<div class="pt-titarea">
					<h3 class="tit">유기동물보호센터 보호중..</h3>
					<p>전국 유기동물 보호센터에 보호중인 동물들 입니다.</p>
				</div>
				<form action="" method="get">
				<div class="hd-sch">
					<div class="hd">게시글 검색</div>
					<div class="bd"> 
					
					<select name="type" class="input">
							<option value="title"
								<c:if test="${Type eq 'title'}">selected</c:if>>제목</option>
							<option value="content"
								<c:if test="${Type eq 'content'}">selected</c:if>>내용</option>
							<option value="title_content"
								<c:if test="${Type eq 'title_content'}">selected</c:if>>제목+내용</option>
							<option value="writer"
								<c:if test="${Type eq 'writer'}">selected</c:if>>작성자</option>
						</select> <input type="text" class="input" name="word"
							placeholder="검색어를 입력 하세요." style="width: 250px;"
							value="" />
							
					</div>

					<div class="bt">
						<button type="submit" style="cursor: pointer;"
							class="btn btn-sm btn-blue">조회하기</button>
					</div>
					<div class="pro-lst" style="border-top:#E8EDF0 1px solid; margin-top:10px; padding-left:20px;">
                        <div class="probx">
                            <a href="https://naver.me/FHA6StSm" target="_blank">
                                <span class="thumb"><img src="https://image.msbg.io?p=mocoblob.blob.core.windows.net/assets/magazine/img/14_1704160417508_0.png" alt="" style="width:315px;height:315px;"></span>
                                <div class="desc" style="height:80px !important">
                                    <p class="tit">😚만져주면 뒷발을 움직이는 이유!</p>
                                </div>
                            </a>
                        </div>
                        <div class="probx">
                            <a href="https://m.blog.naver.com/mnbogam/223280181583?referrerCode=1" target="_blank">
                                <span class="thumb"><img src="https://image.msbg.io?p=mocoblob.blob.core.windows.net/assets/magazine/img/14_1704160384106_0.png" alt="" style="width:315px;height:315px;"></span>
                                <div class="desc" style="height:80px !important">
                                    <p class="tit">🐷울 애기 다이어트 제대로 시키는 방법!</p>
                                </div>
                            </a>
                        </div>
                        <div class="probx">
                            <a href="https://m.blog.naver.com/PostView.naver?blogId=mnbogam&amp;logNo=223300590220&amp;navType=by" target="_blank">
                                <span class="thumb"><img src="https://image.msbg.io?p=mocoblob.blob.core.windows.net/assets/magazine/img/14_1704160353485_0.png" alt="" style="width:315px;height:315px;"></span>
                                <div class="desc" style="height:80px !important">
                                    <p class="tit">🥸사료를 맛있어 하는지 알아보는 방법!</p>
                                </div>
                            </a>
                        </div>
                        <div class="probx">
                            <a href="https://naver.me/FLhCyIIC" target="_blank">
                                <span class="thumb"><img src="https://image.msbg.io?p=mocoblob.blob.core.windows.net/assets/magazine/img/14_1704160296949_0.png" alt="" style="width:315px;height:315px;"></span>
                                <div class="desc" style="height:80px !important">
                                    <p class="tit">🥲고양이가 배변 실수 하는 이유가 뭘까?</p>
                                </div>
                            </a>
                        </div>
                        <div class="probx">
                            <a href="https://m.blog.naver.com/PostView.naver?blogId=mnbogam&amp;logNo=223299680015&amp;navType=by" target="_blank">
                                <span class="thumb"><img src="https://image.msbg.io?p=mocoblob.blob.core.windows.net/assets/magazine/img/14_1703557316041_0.png" alt="" style="width:315px;height:315px;"></span>
                                <div class="desc" style="height:80px !important">
                                    <p class="tit">💨사람 가습기, 고양이랑 함께 써두 되나요?</p>
                                </div>
                            </a>
                        </div>
                        <div class="probx">
                            <a href="https://naver.me/FHAvDxCU" target="_blank">
                                <span class="thumb"><img src="https://image.msbg.io?p=mocoblob.blob.core.windows.net/assets/magazine/img/14_1703557279693_0.png" alt="" style="width:315px;height:315px;"></span>
                                <div class="desc" style="height:80px !important">
                                    <p class="tit">😣고양이는 왜 옷을 싫어하는 걸까?</p>
                                </div>
                            </a>
                        </div>
                        <div class="probx">
                            <a href="https://m.blog.naver.com/mnbogam/223289088715?referrerCode=1" target="_blank">
                                <span class="thumb"><img src="https://image.msbg.io?p=mocoblob.blob.core.windows.net/assets/magazine/img/14_1703557221309_0.png" alt="" style="width:315px;height:315px;"></span>
                                <div class="desc" style="height:80px !important">
                                    <p class="tit">💃실내에서 강아지와 뛰어노는 방법은~</p>
                                </div>
                            </a>
                        </div>
                        <div class="probx">
                            <a href="https://naver.me/GUtsCmKj" target="_blank">
                                <span class="thumb"><img src="https://image.msbg.io?p=mocoblob.blob.core.windows.net/assets/magazine/img/14_1703557155645_0.png" alt="" style="width:315px;height:315px;"></span>
                                <div class="desc" style="height:80px !important">
                                    <p class="tit">❄️눈인가 소금인가? 길거리 염화칼슘!</p>
                                </div>
                            </a>
                        </div>
                        <div class="probx">
                            <a href="https://m.blog.naver.com/PostView.naver?blogId=mnbogam&amp;logNo=223234679443&amp;navType=by" target="_blank">
                                <span class="thumb"><img src="https://image.msbg.io?p=mocoblob.blob.core.windows.net/assets/magazine/img/14_1702866979107_0.png" alt="" style="width:315px;height:315px;"></span>
                                <div class="desc" style="height:80px !important">
                                    <p class="tit">🫢눈 마주치면 피하는 이유가 뭘까?</p>
                                </div>
                            </a>
                        </div>
                </div>
</body>
</html>