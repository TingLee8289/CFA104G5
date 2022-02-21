<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.* , java.math.*"%>
<%@ page import="ezs.sec_items.model.* , ezs.sec_ord_details.model.*"%>
<html>
<head>
<title>EASY SPACE</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/ShoppingCart.css">
</head>
<body>
	<font size="+3">網路商城 - 結帳：（Checkout.jsp）</font>
	<hr>
	<p>
	<table id="table-1" style="margin: auto;">
		<tr>
			<th width="200">商品ID</th>
			<th width="100">商品名稱</th>
			<th width="100">商品價格</th>
			<th width="100">商品數量</th>
			<th width="120"><h3>總價</h3></th>
		</tr>
	</table>
	<table style="margin: auto;">

		<%
		@SuppressWarnings("unchecked")
		Vector<SecItem> buylist = (Vector<SecItem>) session.getAttribute("shoppingcart");
		String amount = (String) request.getAttribute("amount");
		%>
		<%
		for (int i = 0; i < buylist.size(); i++) {
			SecItem order = buylist.get(i);
			Integer shID = order.getShID();
			String shName = order.getShName();
			BigDecimal shPrice = order.getShPrice();
			Integer shQTY = order.getShQTY();
		%>
		<tr>
			<td width="200"><%=shID%></td>
			<td width="100"><%=shName%></td>
			<td width="100"><%=shPrice%></td>
			<td width="100"><%=shQTY%></td>
			<td width="120"></td>
		</tr>
		<%
		}
		%>


		<tr>
			<td colspan="5" style="text-align: right;"><font size="+2">總金額：<h4>$<%=amount%></h4></font></td>
		</tr>
	</table>

	<form method="post" action="<%=request.getContextPath()%>/sec_ord/SecOrdServlet.do">
		<jsp:include page="/frontend/sec_items/shippingForm.jsp"></jsp:include>
	</form>
</body>
</html>