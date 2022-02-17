<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.sec_ord.model.*"%>

<jsp:useBean id="listSecOrdsByShSellerID" scope="request"
	type="java.util.Set<SecOrdVO>" />
<!-- 於EL此行可省略 -->
<jsp:useBean id="MemberSvc" scope="page"
	class="ezs.member.model.MemberService" />


<html>
<head>
<title>EASY SPACE</title>

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
	<table id="table-2">
		<tr>
			<td>
				<h3>賣家會員訂單 - listSecOrdsByShSellerID.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/frontend/sec_ord/listSecOrdsByShSeller.jsp"><img
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
			<th>訂單編號</th>
			<th>買家編號</th>
			<th>賣家編號</th>
			<th>收件地址郵遞區號</th>
			<th>收件縣市</th>
			<th>收件鄉鎮區</th>
			<th>收件地址</th>
			<th>付款方式</th>
			<th>訂單狀態</th>
			<th>訂單金額</th>
			<th>訂單日期</th>
			<th>賣家評價買家星數</th>
			<th>賣家評價買家內容</th>
			<th>買家評價賣家星數</th>
			<th>買家評價賣家內容</th>
			<th>撥款日期</th>
			<th>買家備註</th>
			<th>修改訂單</th>


		</tr>

		<c:forEach var="secOrdVO" items="${listSecOrdsByShSellerID}">
			<tr>
				<td>${secOrdVO.shOrdID}</td>
				<td>${secOrdVO.shBuyerID}</td>
				<td>${secOrdVO.shSellerID}</td>
				<td>${secOrdVO.shPostcode}</td>
				<td>${secOrdVO.shCounty}</td>
				<td>${secOrdVO.shDist}</td>
				<td>${secOrdVO.shRoad}</td>
				<td>${secOrdVO.shPayment}</td>
				<td>${secOrdVO.shOrdStatus}</td>
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
						ACTION="<%=request.getContextPath()%>sec_ord/GetSecOrdBySellerServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改訂單"> 
						<input type="hidden" name="shOrdID" value="${secOrdVO.shOrdID}"> 
						<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
<!-- 				<td> -->
<!-- 					<FORM METHOD="post" -->
<%-- 						ACTION="<%=request.getContextPath()%>/emp/emp.do" --%>
<!-- 						style="margin-bottom: 0px;"> -->
<!-- 						<input type="submit" value="刪除"> <input type="hidden" -->
<%-- 							name="empno" value="${empVO.empno}"> <input type="hidden" --%>
<!-- 							name="action" value="delete"> -->
<!-- 					</FORM> -->
<!-- 				</td> -->
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