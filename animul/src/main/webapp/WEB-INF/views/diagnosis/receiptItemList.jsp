<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js" charset="utf-8"></script>  
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-annotation"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
<script>
$(function() {	
	var myChart;	
	var table = document.getElementById('myItemTable');
    var rowList = table.rows;
    
    $(document).ready(function() {
	    // Your other code...
		myChart = new Chart(ctx, {
	          type: "bar",
	          data: data,
	          options: options,
	          plugins: [ChartDataLabels]
	        });
	});
    
    var originalString = document.getElementById('address').value;
    var separatedArray = originalString.split(' ')
    var firstElement = separatedArray.slice(0, 1).join(' ');
    var secondElement = separatedArray.slice(1, 2).join(' ');
    
    // Attach click event to each row
    for (var i = 1; i < rowList.length; i++) {
        // Use a closure to capture the value of i
        (function(index) {
            $("#myItemTable tr").eq(index).on("click", function () {
                console.log(rowList[index].cells[1].textContent);
                $.ajax({
            		url:"${pageContext.request.contextPath}/diagnosis/totalPrice",
            		data: {
            			receipt_item_diagnosisname: rowList[index].cells[1].textContent,
            			sidoAddress: firstElement,
            			gugunAddress: secondElement,
                    },
            		success: function(result) {
            			console.log(result)
            			if(myChart != undefined) {
            				myChart.destroy();
            			}
            			
            			 var ctx = document.getElementById("myChart").getContext("2d");

            		        var data = {
            		          labels: [firstElement, secondElement,"전국"],
            		          datasets: [
            		            {
            		              label: "최저가",
            		              backgroundColor: "rgba(75,192,192,0.4)",
            		              borderColor: "rgba(75,192,192,1)",
            		              borderWidth: 1,
            		              data: [result.sidoMinPrice, result.gugunMinPrice, result.allMinPrice],
        			            },
        			            {
        			              label: "평균",
        			              backgroundColor: "rgba(255, 206, 86, 0.4)",
        			              borderColor: "rgba(255, 206, 86, 1)",
        			              borderWidth: 1,
        			              data: [result.sidoAvgPrice, result.gugunAvgPrice, result.allAvgPrice],
        			            },
        			            {
        			              label: "최대가",
        			              backgroundColor: "rgba(255, 99, 132, 0.4)",
        			              borderColor: "rgba(255,99,132,1)",
        			              borderWidth: 1,
        			              data: [result.sidoMaxPrice, result.gugunMaxPrice, result.allMaxPrice],
            		            },
            		          ],
            		        };

            		        var options = {
            		          maintainAspectRatio :false,
            		          plugins: {
            	                  // Change options for ALL labels of THIS CHART
            	                  datalabels: {
            	                    color: 'black',
            	                    font: {
            	                      weight: 'bold', // You can customize the font style
            	                      size: 20,
            	                    },
            	                    align:'top',
            	                    anchor: 'end',
            	                    display: true, // Display data labels on the bars

            	                  },
            	                  title: {
            		                    display: true, 
            		                    text: rowList[index].cells[1].textContent + ' 평균가',
            		                    color: 'black',
            		                    font: {
            		                    	weight: 'bold',
            		                        size: 40, // Title font size
            		                    },
            		                },
            		                annotation: {
            		                    annotations: {
            		                      line1: {
            		                        type: 'line',
            		                        yMin: rowList[index].cells[3].textContent,
            		                        yMax: rowList[index].cells[3].textContent,
            		                        borderColor: 'rgb(255, 99, 132)',
            		                        borderWidth: 2,
            		                      },
            		                      label1: {
            		                          type: 'label',
            		                          xValue: 0.5,
            		                          yValue: rowList[index].cells[3].textContent,
            		                          content: ["MY " + rowList[index].cells[2].textContent + "원"],
            		                          backgroundColor:'rgb(255, 99, 132)',
            		                          font: {
            		                            size: 18,
            		                            fontWeight: 'bold'
            		                          }
            		                        },
            		                    }
            		                  },
            		                
            	                },
            	                scales: {
            	                    x: {
            	                        display: true,
            	                        grid: {
            	                            display: false,
            	                        },
            	                        ticks: {
            	                        	color: 'black',
            	                        	font: {
            	                        		weight: 'bold',
            	                                size: 20,
            	                            }, // X-axis label font size
            	                        },
            	                    },
            	                    y: {
            	                        display: false,
            	                        grid: {
            	                            display: false,
            	                        },
            	                        min: result.allMinPrice - result.allMinPrice/2,
            	                        max: result.allMaxPrice + result.allMaxPrice/2,
            	                        ticks: {
            	                            beginAtZero: true,  // Start the scale from zero
            	                            stepSize: result.allMinPrice - result.allMinPrice/2,  // Set the step size between ticks

            	                        },
            	                    },
            	                },    
            		          
            		          elements: {
            		            line: {
            		              borderWidth: 0, // Remove the line for all datasets
            		            },
            		          },
            		        };

            		        myChart = new Chart(ctx, {
            		          type: "bar",
            		          data: data,
            		          options: options,
            		          plugins: [ChartDataLabels],
            		        });
            		        console.log(myChart.options.scales.x)
            		}//success
            	})//ajax
            });
        })(i);
    } 
    $('document').ready(function() {
    	   var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
    	   var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
    	   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
    	   var area3 = ["대덕구","동구","서구","유성구","중구"];
    	   var area4 = ["광산구","남구","동구","북구","서구"];
    	   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
    	   var area6 = ["남구","동구","북구","중구","울주군"];
    	   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
    	   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
    	   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
    	   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
    	   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
    	   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
    	   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
    	   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
    	   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
    	   var area16 = ["서귀포시","제주시","남제주군","북제주군"];

    	 

    	 // 시/도 선택 박스 초기화

    	 $("select[name^=sido]").each(function() {
    	  $selsido = $(this);
    	  $.each(eval(area0), function() {
    	   $selsido.append("<option value='"+this+"'>"+this+"</option>");
    	  });
    	  $selsido.next().append("<option value=''>구/군 선택</option>");
    	 });

    	 

    	 // 시/도 선택시 구/군 설정

    	 $("select[name^=sido]").change(function() {
    	  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
    	  var $gugun = $(this).next(); // 선택영역 군구 객체
    	  $("option",$gugun).remove(); // 구군 초기화

    	  if(area == "area0")
    	   $gugun.append("<option value=''>구/군 선택</option>");
    	  else {
    	   $.each(eval(area), function() {
    	    $gugun.append("<option value='"+this+"'>"+this+"</option>");			    
    	   });
    	  }
    	 });	 
    	});


    $('#b1').click(function() {
    	if($('#sido1').val() == "시/도 선택") {
    		$('#sido1').val() = "";
    	}
    	$('#result').html($('#sido1').val() +' ' + $('#gugun1').val());
    	$.ajax({
    		url:"${pageContext.request.contextPath}/diagnosis/totalPrice",
    		data: {
    			receipt_item_diagnosisname : '${diagnosisbag.diagnosis_name}',
    			sidoAddress: $('#sido1').val(),
    			gugunAddress: $('#gugun1').val()
    		},
    		//dataType: "json",
    		success: function(result) {
    			console.log(result)
    			if ($('#sido1').val() == "시/도 선택") {
    				myChart.data.labels[0] = "";
    			} else {
    				myChart.data.labels[0] = $('#sido1').val();
    			}
    			myChart.data.labels[1] = $('#gugun1').val();
    			myChart.data.datasets[0].data[0] = result.sidoMinPrice;
    			myChart.data.datasets[0].data[1] = result.gugunMinPrice;
    			myChart.data.datasets[0].data[2] = result.allMinPrice;
    			myChart.data.datasets[1].data[0] = result.sidoAvgPrice;
    			myChart.data.datasets[1].data[1] = result.gugunAvgPrice;
    			myChart.data.datasets[1].data[2] = result.allAvgPrice;
    			myChart.data.datasets[2].data[0] = result.sidoMaxPrice;
    			myChart.data.datasets[2].data[1] = result.gugunMaxPrice;
    			myChart.data.datasets[2].data[2] = result.allMaxPrice;
    			myChart.update();
    			
    		}//success
    	})//ajax
    })//b1
});


</script>
<input type="hidden" id="address" value="${receipt.receipt_address}"/>
<div class="chart">
	<canvas id="myChart" style="height:30vh; width:50vw"></canvas>  
	<div style="position: absolute; bottom: 66%; left: 77%; transform: translateX(-50%); text-align: center;">
      <p style="background-color: rgba(255, 255, 255, 0.7); border-radius: 5px;">*자료: 농림축산식품부, 영수증 통계</p>
    </div>
</div>
<table id="myItemTable" class="table table-bordered">
	<tr>
        <td>번호</td>
		<td>진료명</td>
		<td>가격</td>
	</tr>
	<c:forEach var="x" items="${itemList}" varStatus="status">
		<tr>
			<td>${status.count}</td>
        	<td>${x.receipt_item_diagnosisname}</td>
        	<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${x.receipt_item_price}" /></td>
        	<td style="display: none;">${x.receipt_item_price}</td>
		</tr>      
	</c:forEach>      
</table>
