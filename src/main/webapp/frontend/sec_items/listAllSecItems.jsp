<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.sec_items.model.*"%>

<%
SecItemsService secItemsSvc = new SecItemsService();
List<SecItemsVO> list = secItemsSvc.getAll();
pageContext.setAttribute("list", list);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有二手商品</title>
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
	<a href="<%=request.getContextPath() %>/frontend/sec_items/select_sec_items_page.jsp">回首頁</a>
	<table>
		<tr>
			<th>加入購物車</th>
			<th>數量</th>
			<th>shID</th>
			<th>shCateID</th>
			<th>shSellerID</th>
			<th>shName</th>
			<th>shPrice</th>
			<th>shQTY</th>
			<th>shSize</th>
			<th>shDescription</th>
			<th>shCondition</th>
			<th>shTime</th>
			<th>shGuarantee</th>
			<th>shStatus</th>
			<th>shCounty</th>
			<th>shDist</th>
		</tr>
	</table>

		<c:forEach var="secItemsVO" items="${list}">
			<form name="shoppingForm" action="<%=request.getContextPath()%>/sec_items/ShoppingServlet.do" method="post">
				<table>
					<tr>
						<td><input type="submit" class="button" value="放入購物車"></td>
						<td>數量：<input type="text" name="shQTY" size="3" value=1></td>
						<td>${secItemsVO.shID}</td>
						<td>${secItemsVO.shCateID}</td>
						<td>${secItemsVO.shSellerID}</td>
						<td>${secItemsVO.shName}</td>
						<td>${secItemsVO.shPrice}</td>
						<td>${secItemsVO.shQTY}</td>
						<td>${secItemsVO.shSize}</td>
						<td>${secItemsVO.shDescription}</td>
						<td>${secItemsVO.shCondition}</td>
						<td>${secItemsVO.shTime}</td>
						<td>${secItemsVO.shGuarantee}</td>
						<td>${secItemsVO.shStatus}</td>
						<td>${secItemsVO.shCounty}</td>
						<td>${secItemsVO.shDist}</td>
					</tr>
				</table>
				<input type="hidden" name="shID" value="${secItemsVO.shID}">
				<input type="hidden" name="shName" value="${secItemsVO.shName}">
				<input type="hidden" name="shPrice" value="${secItemsVO.shPrice}">
				<input type="hidden" name="action" value="ADD">
			</form>
		</c:forEach>
	  <jsp:include page="/frontend/sec_items/shoppingCart.jsp" flush="true" />
</body>
</html>