<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_cla.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
SerClaService serClaSvc = new SerClaService();
List<SerClaVO> list = serClaSvc.getAll();
pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>所有服務類別</title>

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
				<h3>所有服務類別</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/backend/ser/ser_cla/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<table>
		<tr>
			<th>類別編號</th>
			<th>類別名稱</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="serClaVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">

			<tr>
				<td>${serClaVO.serClaID}</td>
				<td>${serClaVO.serClaName}</td>

				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/backend/ser_cla/GetOneForUpdateSerClaServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="serClaID" value="${serClaVO.serClaID}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/backend/ser_cla/DeleteSerClaServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="serClaID" value="${serClaVO.serClaID}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>
<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>
</body>
</html>