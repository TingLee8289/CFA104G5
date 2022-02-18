<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%--JSTL標籤宣告 --%>

<html>
<head>
<title>Easy Space 檢舉</title>

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
	<jsp:include page="/frontend/EZ_header.jsp"></jsp:include>


	<table id="table-1">
		<tr>
			<td><h3>Easy Space 檢舉</h3></td>
		</tr>
	</table>

	<p>This is the Home page for Easy Space 檢舉</p>

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
		<li><a
			href='<%=request.getContextPath()%>/backend/ser/ser_repo/listAllSerRepo.jsp'>List</a>
			all Vender <br> <br></li>


		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/ser_repo/GetSerRepoServlet.do">
				<b>輸入檢舉編號 (如1):</b> <input type="text" name="rpID"> <input
					type="hidden" name="action" value="getOne_For_Display"> <input
					type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="serRepoSvc" scope="page"
			class="ezs.ser_repo.model.SerRepoService" />

		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/ser_repo/GetSerRepoServlet.do">
				<b>選擇檢舉編號:</b> <select size="1" name="rpID">
					<c:forEach var="serRepVO" items="${serRepoSvc.all}">
						<option value="${serRepVO.rpID}">${serRepVO.rpID}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>



	</ul>


	<h3>員工管理</h3>

	<ul>
		<li><a href='addSerRepo.jsp'>Add</a> a new SerRepo.</li>
	</ul>

<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>
</body>
</html>