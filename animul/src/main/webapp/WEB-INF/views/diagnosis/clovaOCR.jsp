<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="col-md-6">
        <canvas id="canvas"></canvas>
    </div>
    <script type="text/javascript">
        const img = document.createElement('img'); // 방법1
        const img2 = new Image();
        img2.src = '#';
        img2.onload = function() {
            const imgWidth = img2.width;
            const imgHeight = img2.height;

            var canvas = document.getElementById("canvas");
            var ctx = canvas.getContext('2d');

            // Set canvas width and height
            canvas.width = imgWidth;
            canvas.height = imgHeight;

            // Draw the image on the canvas
            ctx.drawImage(img2, 0, 0);

            //61 - 16 and  35 - 21
            ctx.strokeStyle = 'lime' 
            ctx.strokeRect(16, 21, 45, 14);
            ctx.strokeRect(64, 25, 7, 8);
            ctx.closePath();
            ctx.stroke();
        };
	</script>
    <div class="col-md-6">
      <c:forEach var="x" items="#">
		<div class="mb-3">
        	<label for="text1" class="form-label">Text 1:</label>
        	<input type="text" class="form-control" id="text1" placeholder="Enter text 1">
      	</div>
	  </c:forEach>   
	</div>	
	
	