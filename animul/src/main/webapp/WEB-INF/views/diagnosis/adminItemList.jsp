<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<div class="col-md-4" style="padding:10px;">
        <canvas id="canvas"></canvas>
    </div>
    <script type="text/javascript">
        var img = document.createElement('img');
        var img2 = new Image();
        img2.src = '${pageContext.request.contextPath}/resources/upload2/${receipt.receipt_id}.png';
        img2.onload = function() {
            var imgWidth = img2.width;
            var imgHeight = img2.height;

            var canvas = document.getElementById("canvas");
            var ctx = canvas.getContext('2d');

            // Set canvas width and height
            canvas.width = imgWidth;
            canvas.height = imgHeight;

            // Draw the image on the canvas
            ctx.drawImage(img2, 0, 0);
            //61 - 16 and  35 - 21
            
            ctx.closePath();
            ctx.stroke();
        };
        
        function receiptDelete(){
        	if(confirm("정말로 삭제하시겠습니까?")){
        		$.ajax({
                    url: "${pageContext.request.contextPath}/diagnosis/receiptDel",
                    type: "post",
                    data: {
                    	receipt_id: '${receipt.receipt_id}'
                    },
                    success: function (x) {
                    	if(x == 1) {
                    		alert("삭제 성공했습니다.")
                    		location.reload();
                    	} else {
                    		alert("삭제 실패했습니다.")
                    	}
                    }//success
                })//ajax    		
        	}else{
        	}
        }
        
        function tableCreate(){
			var html = '';			
			var name = $("#inName").val();
			var price = $("#inPrice").val();
			var remove = $("remove").val();
						
			
			$.ajax({
                url: "${pageContext.request.contextPath}/diagnosis/receiptItemInsert",
                type: "post",
                data: {
                	receipt_item_receiptid: '${receipt.receipt_id}',
                	receipt_item_diagnosisname: name,
                	receipt_item_price: price
                },
                success: function (x) {
                	if(x == 1){
                		alert('항목 추가 성공')
                		html += '<tr>';
            			html += '<td>'+name+'</td>';
            			html += '<td>'+price+'</td>';
            			html += '<td><button onclick="tableDelete(this)" id="remove">삭제</button></td>';
            			html += '</tr>';
            						
            			$("#dynamicTable").append(html);
            						
            			$("#inName").val('');
            			$("#inPrice").val('');
                	} else {
                		alert('항목명과 가격을 제대로 기입해주세요.')
                	}
                }//success
            })//ajax    
		}

		function tableDelete(obj){
			var tr = $(obj).parent().parent();
			var firstTd = tr.find('td:first-child').text()
			tr.remove();
			$.ajax({
                url: "${pageContext.request.contextPath}/diagnosis/receiptItemDelete",
                type: "post",
                data: {
                	receipt_item_id: firstTd,
                },
                success: function (x) {
                }//success
            })//ajax    

		}
	</script>
	
    <div class="col-md-6">
    <form action="receiptUp">
				<table border="1"  class="table table-hover">
					<tr  class="table-warning">
						<td width="200">병원명</td>
						<td width="300"><input class="form-control" name="receipt_hospitalname" value="${receipt.receipt_hospitalname}"></td>
					</tr>
					<tr  class="table-warning">
						<td width="200">주소</td>
						<td width="300"><input class="form-control" name="receipt_address" value="${receipt.receipt_address}"></td>
					</tr>
					<tr  class="table-warning">
						<td width="200">결제일</td>
						<td width="300">
							<c:set var="y" value="${receipt.receipt_date}" />
								<fmt:formatDate var="sysYear" value="${y}" pattern="yyyy/MM/dd HH:mm:ss" />
							<input name="receipt_date" class="form-control" value="<c:out value="${sysYear}" />">
						</td>
					</tr>
					<tr  class="table-warning">
						<td width="200">결제가격</td>
						<td width="300">
							<input name="receipt_price" class="form-control" value="${receipt.receipt_price}">
							<input type="hidden" name="receipt_id" class="form-control" value="${receipt.receipt_id}">
						</td>
					</tr>
					<tr  class="table-warning">
						<td width="200" colspan="2">
							<button type="submit" class="form-control" class="btn btn-info">수정하기</button>
						</td>
					</tr>
				</table>
		</form>
		<table border="1" class="table table-hover" id="dynamicTable">

			<colgroup>
				<col width="200px">
				<col width="300px">
				<col width="100px">
			</colgroup>

			<thead>
				<tr>
					<th>항목명</th>
					<th>가격</th>
					<th>추가</th>
				</tr>
			</thead>
			
			<tbody id="dynamicTbody">
				<c:forEach var="x" items="${itemList}" varStatus="status">
					<tr>
						<td style="display: none;">${x.receipt_item_id}</td>
		   				<td>${x.receipt_item_diagnosisname}</td>
						<td>${x.receipt_item_price}</td>
						<td><button onclick="tableDelete(this)">삭제</button></td>
					</tr>
				</c:forEach> 
			</tbody>

			<tfoot>
				<tr>
					<td><input type="text" placeholder="항목명" id="inName"></td>
					<td><input type="text" placeholder="가격" id="inPrice"></td>
					<td><button onclick="tableCreate()">추가</button></td>
				</tr>
			</tfoot>
		</table>
		<div style="text-align: center;">
			<button class="btn btn-danger" onclick="receiptDelete()">영수증 삭제</button>
		</div>
	</div>	