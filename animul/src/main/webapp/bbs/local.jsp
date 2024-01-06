<%@ include file="/WEB-INF/views/common/header2.jsp" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
       	<span>Community</span>
        <strong>커뮤니티</strong>
   		</h2>
   	
    <ul id="snb">
        <li><a href="/animul/bbs/free">자유 토크</a></li>
        <li><a href="/animul/bbs/local">산책 메이트ㆍ멍냥이 찾기</a></li>
        <li><a href="https://www.animal.go.kr/front/awtis/protection/protectionList.do?menuNo=1000000060">유기동물보호센터 보호중</a></li>
        <li><a href="https://www.1365.go.kr/vols/search.do?query=%EC%9C%A0%EA%B8%B0">유기동물보호센터 봉사관련</a></li>
    </ul>
    <div style="padding-top:20px;"></div>
	</div>
	
            <div class="div-tab" style="padding-top:100px; margin-bottom:20px;">
                <ul>
                        <li name="tabCategory" data-val="1"><a href="/Community/MyPetNews?category=19" name="aCategory">서울/경기/인천</a></li>
                        <li name="tabCategory" data-val="2"><a href="/Community/MyPetNews?category=20" name="aCategory">강원도</a></li>
                        <li name="tabCategory" data-val="3"><a href="/Community/MyPetNews?category=21" name="aCategory">충청도</a></li>
                        <li name="tabCategory" data-val="4"><a href="/Community/MyPetNews?category=21" name="aCategory">경상도</a></li>
                        <li name="tabCategory" data-val="5"><a href="/Community/MyPetNews?category=21" name="aCategory">전라도</a></li>
                        <li name="tabCategory" data-val="6"><a href="/Community/MyPetNews?category=21" name="aCategory">제주도</a></li>

                </ul>
            </div>
            <div id="contents">
             <div class="hd-sch">
                <div class="hd">게시글 검색</div>
                <div class="bd">
                    <select id="selSearchType" class="input">
                        <option value="1">제목 + 내용</option>
                        <option value="2">제목</option>
                        <option value="3">댓글내용</option>
                        <option value="4">게시글 + 댓글</option>
                    </select>
                    <input type="text" class="input" id="txtSearchKeyword" placeholder="검색어를 입력 하세요." style="width:250px;" value="">
                </div>
                <div class="bt">
                    <a style="cursor:pointer;" class="btn btn-sm btn-blue" id="aTermSearch">조회하기</a>
                </div>
                <div style="float:right;">
                    <a style="cursor:pointer;" class="btn btn-sm btn-blue" id="aTermSearch">글쓰기</a>
                </div>
            </div>
            <table class="list">
                <colgroup>
                    <col style="width:80px;">
                    <col style="width:140px;">
                    <col>
                    <col style="width:65px;">
                    <col style="width:100px;">
                    <col style="width:100px;">
                    <col style="width:80px;">
                    <col style="width:80px;">
                </colgroup>
                <thead>
                    <tr>
                        <th class="noBrd">No</th>
                        <th>분류</th>
                        <th colspan="2">제목</th>
                        <th>작성자</th>
                        <th>날짜</th>
                        <th>댓글수</th>
                        <th>조회수</th>
                    </tr>
         		</thead>
                        <tr class="">
                            <td class="noBrd">게시글번호</td>
                            <td>카테고리</td>
                            <td class="subject">
                                   <a href="상세 게시글">제목</a>
                            </td>
                            <td style="border-left-width:0px;">
                                &nbsp;
                            </td>
                            <td>
                                작성자
                            </td>
                            <td>작성일자</td>
                            <td>댓글수</td>
                            <td>조회수</td>
                        </tr>
         		</tbody>
         		</table>
         		</div>
         		</div>

                        
                        
	


</body>
</html>