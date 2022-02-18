<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_vdr.model.*"%>

<%
SerVdrVO serVdrVO = (SerVdrVO) request.getAttribute("serVdrVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>廠商資料修改</title>

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
	width: 600px;
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
	<jsp:include page="/frontend/EZ_header.jsp"></jsp:include>

	<table id="table-1">
		<tr>
			<td>
				<h3>廠商資料修改</h3>
				<h4>
					<a href="select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料修改:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" enctype="multipart/form-data"
		ACTION="<%=request.getContextPath()%>/frontend/ser_vdr/UpdateSerVdrServlet.do"
		name="form1">
		<table>
			<tr>
				<td>廠商編號:<font color=red><b>*</b></font></td>

				<td><input type="TEXT" name="vdrID" size="50"
					value="<%=serVdrVO.getVdrID()%>" /></td>
			</tr>
			<tr>
				<td>廠商狀態:</td>
				<td><input type="TEXT" name="vdrStatus" size="50"
					value="<%=serVdrVO.getVdrStatus()%>" /></td>
			</tr>
			<tr>
				<td>廠商姓名:</td>
				<td><input type="TEXT" name="vdrName" size="50"
					value="<%=serVdrVO.getVdrName()%>" /></td>
			</tr>

			<tr>
				<td>廠商電話:</td>
				<td><input type="TEXT" name="vdrTel" size="50"
					value="<%=serVdrVO.getVdrTel()%>" /></td>
			</tr>


			<tr>
				<td>廠商統一編號:</td>
				<td><input type="TEXT" name="vdrVatno" size="50"
					value="<%=serVdrVO.getVdrVatno()%>" /></td>
			</tr>

			<tr>
				<td>縣市:</td>
				<td><input type="TEXT" name="vdrCounty" size="50"
					value="<%=serVdrVO.getVdrCounty()%>" /></td>
			</tr>

			<tr>
				<td>地區:</td>
				<td><input type="TEXT" name="vdrDist" size="50"
					value="<%=serVdrVO.getVdrDist()%>" /></td>
			</tr>

			<tr>
				<td>詳細地址:</td>
				<td><input type="TEXT" name="vdrAddr" size="50"
					value="<%=serVdrVO.getVdrAddr()%>" /></td>
			</tr>

			<tr>
				<td>營業時間:</td>
				<td><input type="TEXT" name="vdrOpen" size="50"
					value="<%=serVdrVO.getVdrOpen()%>" /></td>
			</tr>

			<tr>
				<td>廠商簡介:</td>
				<td><input type="TEXT" name="vdrIntro" size="50"
					value="<%=serVdrVO.getVdrIntro()%>" /></td>
			</tr>

			<tr>
				<td>廠商圖片:</td>
				<td><input type="file" id="upfiles" name="vdrPic"
					accept="image/gif, image/jpeg, image/png" multiple="multiple" />
					<div id="previews">
						<p>圖片預覽</p>
					</div> <img
					src="<%=request.getContextPath()%>/ser_vdr/DBGifReader4.do?vdr_id=${serVdrVO.vdrID}"
					width=200px></td>
			</tr>

			<tr>
				<td>廠商評價人數:</td>
				<td><input type="TEXT" name="vdrRevCount" size="50"
					value="<%=serVdrVO.getVdrRevCount()%>" /></td>
			</tr>

			<tr>
				<td>廠商評價星數:</td>
				<td><input type="TEXT" name="vdrRevScore" size="50"
					value="<%=serVdrVO.getVdrRevScore()%>" /></td>
			</tr>




		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="vdrID" value="<%=serVdrVO.getVdrID()%>">
		<input type="submit" value="送出修改">
	</FORM>
	<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>

	<script>
		$("#upfiles").change(function() {
			$("#errorMessage").html(""); // 清除錯誤訊息
			$("#previews").html(""); // 清除預覽
			readURL(this);
		});

		function readURL(input) {
			if (input.files && input.files.length >= 0) {
				for (var i = 0; i < input.files.length; i++) {
					var reader = new FileReader();
					reader.onload = function(e) {
						var img = $("<img width='143' height='100'>").attr(
								'src', e.target.result);
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


</body>




</html>