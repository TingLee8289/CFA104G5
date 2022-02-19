<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.sec_ord_details.model.*"%>

<jsp:useBean id="secOrdSvc" scope="page"
	class="ezs.sec_ord.model.SecOrdService" />

<html>
<head>
<title>所有訂單 - listAllSecOrd.jsp</title>

<style>
table#table-1 {
	background-color: orange;
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
<body bgcolor='white'>

	<h4>此頁練習採用 EL 的寫法取值:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>所有訂單 - listAllSecOrd.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/frontend/sec_ord/secOrdHomeSeller.jsp"><img
						src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
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
			<th>商品訂單編號</th>
			<th>買家編號</th>
			<th>賣家編號</th>
			<th>收件地址郵遞區號</th>
			<th>收件縣市</th>
			<th>收件鄉鎮區</th>
			<th>收件地址</th>
			<th>付款方式</th>
			<th>訂單狀態</th>
			<th>商品價格</th>
			<th>訂單日期</th>
			<th>買家評價賣家星數</th>
			<th>買家評價賣家內容</th>
			<th>賣家評價買家星數</th>
			<th>賣家評價買家內容</th>
			<th>撥款日期</th>
			<th>買家備註</th>
			<th>修改</th>
			<th>取消訂單<font color=red>(關聯測試與交易-小心)</font></th>
			<th>查詢訂單明細</th>
		</tr>

		<c:forEach var="secOrdVO" items="${secOrdSvc.all}">
			<tr>
				<td>${secOrdVO.shOrdID}</td>
				<td>${secOrdVO.shBuyerID}</td>
				<td>${secOrdVO.shSellerID}</td>
				<td>${secOrdVO.shPostcode}</td>
				<td>${secOrdVO.shCounty}</td>
				<td>${secOrdVO.shDist}</td>
				<td>${secOrdVO.shRoad}</td>
				<td>${secOrdVO.shPayment}</td>

				<td><c:if test="${secOrdVO.shOrdStatus == 8}">取消訂單</c:if> <c:if
						test="${secOrdVO.shOrdStatus == 2}">待出貨</c:if> <c:if
						test="${secOrdVO.shOrdStatus == 3}">已出貨</c:if> <c:if
						test="${secOrdVO.shOrdStatus == 6}">退款審核中</c:if> <c:if
						test="${secOrdVO.shOrdStatus == 7}">訂單完成</c:if></td>


				<td>${secOrdVO.shPrice}</td>
				<td>${secOrdVO.shDate}</td>
				<td>${secOrdVO.shBuyerScore}</td>
				<td>${secOrdVO.shBuyerTXT}</td>
				<td>${secOrdVO.shSellerScore}</td>
				<td>${secOrdVO.shSellerTXT}</td>
				<td>${secOrdVO.shAPPDate}</td>
				<td>${secOrdVO.shNotes}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/sec_ord/UpdateSecOrdBySellerServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="shOrdID" value="${secOrdVO.shOrdID}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/sec_ord/GetSecOrdDetailsBySellerServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="取消訂單"> <input type="hidden"
							name="shOrdID" value="${secOrdVO.shOrdID}"> <input
							type="hidden" name="action" value="delete_secord">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/sec_ord/GetSecOrdDetailsBySellerServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="送出查詢"> <input type="hidden"
							name="shOrdID" value="${secOrdVO.shOrdID}"> <input
							type="hidden" name="action" value="listSecOrdDetails_BySecOrd_B">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>

	<%
	if (request.getAttribute("listSecOrdDetails_BySecOrd") != null) {
	%>
	<jsp:include page="listSecOrdDetails_BySecOrd.jsp" />
	<%
	}
	%>

</body>
</html>