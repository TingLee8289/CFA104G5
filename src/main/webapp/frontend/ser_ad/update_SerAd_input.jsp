<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_ad.model.*"%>

<%
SerAdVO serAdVO = (SerAdVO) request.getAttribute("serAdVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>刊登服務修改</title>

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
<jsp:include page="/frontend/EZ_header.jsp"></jsp:include>

	<table id="table-1">
		<tr>
			<td>
				<h3>刊登服務修改</h3>
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
		ACTION="<%=request.getContextPath()%>/frontend/ser_ad/UpdateSerAdServlet.do"
		name="form1">
		<table>
			<tr>
				<td>廠商編號:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="adVdrID" size="50"
					value="<%=serAdVO.getAdVdrID()%>" /></td>

			</tr>
			<tr>
				<td>刊登狀態:</td>
				<td><input type="TEXT" name="adStatus" size="50"
					value="<%=serAdVO.getAdStatus()%>" /></td>
			</tr>
			<tr>
				<td>服務類別編號:</td>
				<td><input type="TEXT" name="adSerClaID" size="50"
					value="<%=serAdVO.getAdSerClaID()%>" /></td>
			</tr>

			<tr>
				<td>服務地區:</td>
				<td><input type="TEXT" name="adDist" size="50"
					value="<%=serAdVO.getAdDist()%>" /></td>
			</tr>


			<tr>
				<td>服務內容:</td>
				<td><input type="TEXT" name="adTxt" size="50"
					value="<%=serAdVO.getAdTxt()%>" /></td>
			</tr>

			<tr>
				<td>服務案例圖片:</td>
				<td><input type="file" vid="upfiles" name="adPic"
					accept="image/gif, image/jpeg, image/png" multiple="multiple" />
					<div id="previews">
						<p>圖片預覽</p>
					</div> <img
					src="<%=request.getContextPath()%>/ser_ad/DBGifReader4.do?ad_vdr_id=${serAdVO.adVdrID}&ad_ser_cla_id=${serAdVO.adSerClaID}"
					width=200px></td>
			</tr>





		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="adVdrID" value="<%=serAdVO.getAdVdrID()%>">
		<input type="hidden" name="adSerClaID"
			value="<%=serAdVO.getAdSerClaID()%>"> <input type="submit"
			value="送出修改">
	</FORM>
</body>
<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>



</html>