<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_vdr.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
SerVdrService serVdrSvc = new SerVdrService();
List<SerVdrVO> list = serVdrSvc.getAll();
pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>所有廠商資料</title>

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
	width: 1200px;
	background-color: white;
	margin-top: 10px;
	margin-bottom: 10px;
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
				<h3>所有廠商資料</h3>
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
		<%@ include file="page1.file"%>
		<c:forEach var="serVdrVO" items="${list}">

			<tr>
				<td>${serVdrVO.vdrID}</td>
				<td><c:if test="${serVdrVO.vdrStatus == 0}">停權</c:if> <c:if
						test="${serVdrVO.vdrStatus == 1}">正常</c:if></td>
				<td>${serVdrVO.vdrName}</td>
				<td>${serVdrVO.vdrTel}</td>
				<td>${serVdrVO.vdrVatno}</td>
				<td>${serVdrVO.vdrCounty}</td>
				<td>${serVdrVO.vdrDist}</td>
				<td>${serVdrVO.vdrAddr}</td>
				<td>${serVdrVO.vdrOpen}</td>
				<td>${serVdrVO.vdrIntro}</td>
				<td><img
					src="<%=request.getContextPath()%>/ser_vdr/DBGifReader4.do?vdr_id=${serVdrVO.vdrID}"
					width=200px></td>
				<td>${serVdrVO.vdrRevCount}</td>
				<td>${serVdrVO.vdrRevScore}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/frontend/ser_vdr/GetOneForUpdateSerVdrServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="vdrID" value="${serVdrVO.vdrID}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/frontend/ser_vdr/DeleteSerVdrServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="vdrID" value="${serVdrVO.vdrID}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>
	<jsp:include page="/frontend/EZ_header.jsp"></jsp:include>

</body>
</html>