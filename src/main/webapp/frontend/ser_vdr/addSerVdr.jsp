<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_vdr.model.*"%>

<%
SerVdrVO servdrVO = (SerVdrVO) request.getAttribute("servdrVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>廠商資料新增</title>

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
	width: 450px;
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
				<h3>廠商資料新增</h3>
			</td>
			<td>
				<h4>
					<a href="select_page.jsp">回首頁</a>
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

	<FORM METHOD="post" enctype="multipart/form-data"
		ACTION="InsertSerVdrServlet.do" name="form1">
		<table>
			<tr>
				<td>廠商編號:</td>
				<td><input type="TEXT" name="vdrID" size="45"
					value="<%=(servdrVO == null) ? "4" : servdrVO.getVdrID()%>" /></td>
			</tr>
			<tr>
				<td>廠商狀態:</td>

				<td><input type="TEXT" name="vdrStatus" size="45" value="1" /></td>

			</tr>



			<tr>
				<td>廠商姓名:</td>
				<td><input type="TEXT" name="vdrName" size="45"
					value="<%=(servdrVO == null) ? "蔡英文" : servdrVO.getVdrName()%>" /></td>
			</tr>


			<tr>
				<td>廠商電話:</td>
				<td><input type="TEXT" name="vdrTel" size="45"
					value="<%=(servdrVO == null) ? "0944556889" : servdrVO.getVdrTel()%>" /></td>
			</tr>

			<tr>
				<td>廠商統一編號:</td>
				<td><input type="TEXT" name="vdrVatno" size="45"
					value="<%=(servdrVO == null) ? "12345678" : servdrVO.getVdrVatno()%>" /></td>
			</tr>

			<tr>
				<td>縣市:</td>
				<td><input type="TEXT" name="vdrCounty" size="45"
					value="<%=(servdrVO == null) ? "台北市" : servdrVO.getVdrCounty()%>" /></td>
			</tr>

			<tr>
				<td>地區:</td>
				<td><input type="TEXT" name="vdrDist" size="45"
					value="<%=(servdrVO == null) ? "大安區" : servdrVO.getVdrDist()%>" /></td>
			</tr>


			<tr>
				<td>詳細地址:</td>
				<td><input type="TEXT" name="vdrAddr" size="45"
					value="<%=(servdrVO == null) ? "羅斯福路一段一號" : servdrVO.getVdrAddr()%>" /></td>
			</tr>


			<tr>
				<td>營業時間:</td>
				<td><input type="TEXT" name="vdrOpen" size="45"
					value="<%=(servdrVO == null) ? "8:00-18:00" : servdrVO.getVdrOpen()%>" /></td>
			</tr>


			<tr>
				<td>廠商簡介:</td>
				<td><input type="TEXT" name="vdrIntro" size="45"
					value="<%=(servdrVO == null) ? "哈囉!" : servdrVO.getVdrIntro()%>" /></td>
			</tr>

			<tr>
				<td>廠商圖片:</td>
				<td><input type="file" name="vdrPic" 
					value="<%=(servdrVO == null) ? null : servdrVO.getVdrPic()%>" /></td>
			</tr>

			<tr>
				<td>廠商評價人數:</td>
				<td><input type="TEXT" name="vdrRevCount" size="45"
					value="<%=(servdrVO == null) ? "0" : servdrVO.getVdrRevCount()%>" /></td>
			</tr>

			<tr>
				<td>廠商評價星數:</td>
				<td><input type="TEXT" name="vdrRevScore" size="45"
					value="<%=(servdrVO == null) ? "0" : servdrVO.getVdrRevScore()%>" /></td>
			</tr>






		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
	<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>

	
</body>




</html>