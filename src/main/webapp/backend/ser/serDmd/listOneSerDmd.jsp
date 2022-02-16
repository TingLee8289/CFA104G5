<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ezs.ser_dmd.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
SerDmdVO serDmdVO = (SerDmdVO) request.getAttribute("serDmdVO"); //SerDmdServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>需求單資料 - listOneSerDmd.jsp</title>

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
				<h3>需求單資料 - listOneSerDmd.jsp</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/backend/ser/serDmd/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>需求單ID</th>
			<th>需求單狀態</th>
			<th>會員ID</th>
			<th>服務類別ID</th>
			<th>需求人姓名</th>
			<th>需求人電話</th>
			<th>需求人信箱</th>
			<th>案場縣市</th>
			<th>案場地區</th>
			<th>案場詳細地址</th>
			<th>空間類別</th>
			<th>坪數</th>
			<th>預算</th>
			<th>需求簡介</th>
			<th>照片</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
		<tr>
			<td>${serDmdVO.dmdID}</td>
			<td>${serDmdVO.dmdStatus}</td>
			<td>${serDmdVO.dmdMemID}</td>
			<td>${serDmdVO.dmdSerClaID}</td>
			<td>${serDmdVO.dmdName}</td>
			<td>${serDmdVO.dmdTel}</td>
			<td>${serDmdVO.dmdMail}</td>
			<td>${serDmdVO.dmdCounty}</td>
			<td>${serDmdVO.dmdRegion}</td>
			<td>${serDmdVO.dmdAddress}</td>
			<td>${serDmdVO.dmdSpaceClass}</td>
			<td>${serDmdVO.dmdSquare}</td>
			<td>${serDmdVO.dmdBudget}</td>
			<td>${serDmdVO.dmdIntro}</td>
			<td>${serDmdVO.dmdPic}</td>
		</tr>
	</table>

</body>
</html>