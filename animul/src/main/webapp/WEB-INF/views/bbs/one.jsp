<%@ include file="/WEB-INF/views/common/header2.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTP-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../resources/css/bbs/style.css" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<style>
</style>
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
					<li><a
						href="https://www.animal.go.kr/front/awtis/protection/protectionList.do?menuNo=1000000060">유기동물보호센터
							보호중</a></li>
					<li><a
						href="https://www.1365.go.kr/vols/search.do?query=%EC%9C%A0%EA%B8%B0">유기동물보호센터
							봉사관련</a></li>
				</ul>
				<div style="padding-top: 20px;"></div>
			</div>

			<div id="contents">
				<div class="pt-titarea">
					<h3 class="tit">자유 토크</h3>
					<p>마이펫 자랑, 고민 등 자유롭게 작성하는 게시판 입니다!!</p>
				</div>
				<div class="vew-wr">
					<h4 class="subject">${vo.bbs_title}</h4>
					<ul class="date">
						<li>작성자 : ${vo.member_id}</li>
						<li>작성일자 : ${vo.bbs_date}</li>
						<li>조회수 : ${vo.bbs_hit}</li>
					</ul>
					<div class="dv-vew" id="dPostScriptList">${vo.bbs_content}</div>
				</div>
        <div class="bottom-write">
            <div class="inbx">
           		<input type="text" id="commentWriter" placeholder="작성자">
                <input type="text" class="textarea block" id="commentContents" placeholder="내용">
                <button style="cursor:pointer" class="bt btn btn-blue" onclick="commentWrite()">댓글작성</button>           
            </div>
        </div>

	<div class="bpttom-lst">
		<div  id="comment-list">
	    <table>
	        <tr>
	            <th>작성자</th>
	            <th>내용</th>
	            <th>작성시간</th>

	        </tr>
	        <c:forEach items="${replyList}" var="replyVO">
	            <tr>
	                <td>${replyVO.member_id}</td>
	                <td>${replyVO.reply_content}</td>
	                <td>${replyVO.reply_date} </td>

	            </tr>
	        </c:forEach>
   		</table>
    	</div>
    </div>
    
        
		

            <div class="btn-box">
                    <a href="freeUpdate?bbs_id=${vo.bbs_id}" class="btn btn-blue wide">수정</a>
                    <a href="delete?bbs_id=${vo.bbs_id}" style="cursor:pointer" class="btn btn-red wide" id="delete">삭제</a>
               		<a href="freeList" class="btn btn-gray wide">목록</a>
            </div>
            </div><!-- /wid1300 -->
        </div>
   

</body>
<script>
const commentWrite = () => {
    const writer = document.getElementById("commentWriter").value;
    const contents = document.getElementById("commentContents").value;
    const board = '${vo.bbs_id}';
    console.log("작성자: ", writer);
    console.log("내용: ", contents);
    $.ajax({
        type: "post",
        url: "${pageContext.request.contextPath}/comment/save",
        data: {
            "member_id" : writer,
            "reply_content": contents,
            "bbs_id" : board
        },
        dataType: "json",
        success: function(replyList) {
            console.log("작성성공");
            console.log(replyList);
            let output = "<table>";
            output += "<th>작성자</th>";
            output += "<th>내용</th>";
            output += "<th>작성시간</th></tr>";
            for(let i in replyList){
                output += "<tr>";
                output += "<td>"+replyList[i].member_id+"</td>";
                output += "<td>"+replyList[i].reply_content+"</td>";
                output += "<td>"+replyList[i].reply_date+"</td>";
                output += "</tr>";
            }
            output += "</table>";
            document.getElementById('comment-list').innerHTML = output;
            document.getElementById('commentWriter').value='';
            document.getElementById('commentContents').value='';
        },
        error: function() {
            console.log("실패");
        }
    });
    
	$("#replyDelete").click (function(){

		let reply_id = $(this).attr("reply_id");	
		let bbs_id = '${vo.bbs_id}'
		
		$.ajax({
			data : {
				"reply_id" : reply_id,
				"bbs_id" : bbs_id
			},
			url : "${pageContext.request.contextPath}/comment/delete",
			type : 'POST',
			success : function(result){
				replyListInit();
				alert('삭제가 완료되었습니다.');
			}
		});		
			
	 });
}
</script>
</html>