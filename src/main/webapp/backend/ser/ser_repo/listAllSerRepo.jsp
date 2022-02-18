<%@page import="ezs.ser_repo.model.SerRepVO"%>
<%@page import="ezs.ser_repo.model.SerRepoService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_repo.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
SerRepoService serRepoSvc = new SerRepoService();
List<SerRepVO> list = serRepoSvc.getAll();
pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>所有檢舉單</title>

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
	width: 900px;
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
				<h3>所有檢舉資料</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/backend/ser/ser_repo/select_page.jsp">回首頁</a>
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
			<th>檢舉編號</th>
			<th>訂單編號</th>
			<th>會員編號</th>
			<th>檢舉內容</th>
			<th>檢舉時間</th>
			<th>檢舉狀態</th>


		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="serRepVO" items="${list}">

			<tr>
				<td>${serRepVO.rpID}</td>
				<td>${serRepVO.rpOrdID}</td>
				<td>${serRepVO.rpMemID}</td>
				<td>${serRepVO.rpTxt}</td>
				<td>${serRepVO.rpDate}</td>
				<td><c:if test="${serRepVO.rpStatus == 0}">審核未通過</c:if> <c:if
						test="${serRepVO.rpStatus == 1}">審核通過</c:if></td>

				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/ser_repo/GetOneForUpdateSerRepoServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="rpID" value="${serRepVO.rpID}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/ser_repo/DeleteSerRepoServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="rpID" value="${serRepVO.rpID}"> <input
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