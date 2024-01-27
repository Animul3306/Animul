<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script> 
	console.log(${insertResult})
	if(${insertResult} == 1) {
		alert("영수증이 등록되었습니다.")
		$.ajax({
			url:"${pageContext.request.contextPath}/diagnosis/receiptMyList",
			data: {
				receipt_myid: "${loggedInUser}",  //나중에 로그인 세션으로 바꾸기
			},
			success: function(list) {
				$('#resultDiv').html(list)
			}//success
		})//ajax
	
		$.ajax({
		    url: "${pageContext.request.contextPath}/diagnosis/receiptItemList",
		    type: "post",
		    data: {
		    	receipt_item_receiptid: '${uid}',
		    	receipt_address: '${address}'
		    },
		    success: function (list) {
		    	$('#resultDiv2').append("<span style='font-weight: bold; font-size: 1.5em;'>병원명: " + '${hospital}' + "</span>");
		    	$('#resultDiv2').append(list)
		        console.log(list);
		    }//success
		})//ajax  
		} else if(${insertResult} == 2){
		alert("영수증이 중복되었습니다.")
		} else {
		alert("진료항목이 없습니다.")
		}
</script>





