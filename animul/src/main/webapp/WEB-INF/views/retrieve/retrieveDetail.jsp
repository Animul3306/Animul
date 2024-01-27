<%@page import="com.multi.animul.retrieve.RetrieveVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/retrieve/style.css" rel="stylesheet">
<style>
.box {
	border: 5px solid darkblue;
	width: 300px;
	margin: 10%;
	padding: 5%;
	background: skyblue;
}
</style>
<title>Insert title here</title>
<script>
	function OnloadImg(url) {

		var img = new Image();

		img.src = url;

		if (img.width == 0) {
			img.width = 800;
		}

		if (img.height == 0) {
			img.height = 700;
		}

		var img_width = img.width;

		var win_width = img.width + 25;

		var height = img.height + 30;

		var OpenWindow = window.open('', '_blank', 'width=' + img_width
				+ ', height=' + height + ', menubars=no, scrollbars=auto');

		OpenWindow.document
				.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");

	}
</script>
</head>
<%
	List<RetrieveVO> list = (List<RetrieveVO>) request.getAttribute("list");
int result = 0;
if (list != null) {
	result = list.size();
}
%>
<body>
	<div id="container">

		<div class="wid1300">

			<div id="lm" class="cs">
				<h2 class="lm-tit">
					<span>?</span> <strong>보험&질병</strong>
				</h2>
				<ul id="snb">
					<li><a href="insurance"> 보험</a></li>
					<li><a href="retrieve2">질병 검색</a></li>
				</ul>
				<div style="padding-top: 20px;"></div>
			</div>

			<div id="contents">
				<div class="pt-titarea">
					<h3 class="tit">질병 검색</h3>
					<p>강아지의 건강은 견주님들의 건강이라고 생각합니다.<br>
					진단 후 병원가서 신속 검사 및 자가진단 부탁드립니다.</p>
				</div>

				<div class="hd-sch">
					<div class="hd">부위</div>
					<div class="bd"></div>
					<div class="bt">
						<a href="retrieveRegion?region_id=1"><button
								style="cursor: pointer;" class="btn btn-sm btn-blue">눈
								이상</button></a> <a href="retrieveRegion?region_id=2"><button
								style="cursor: pointer;" class="btn btn-sm btn-blue">코
								이상</button></a> <a href="retrieveRegion?region_id=3"><button
								style="cursor: pointer;" class="btn btn-sm btn-blue">다리
								이상</button></a> <a href="retrieveRegion?region_id=4"><button
								style="cursor: pointer;" class="btn btn-sm btn-blue">숨소리
								이상</button></a> <a href="retrieveRegion?region_id=5"><button
								style="cursor: pointer;" class="btn btn-sm btn-blue">귀
								이상</button></a>
					</div>



				</div>
				<table class="list" id="customers">
					<colgroup>
						<col style="width: 20%;">
						<col style="width: 70%;">
						<col style="width: 10%;">

					</colgroup>
					<%
						if (result > 0) {

						for (RetrieveVO bag : list) {
					%>




					<tr>
						<td><%=bag.getResult()%></td>
						<td><%=bag.getResult_text()%></td>
						<td><div class="bt">

								<button style="cursor: pointer;" class="btn btn-sm btn-blue"
									onclick="OnloadImg('${pageContext.request.contextPath}/resources/img/retrieve/<%=bag.getImg()%>')">상세보기</button>
							</div></td>

					</tr>

					<%
						}
					%>
					<%
						}
					%>
				</table>
			</div>

		</div>
	</div>


</body>
</html>