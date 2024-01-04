<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/header2.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(function() {		
		$.ajax({
			url:"${pageContext.request.contextPath}/diagnosis/diagnosisList",
			success: function(list) {
				$('#diagnosisList').html(list)
			}//success
		})//ajax	
		
		$('#search').on("propertychange change keyup paste input", function() {
			if($('#search').val() != "") {
				$.ajax({
					url: "${pageContext.request.contextPath}/diagnosis/diagnosisFind",
					data: {
						diagnosis_name : $('#search').val(),
					},
					success: function(list) {
						$('#searchList').html(list)
					}//success
				})//ajax	
			} //if
		})//search		
	})//$
	google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      var data = google.visualization.arrayToDataTable([
    	['지역', '최저가', '평균', '최고가'],
        ['대전광역시', 200, 400, 1000],
        ['대덕구', 250, 460, 1170],
        ['전국', 300, 660, 1120]
      ]);

      var options = {
        chart: {
          title: '근육주사',
          subtitle: '최저가, 평균, and 최고가',
        }
      };

      var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

      chart.draw(data, google.charts.Bar.convertOptions(options));
    }
</script>
<style>

</style>
</head>
<body>
<input type="text" id="search" value="">
<div id = "searchList"></div>
<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
<div id = "diagnosisList"></div>
</body>
</html>