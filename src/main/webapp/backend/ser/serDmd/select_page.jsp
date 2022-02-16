<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Ezs Service Demand: Home</title>

<style>
table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
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

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td><h3>Ezs Service Demand: Home</h3>
				<h4>( MVC )</h4></td>
		</tr>
	</table>

	<p>This is the Home page for Ezs Service Demand: Home</p>

	<h3>資料查詢:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
		<li><a href='<%=request.getContextPath()%>/backend/ser/serDmd/listAllSerDmd.jsp'>List</a>
			all Dmd. <br> <br></li>

		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/ser_dmd/SerDmdServlet.do">
				<b>輸入需求單編號 (如1):</b> <input type="text" name="serDmdID"> <input
					type="hidden" name="action" value="getOne_For_Display"> <input
					type="submit" value="送出">
			</FORM>
		</li>
		<jsp:useBean id="serDmdDao" scope="page"
			class="ezs.ser_dmd.model.SerDmdDAO" />
		<li>
			<FORM METHOD="post" 
				ACTION="<%=request.getContextPath()%>/ser_dmd/SerDmdServlet.do">
				<b>選擇需求單編號:</b> <select size="1" name="serDmdID">
					<c:forEach var="serDmdVO" items="${serDmdDao.all}">
						<option value="${serDmdVO.dmdID}">${serDmdVO.dmdID}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/ser_dmd/SerDmdServlet.do">
				<b>選擇需求人姓名:</b> <select size="1" name="serDmdID">
					<c:forEach var="serDmdVO" items="${serDmdDao.all}">
						<option value="${serDmdVO.dmdID}">${serDmdVO.dmdName}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
	</ul>

	<h3>需求單管理</h3>

	<ul>
		<li><a href="<%=request.getContextPath()%>/backend/ser/serDmd/addSerDmd.jsp">Add</a> a new Ser Demand.</li>
	</ul>

</body>
</html>