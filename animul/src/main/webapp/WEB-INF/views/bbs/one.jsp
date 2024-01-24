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
					<li><a href="/animul/bbs/protectList">유기동물보호센터 보호중</a></li>
					
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
						<li>카테고리 : ${vo.bbs_cate}</li>
						<li>작성자 : ${vo.member_id}</li>
						<li>작성일자 : ${vo.bbs_date}</li>
						<li>조회수 : ${vo.bbs_hit}</li>
					</ul>
					<div class="dv-vew" id="dPostScriptList">
						${vo.bbs_content}<br>
					<div class="select_img" th:if="${vo.bbs_img ne null}">
       				 <img th:src="${vo.bbs_img}" />
       				 <img src="${pageContext.request.contextPath}/${vo.bbs_img}" class="oriImg"/>
   					 </div>
					</div>
				</div>
				<script>
				 $("#bbs_img").change(function(){
				        if(this.files && this.files[0]) {
				            var reader = new FileReader();
				            reader.onload = function(data) {
				                $(".select_img img").attr("src", data.target.result).width(500);
				                $(".select_img").show(); // 파일이 선택되었을 때 이미지 영역을 보여줌
				            }
				            reader.readAsDataURL(this.files[0]);
				        } else {
				            $(".select_img").hide(); // 파일이 선택되지 않았을 때 이미지 영역을 숨김
				        }
				    });
			</script>
		
        <div class="bottom-write">
        <c:if test="${sessionScope.loggedInUser ne null and vo.member_id ne null and sessionScope.loggedInUser eq vo.member_id}">

            <div class="inbx">
           		<input type="text" id="commentWriter" readonly="readonly" placeholder="<%= session.getAttribute("loggedInUser") %>" >
                <input type="text" class="textarea block" id="commentContents" placeholder="내용">
                <button style="cursor:pointer" class="bt btn btn-blue" onclick="commentWrite()">댓글작성</button>           
            </div>
        </c:if>    
            
        </div>
	
	<div class="bottom-lst">
		<div  id="comment-list">
	    <table>
	        <tr>
	            <th>작성자</th>
	            <th>내용</th>
	            <th>작성시간</th>
	            <th></th>
	            <th></th>

	        </tr>
	        <c:forEach items="${replyList}" var="replyVO">
	            <tr>
	                <td><%= session.getAttribute("loggedInUser") %></td>
	                <td>${replyVO.reply_content}</td>
	                <td>${replyVO.reply_date} </td>
	       
	                <td><button type="button" onclick="updateViewBtn('${replyVO.reply_id}','${replyVO.member_id}','${replyVO.reply_content}')">수정</button></td> </td>
	                <td><button type="button" onclick="commentDelete('${replyVO.reply_id}')">삭제</button></td>

	            </tr>
	        </c:forEach>
   		</table>
    	</div>
    </div>
    
        
		
		
            <div class="btn-box">
        <c:if test="${sessionScope.loggedInUser ne null and vo.member_id ne null and sessionScope.loggedInUser eq vo.member_id}">
		    <a href="freeUpdate?bbs_id=${vo.bbs_id}" class="btn btn-blue wide">수정</a>
		    <a href="delete?bbs_id=${vo.bbs_id}" style="cursor:pointer" class="btn btn-red wide" id="delete">삭제</a>
		</c:if>
       
               		<a href="freeList" class="btn btn-gray wide">목록</a>
            </div>
            </div><!-- /wid1300 -->
        </div>
   

</body>
<script>

$(document).ready(function() {
	replylist();
});

