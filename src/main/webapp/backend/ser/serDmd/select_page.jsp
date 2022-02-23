<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>EASY SPACE</title>

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
<body>


	<h2>後台需求單管理</h2>

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
		<li><a href='<%=request.getContextPath()%>/backend/ser/serDmd/listAllSerDmd.jsp'>檢視需求單</a>
			</li>
			<br>

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

	

	<ul>
		<li><a href="<%=request.getContextPath()%>/backend/ser/serDmd/addSerDmd.jsp">新增需求單</a> </li>
	</ul>

</body>
</html>