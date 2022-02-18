<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_ad.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
SerAdService serAdSvc = new SerAdService();
List<SerAdVO> list = serAdSvc.getAll();
pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>所有刊登服務</title>

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
	width: 800px;
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
				<h3>所有刊登服務</h3>
				<h4>
					<a href="select_page.jsp">回首頁</a>
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
			<th>廠商編號</th>
			<th>刊登狀態</th>
			<th>服務類別編號</th>
			<th>服務地區</th>
			<th>服務內容</th>
			<th>服務案例圖片</th>

		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="serAdVO" items="${list}">

			<tr>
				<td>${serAdVO.adVdrID}</td>
				<td><c:if test="${serAdVO.adStatus == 0}">下架</c:if> <c:if
						test="${serAdVO.adStatus == 1}">上架</c:if></td>
				<td>${serAdVO.adSerClaID}</td>
				<td>${serAdVO.adDist}</td>
				<td>${serAdVO.adTxt}</td>
				<td><img
					src="<%=request.getContextPath()%>/ser_ad/DBGifReader4.do?ad_vdr_id=${serAdVO.adVdrID}&ad_ser_cla_id=${serAdVO.adSerClaID}"
					width=200px></td>
				<%--  ad_cla_id=${serAdVO.adClaID}--%>

				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/frontend/ser_ad/GetOneForUpdateSerAdServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="adVdrID" value="${serAdVO.adVdrID}"> <input
							type="hidden" name="adSerClaID" value="${serAdVO.adSerClaID}">
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/frontend/ser_ad/DeleteSerAdServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="adVdrID" value="${serAdVO.adVdrID}"> <input
							type="hidden" name="adSerClaID" value="${serAdVO.adSerClaID}">
						<input type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>
	<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>

</body>
</html>