function replylist() {
    console.log("댓글목록조회");
    var url = "${pageContext.request.contextPath}/comment/list/";
    var bbs_id = '${vo.bbs_id}';
    var reply_id = '${replyVO.reply_id}';
    
    $.ajax({
        url: url + bbs_id,
        type: "POST",
        dataType: "json",
        success: function (result) {
        	   var output = "";
               output += "<table>";
               output += "<th>작성자</th>";
               output += "<th>내용</th>";
               output += "<th>작성시간</th>";
               output += "<th></th>";
               output += "<th></th></tr>";

               for (let i in result) {
                   output += "<tr>";
                   output += "<td>" + result[i].member_id + "</td>";
                   output += "<td>" + result[i].reply_content + "</td>";
                   output += "<td>" + result[i].reply_date + "</td>";
                   output += "<td>";
                   output += "<c:if test="${sessionScope.loggedInUser ne null and vo.member_id ne null and sessionScope.loggedInUser eq vo.member_id}">"
                   output += '<input type="button" onclick="updateViewBtn(' + result[i].reply_id + ', \'' + result[i].member_id + '\', \'' + result[i].reply_content + '\')" value="수정">';
                   output += "</td>";
                   output += "<td>";
                   output += '<input type="button" onclick="commentDelete(' + result[i].reply_id + ')" value="삭제">';
                   output += "</td>";
                   output += "</c:if>";
                   output += "</tr>";
               }

               output += "</table>";
               $('#comment-list').html(output);
          
           }
       });
   }



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
                output += "<td>"
                output += '<intput type="button" onclick="updateViewBtn(' + replyList[i].reply_id + ',' + replyList[i].reply_content + ', ' + replyList[i].reply_content + ')" value="수정">'
                output += '<intput type="button" onclick="commentDelete(' + replyList[i].reply_id + ')" value="삭제">'
                output += "</td>"
                output += "</tr>";
            }
            output += "</table>";
            document.getElementById('comment-list').innerHTML = output;
            document.getElementById('commentWriter').value='';
            document.getElementById('commentContents').value='';
            
            replylist();
            
            
        },
        error: function() {
            console.log("실패");
        }
    });   
}
	
	
	
	
	function commentDelete(reply_id) {
	    if (confirm("정말 삭제하시겠습니까?") == true) {
	        var url = "${pageContext.request.contextPath}/comment/delete/";

	        $.ajax({
	            type: "post",
	            url: url + reply_id,
	            dataType: 'json',
	            success: function (result) {
	                // 삭제가 성공했을 때만 댓글 목록을 갱신
	                if (result=1) {
	                    replylist();
	                } else {
	                    console.log("댓글 삭제 실패");
	                }
	            },
	            error: function (request, status, error) {
	                console.log("에러 : " + request.status);
	                console.log("message : " + request.responseText);
	                console.log("error: error");
	            }
	        });
	    } else {
	        return false;
	    }
	}
	

	
	function updateViewBtn(reply_id, member_id, reply_content) {
	    console.log("댓글 수정 화면");
	    var a = "";
	    
	    a += '<div class="bpttom-lst">';
	    a += '<div id="comment-list">';
	    a += '<table>';
	    a += '<tr>';
	    a += '<th>작성자</th>';
	    a += '<th>내용</th>';
	    a += '<th></th>';
	    a += '<th></th>';
	    a += '</tr>';
	    a += '<tr>';
	    a += '<td>' + member_id + '</td>';
	    a += '<td><textarea id="replyUpdateContent" style="width: 300px;">' + reply_content + '</textarea></td>';
	    a += '<td>';
	    a += '<button type="button" onclick="commentUpdate(' + reply_id + ')">댓글작성</button>';
	    a += '</td>';
	    a += '<td>';	    
	    a += '<button type="button" onclick="replylist()">취소</button>';
	    a += '</td>';	    
	    a += '</tr>';
	    a += '</div>';
	    a += '</div>';

	    $('#reply_id' + reply_id + '#reply_content').html(a);
	    $('#reply_id' + reply_id + '#reply_content').focus();
	    $('#comment-list').html(a);
	}
	
	
	
	
	function commentUpdate(reply_id){
		console.log("댓글 수정 들어감");
		var url = "${pageContext.request.contextPath}/comment/update/";
		var reply_content = $("#replyUpdateContent").val();
		console.log(reply_content);
	        
	            $.ajax({
	            	url : url + reply_id + "/" + reply_content,
	                type:"post",
	                dataType :'json', 
	                success : function(result) {
	                	replylist();

					},
					error : function(request, status, error) {
						console.log("에러 : " + request.status);
						console.log("message : " + request.responseText);
						console.log("error: error");
					}
	            });

	}
	
	
	
	
	
</script>
</html>