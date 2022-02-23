<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.sec_ord.model.*"%>
<%@ page import="ezs.sec_ord_details.model.*"%>

<jsp:useBean id="list" scope="request"
	type="java.util.Set<SecOrdDetailsVO>" />
<!-- 於EL此行可省略 -->
<jsp:useBean id="secOrdSvc" scope="page"
	class="ezs.sec_ord.model.SecOrdService" />


<html>
<head>
<title>訂單明細 - listSecOrdDetails_BySecOrd.jsp</title>

<style>
table#table-2 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-2 h4 {
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
	padding: 10px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>

	<h4>此頁練習採用 EL 的寫法取值:</h4>
	<table id="table-2">
		<tr>
			<td>
				<h3>訂單明細 - listSecOrdDetails_ByShOrdID.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/frontend/sec_ord/secOrdHomeSeller.jsp"><img
						src="images/sec/sh_pic/" width="100" height="32" border="0">回首頁</a>
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
			<th>訂單編號</th>
			<th>商品編號</th>
			<th>商品名稱</th>
			<th>訂單金額</th>
			<th>商品數量</th>

		</tr>


		<c:forEach var="secOrdDetailsVO"
			items="${list}">
			<tr>
				<td>${secOrdDetailsVO.shOrdID}</td>
				<td>${secOrdDetailsVO.shID}</td>
				<td>${secOrdDetailsVO.shName}</td>
				<td>${secOrdDetailsVO.shPrice}</td>
				<td>${secOrdDetailsVO.shQty}</td>
			</tr>
		</c:forEach>





	</table>

	<br>本網頁的路徑:
	<br>
	<b> <font color=blue>request.getServletPath():</font> <%=request.getServletPath()%><br>
		<font color=blue>request.getRequestURI(): </font> <%=request.getRequestURI()%>
	</b>

</body>
</html>