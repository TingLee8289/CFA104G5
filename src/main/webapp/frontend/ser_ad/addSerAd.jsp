<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_ad.model.*"%>
<%-- <%session.setAttribute("memID", 5);%> --%>
<%
Integer memID = (Integer) session.getAttribute("memID");
SerAdVO serAdVO = (SerAdVO) request.getAttribute("serAdVO");
%>

<html>
<head>
 <script src="<%=request.getContextPath()%>/frontend/js/jquery-1.11.3.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>EASY SPACE</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 550px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body>

	

	<table id="table-1">
		<tr>
			<td>
				<h3>刊登服務新增</h3>
			</td>
			<td>
				<h4>
					<a href="serAdHome.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" enctype="multipart/form-data" ACTION="InsertSerAdServlet.do" name="form1">
		<table>

			<jsp:useBean id="servdrSvc" scope="page" class="ezs.ser_vdr.model.SerVdrService" />
			<tr>
				<td>廠商編號:<font color=red><b>*</b></font></td>
				<td>
				<input type="TEXT" name="adVdrID" size="45" value="${memID} " />
<!-- 				<select size="1" name="adVdrID"> -->
<%-- 						<c:forEach var="serVdrVO" items="${servdrSvc.all}"> --%>
<%-- 							<option value="${serVdrVO.vdrID}"${(serAdVO.adVdrID==serVdrVO.vdrID)? 'selected':'' }>${serVdrVO.vdrID} --%>
<%-- 						</c:forEach> --%>
<!-- 				</select> -->
				</td>
			</tr>
			<tr>
				<%-- <td>刊登狀態:</td>--%>

				<td><input type="hidden" name="adStatus" size="45" value="<%=(serAdVO == null) ? "1" : serAdVO.getAdStatus()%>" /></td>

			</tr>


			<jsp:useBean id="serClaSvc" scope="page" class="ezs.ser_cla.model.SerClaService" />
			<tr>
				<td>服務類別名稱:<font color=red><b>*</b></font></td>
				<td><select size="1" name="adSerClaID">
						<c:forEach var="serClaVO" items="${serClaSvc.all}">
							<option value="${serClaVO.serClaID}" ${(serAdVO.adSerClaID==serClaVO.serClaID)? 'selected':'' }>${serClaVO.serClaName}
						</c:forEach>
				</select></td>
			</tr>


			<tr>
				<td>服務地區:</td>
				<td><input type="TEXT" name="adDist" size="45"
					value="<%=(serAdVO == null) ? "中南部" : serAdVO.getAdDist()%>" /></td>
			</tr>

			<tr>
				<td>服務內容:</td>
				<td>
					<textarea name="adTxt"rows="4" cols="50" ><%= (serAdVO==null)? "翻修工程級衛浴整修" : serAdVO.getAdTxt() %></textarea>
				</td>
			</tr>

			<tr>
				<td>服務案例圖片:</td>
				<td><input type="file" id="upfiles" name="adPic" accept="image/gif, image/jpeg, image/png" multiple="multiple" />
				<div id="previews">
						<p>圖片預覽</p>
					</div>
			
			</tr>








		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
	
	
</body>



<script>
	// 	// // change這個event有只代表改變，並不代表有檔案。
	// 	// 	如果要FileReader去讀檔案，必須給他一個檔案Object。
	// 	// 	它拿到檔案Object後會驅動onload事件
	// 	// 	藉由 FileReader 物件，Web 應用程式能以非同步（asynchronously）方式讀取儲存在用戶端的檔案（或原始資料暫存）內容
	// 	// 裡面的input 就是我們丟進去的this，也就是<input type="file">，
	// 	// 當<input type="file">被DOM變成Object的時候，如果他有選擇到檔案，
	// 	// 會被放在input.files裡面，而且是一個Array(因為input如果寫成 <input type="file" multiple> 的時候是可以複選的)
	$("#upfiles").change(function() {
		$("#previews").html(""); // 清除預覽
		readURL(this);
	});
	function readURL(input) {
		if (input.files && input.files.length >= 0) {
			for (var i = 0; i < input.files.length; i++) {
				var reader = new FileReader();
				reader.onload = function(e) {
					var img = $("<img width='300' height='200'>").attr('src',
							e.target.result);
					$("#previews").append(img);
				}
				reader.readAsDataURL(input.files[i]);
			}
		} else {
			var noPictures = $("<p>目前沒有圖片</p>");
			$("#previews").append(noPictures);
		}
	}
</script>


</html>