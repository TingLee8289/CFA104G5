<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%--JSTL標籤宣告 --%>

<html>
<head>
<title>Easy Space 刊登服務</title>

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
			<td><h3>Easy Space 刊登服務</h3></td>
		</tr>
	</table>

	<p>This is the Home page for Easy Space 刊登服務</p>

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
		<li><a href='listAllSerAd.jsp'>List</a> all SerAd <br> <br></li>

		<jsp:useBean id="serAdSvc" scope="page"
			class="ezs.ser_ad.model.SerAdService" />
		<li>
			<FORM METHOD="post" ACTION="GetSerAdServlet.do">

				<b>選擇廠商編號:</b> <select size="1" name="adVdrID">
					<c:forEach var="serAdVO" items="${serAdSvc.all}">
						<option value="${serAdVO.adVdrID}">${serAdVO.adVdrID}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
		</li>

		<br>
		<li><b>選擇服務類別編號:</b> <select size="1" name="adSerClaID">
				<c:forEach var="serAdVO" items="${serAdSvc.all}">
					<option value="${serAdVO.adSerClaID}">${serAdVO.adSerClaID}
				</c:forEach>
		</select> <input type="hidden" name="action" value="getOne_For_Display">
			<input type="submit" value="送出">

			</FORM></li>





	</ul>


	<h3>刊登服務管理</h3>

	<ul>
		<li><a href='addSerAd.jsp'>Add</a> a new SerAd.</li>
	</ul>
	<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>
</body>
</html>