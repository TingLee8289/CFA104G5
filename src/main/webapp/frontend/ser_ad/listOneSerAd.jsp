<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_ad.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
SerAdVO serAdVO = (SerAdVO) request.getAttribute("serAdVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>刊登服務資料</title>

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
	width: 650px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body>
	<jsp:include page="/frontend/EZ_header.jsp"></jsp:include>

	<table id="table-1">
		<tr>
			<td>
				<h3>刊登服務資料</h3>
				<h4>
					<a href="select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>廠商編號</th>
			<th>刊登狀態</th>
			<th>服務類別編號</th>
			<th>服務地區</th>
			<th>服務內容</th>
			<th>服務案例圖片</th>

		</tr>
		<tr>
			<td><%=serAdVO.getAdVdrID()%></td>
			<td><c:if test="${serAdVO.adStatus == 0}">下架</c:if> <c:if
					test="${serAdVO.adStatus == 1}">上架</c:if></td>
			<td><%=serAdVO.getAdSerClaID()%></td>
			<td><%=serAdVO.getAdDist()%></td>
			<td><%=serAdVO.getAdTxt()%></td>
			<td><img
				src="<%=request.getContextPath()%>/ser_ad/DBGifReader4.do?ad_vdr_id=${serAdVO.adVdrID}&ad_ser_cla_id=${serAdVO.adSerClaID}"
				width=200px></td>
			<%-- ad_cla_id=${serAdVO.adClaID} --%>
		</tr>
	</table>
	<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>

</body>
</html>