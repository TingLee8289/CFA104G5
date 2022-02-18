<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ezs.sec_items.model.*"%>
<%@ page import="ezs.sec_pics.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>
<%-- 有錯誤待處理 --%>

<%

SecItemsVO secItemsVO = (SecItemsVO) request.getAttribute("secItemsVO");
SecItemsService secItemsSvc = new SecItemsService();

// List<SecItemsVO> secItemslist = secItemsSvc.getShStatusAll(shStatus);
// pageContext.setAttribute("secItemslist", secItemslist);


//EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>查詢單一商品</title>

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
	width: 1000px;
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


	<h4>查詢單一商品狀態</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>單一商品 - listOneSecItemsStatus.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/frontend/sec_items/select_page.jsp"><img
						src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>狀態</th>
			<th>商品編號</th>
			<th>商品分類編號</th>
			<th>賣家編號</th>
			<th>商品名稱</th>
			<th>商品價格</th>
			<th>數量</th>
			<th>尺寸</th>
			<th>摘要</th>
			<th>新舊程度</th>
			<th>已使用時間</th>
			<th>保固期間</th>
			<th>所在縣市</th>
			<th>所在鄉鎮區</th>
			<th>商品圖片</th>

		</tr>

		<c:forEach var="secItemsVO" items="${secItemsVO}" >
			
		<tr>
			<td><%=secItemsVO.getShStatus()%></td>
			<td><%=secItemsVO.getShID()%></td>
			<td><%=secItemsVO.getShCateID()%></td>
			<td><%=secItemsVO.getShSellerID()%></td>
			<td><%=secItemsVO.getShName()%></td>
			<td><%=secItemsVO.getShPrice()%></td>
			<td><%=secItemsVO.getShQTY()%></td>
			<td><%=secItemsVO.getShSize()%></td>
			<td><%=secItemsVO.getShDescription()%></td>
			<td><%=secItemsVO.getShCondition()%></td>
			<td><%=secItemsVO.getShTime()%></td>
			<td><%=secItemsVO.getShGuarantee()%></td>
			<td><%=secItemsVO.getShCounty()%></td>
			<td><%=secItemsVO.getShDist()%></td>
			<td><img
				src="<%=request.getContextPath()%>/sec_items/SecItemsPicReaderServlet.do?sh_id=
							 ${secItemsVO.shID}"
				width=200px></td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>