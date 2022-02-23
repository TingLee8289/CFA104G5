<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.sec_items.model.*"%>
<%@ page import="ezs.sec_pics.model.*"%>
<%@ page import="java.util.*"%>
<!-- list要import java.util.* -->
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   for each會用到 --%>
<!-- list強轉型 要小心 -->


<%-- 此頁暫練習採用 Script 的寫法取值 --%>
<%-- 有錯誤待處理 --%>

<%
List<SecItemsVO> secItemsVO = (List<SecItemsVO>) request.getAttribute("secItemsVO");
SecItemsService secItemsSvc = new SecItemsService();

// List<SecItemsVO> secItemslist = secItemsSvc.getShStatusAll(shStatus);
// pageContext.setAttribute("secItemslist", secItemslist);

//EmpServlet.java(Concroller), 存入req的empVO物件
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
	width: 2000px;
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


	<h4>查詢單一商品種類</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>單一商品 - listOneSecItemsCate.jsp</h3>
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
			<th>商品分類編號</th>
			<th>狀態</th>
			<th>商品編號</th>
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
		<!-- forEach var  是資料存入的名稱不要和items一樣   secItemsVO對應的值   這邊是從剛剛那邊傳過來的物件    -->


		<c:forEach var="vo" items="${secItemsVO}">

			<tr>
				<td>${vo.shCateID}</td>
				<td>${vo.shStatus}</td>
				<td>${vo.shID}</td>
				<td>${vo.shSellerID}</td>
				<td>${vo.shName}</td>
				<td>${vo.shPrice}</td>
				<td>${vo.shQTY}</td>
				<td>${vo.shSize}</td>
				<td>${vo.shDescription}</td>
				<td>${vo.shCondition}</td>
				<td>${vo.shTime}</td>
				<td>${vo.shGuarantee}</td>
				<td>${vo.shCounty}</td>
				<td>${vo.shDist}</td>


				<td><img
					src="<%=request.getContextPath()%>/sec_items/SecItemsPicReaderServlet.do?sh_id=
							 ${vo.shID}"
					width=200px></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>