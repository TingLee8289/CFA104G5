<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_ad.model.*"%>

<%
SerAdVO serAdVO = (SerAdVO) request.getAttribute("serAdVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>新增刊登服務</title>

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
				<h3>刊登服務新增</h3>
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
		ACTION="InsertSerAdServlet.do" name="form1">
		<table>

			<jsp:useBean id="servdrSvc" scope="page"
				class="ezs.ser_vdr.model.SerVdrService" />
			<tr>
				<td>廠商編號:<font color=red><b>*</b></font></td>
				<td><select size="1" name="adVdrID">
						<c:forEach var="serVdrVO" items="${servdrSvc.all}">
							<option value="${serVdrVO.vdrID}"${(serAdVO.adVdrID==serVdrVO.vdrID)? 'selected':'' }>${serVdrVO.vdrID}
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>刊登狀態:</td>

				<td><input type="TEXT" name="adStatus" size="45"
					value="<%=(serAdVO == null) ? "1" : serAdVO.getAdStatus()%>" /></td>

			</tr>


			<jsp:useBean id="serClaSvc" scope="page"
				class="ezs.ser_cla.model.SerClaService" />
			<tr>
				<td>服務類別編號:<font color=red><b>*</b></font></td>
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
				<td><input type="TEXT" name="adTxt" size="45"
					value="<%=(serAdVO == null) ? "翻修工程" : serAdVO.getAdTxt()%>" /></td>
			</tr>

			<tr>
				<td>服務案例圖片:</td>
				<td><input type="file" name="adPic"
					value="<%=(serAdVO == null) ? "" : serAdVO.getAdPic()%>" /></td>
			</tr>








		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
</body>
<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>



</html>