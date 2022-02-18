<%@page import="ezs.ser_repo.model.SerRepVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_repo.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
SerRepVO serRepVO = (SerRepVO) request.getAttribute("serRepVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>檢舉資料</title>

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
				<h3>檢舉資料</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/backend/ser/ser_repo/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>檢舉編號</th>
			<th>訂單編號</th>
			<th>會員編號</th>
			<th>檢舉內容</th>
			<th>檢舉時間</th>
			<th>檢舉狀態</th>
		</tr>
		<tr>
			<td><%=serRepVO.getRpID()%></td>
			<td><%=serRepVO.getRpOrdID()%></td>
			<td><%=serRepVO.getRpMemID()%></td>
			<td><%=serRepVO.getRpTxt()%></td>
			<td><%=serRepVO.getRpDate()%></td>
			<td><c:if test="${serRepVO.rpStatus == 0}">審核未通過</c:if> <c:if
					test="${serRepVO.rpStatus == 1}">審核通過</c:if></td>

		</tr>
	</table>

<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>
</body>
</html>