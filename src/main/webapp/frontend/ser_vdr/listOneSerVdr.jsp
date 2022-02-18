<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_vdr.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
SerVdrVO serVdrVO = (SerVdrVO) request.getAttribute("serVdrVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>廠商資料</title>

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
	width: 1100px;
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
				<h3>廠商資料</h3>
				<h4>
					<a href="select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>廠商編號</th>
			<th>狀態</th>
			<th>姓名</th>
			<th>電話</th>
			<th>統一編號</th>
			<th>縣市</th>
			<th>地區</th>
			<th>詳細地址</th>
			<th>營業時間</th>
			<th>廠商簡介</th>
			<th>廠商圖片</th>
			<th>廠商評價總人數</th>
			<th>廠商評價總星數</th>
		</tr>
		<tr>
			<td><%=serVdrVO.getVdrID()%></td>
			<td><c:if test="${serVdrVO.vdrStatus == 0}">停權</c:if> <c:if
					test="${serVdrVO.vdrStatus == 1}">正常</c:if></td>
			<td><%=serVdrVO.getVdrName()%></td>
			<td><%=serVdrVO.getVdrTel()%></td>
			<td><%=serVdrVO.getVdrVatno()%></td>
			<td><%=serVdrVO.getVdrCounty()%></td>
			<td><%=serVdrVO.getVdrDist()%></td>
			<td><%=serVdrVO.getVdrAddr()%></td>
			<td><%=serVdrVO.getVdrOpen()%></td>
			<td><%=serVdrVO.getVdrIntro()%></td>
			<td><img
				src="<%=request.getContextPath()%>/ser_vdr/DBGifReader4.do?vdr_id=${serVdrVO.vdrID}"
				width=200px></td>
			<td><%=serVdrVO.getVdrRevCount()%></td>
			<td><%=serVdrVO.getVdrRevScore()%></td>
		</tr>
	</table>
<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>
</body>
</html>