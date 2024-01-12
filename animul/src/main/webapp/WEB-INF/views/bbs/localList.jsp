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
        <li><a href="/animul/bbs/freeList">자유 토크</a></li>
        <li><a href="/animul/bbs/localList">산책 메이트ㆍ멍냥이 찾기</a></li>
        <li><a href="https://www.animal.go.kr/front/awtis/protection/protectionList.do?menuNo=1000000060">유기동물보호센터 보호중</a></li>
        <li><a href="https://www.1365.go.kr/vols/search.do?query=%EC%9C%A0%EA%B8%B0">유기동물보호센터 봉사관련</a></li>
    </ul>
    <div style="padding-top:20px;"></div>
	</div>
	

           
        <div id="contents">
            <div class="pt-titarea">
					<h3 class="tit">산책 메이트 와 멍냥이 찾아요</h3>
					<p>마이펫 자랑, 고민 등 자유롭게 작성하는 게시판 입니다!!</p>
				</div>
             <div class="hd-sch">
                <div class="hd">게시글 검색</div>
                <div class="bd">
                    <select id="selSearchType" class="input">
                        <option value="title">제목 + 내용</option>
                        <option value="content">제목</option>
                        <option value="writer">작성자</option>

                    </select>
                    <input type="text" class="input" id="txtSearchKeyword" placeholder="검색어를 입력 하세요." style="width:250px;" value="">
                </div>
                <div class="bt">
                    <a style="cursor:pointer;" class="btn btn-sm btn-blue" id="aTermSearch">조회하기</a>
                </div>
               <div style="float: right;">
						<a href="insert2.jsp" style="cursor: pointer;"
							class="btn btn-sm btn-blue" id="aTermSearch">글쓰기</a>
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
                        <th class="noBrd">NO</th>
                        <th>분류</th>
                        <th colspan="2">제목</th>
                        <th>작성자</th>
                        <th>날짜</th>
                        <th>댓글수</th>
                        <th>조회수</th>
                    </tr>
         		</thead>
                       <c:forEach items="${list}" var="vo">
                        <tr class="">
                            <td class="noBrd">${vo.bbs_id}</td>
                            <td>${vo.bbs_cate}</td>
                            <td class="subject">
                                   <a href="one?bbs_id=${vo.bbs_id}">
                                   ${vo.bbs_title}</a>
                            </td>
                            <td style="border-left-width:0px;">
                                &nbsp;
                            </td>
                            <td>
                              ${vo.member_id}
                            </td>
                            <td>${vo.bbs_date} </td>
                            <td>댓글수</td>
                            <td>${vo.bbs_hit}</td>
                        </tr>
                    </c:forEach>
         		</tbody>
         		</table>
         		</div>
         		</div>
         		
			<div class="paging" style="padding-top:20px">
				<c:choose>
					<c:when test="${paging.page<=1}">
					<span><a class="direction prev"></a></span>
					</c:when>
					<c:otherwise>
						<a href="localList?page=${paging.page-1}" class="direction prev">[이전]</a>
						
						
					</c:otherwise>
				</c:choose>
				
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
					var="i" step="1">
					<c:choose>
						<c:when test="${i eq paging.page}">
							<span>${i}</span>
						</c:when>

						<c:otherwise>
							<a href="localList?page=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${paging.page>=paging.maxPage}">
						<span><a class="direction next"></a></span>
					</c:when>
					<c:otherwise>
						<a href="localList?page=${paging.page+1}" class="direction next">[다음]</a>
					</c:otherwise>
				</c:choose>
				
			</div>
                        
                        
	


</body>
</html>