<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ezs.ser_quo.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
SerQuoVO serQuoVO = (SerQuoVO) request.getAttribute("serQuoVO");
//GetOneQuoServlet.java(Concroller), 存入req的serquoVO物件
%>

<html>
<head>
<title>EASY SPACE</title>

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
<body bgcolor='white'>

	<h4>此頁暫練習採用 EL 的寫法取值:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>估價單資料 - listOneSerQuo.jsp</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/backend/ser/serQuo/quoBackend.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>估價單ID</th>
			<th>估價單狀態</th>
			<th>需求單ID</th>
			<th>廠商ID</th>
			<th>估價日期</th>
			<th>有效限期</th>
			<th>估價項目</th>
			<th>估價總價</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
		<tr>
			<td>${serQuoVO.quoID}</td>
				<td>${serQuoVO.quoStatus}</td>
				<td>${serQuoVO.quoDmdID}</td>
				<td>${serQuoVO.quoVdrID}</td>
				<td>${serQuoVO.quoDate}</td>
				<td>${serQuoVO.quoExpiryDate}</td>
				<td>${serQuoVO.quoItem}</td>
				<td>${serQuoVO.quoTotalPrice}</td>
			<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/ser_quo/UpdateQuoServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> 
						<input type="hidden"name="quoID" value="${serQuoVO.quoID}"> 
						<input type="hidden" name="action" value="updateOneQuo">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/ser_quo/DeleteQuoServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> 
						<input type="hidden" name="quoID" value="${serQuoVO.quoID}"> 
						<input type="hidden" name="action" value="delete">
					</FORM>
				</td>
		</tr>
	</table>

</body>
</html>