<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_cla.model.*"%>

<%
SerClaVO serClaVO = (SerClaVO) request.getAttribute("serClaVO");
;
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>服務類別新增</title>

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
				<h3>新增服務類別</h3>
			</td>
			<td>
				<h4>
					<a
						href="<%=request.getContextPath()%>/backend/ser/ser_cla/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post"
		ACTION="<%=request.getContextPath()%>/ser_cla/InsertSerClaServlet.do"
		name="form1">
		<table>





			<tr>
				<td>類別名稱:</td>
				<td><input type="TEXT" name="serClaName" size="45"
					value="<%=(serClaVO == null) ? "" : serClaVO.getSerClaName()%>" /></td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
	<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>

</body>





</html>