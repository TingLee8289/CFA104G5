<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.sec_ord.model.*"%>


<%
SecOrdVO secOrdVO = (SecOrdVO) request.getAttribute("secOrdVO");

//SecOrdServlet.java (Concroller) 存入req的SecOrdVO物件 (包括幫忙取出的SecOrdVO, 也包括輸入資料錯誤時的SecOrdVO物件)
%>

<%-- <jsp:useBean id="secPicsSvc" scope="page" class="ezs.sec_items.model.SecPicsService" /> --%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>訂單資料修改 - update_secord_input.jsp</title>

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
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>訂單資料修改 - update_secord_input.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/frontend/sec_ord/secOrdHomeSeller.jsp"><img
						src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料修改:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" enctype="multipart/form-data"
		ACTION="<%=request.getContextPath()%>/sec_ord/UpdateSecOrdBySellerServlet.do"
		name="form1">
		<table>
			<tr>
				<td>訂單編號:<font color=red><b>*</b></font></td>
				<td><%=secOrdVO.getShOrdID()%></td>
				<td><input name="shOrdID" /></td>

			</tr>

			<tr>
				<!-- 		<td>買家編號:</td> -->
				<td><input type="hidden" name="shSellerID"
					value="<%=secOrdVO.getShBuyerID()%>" /></td>
			</tr>

			<tr>
				<!-- 		<td>賣家編號:</td> -->
				<td><input type="hidden" name="shSellerID"
					value="<%=secOrdVO.getShSellerID()%>" /></td>
			</tr>
			<tr>
						<td>收件地址郵遞區號:</td>
				<td><%=secOrdVO.getShSellerID()%></td>
			</tr>
			<tr>
						<td>收件地址縣市:</td>
				<td><%=secOrdVO.getShSellerID()%></td>
			</tr>
			<tr>
						<td>收件地址鄉鎮區:</td>
				<td><%=secOrdVO.getShSellerID()%></td>
			</tr>
			<tr>
						<td>收件地址路街弄:</td>
				<td><%=secOrdVO.getShSellerID()%></td>
			</tr>
			<tr>
						<td>付款方式:</td>
				<td><%=secOrdVO.getShSellerID()%></td>
			</tr>
			<tr>
						<td>訂單狀態:</td>
				<td><input type="TEXT" name="shSellerID"
					value="<%=secOrdVO.getShSellerID()%>" /></td>
			</tr>
			<tr>
						<td>訂單金額:</td>
				<td><%=secOrdVO.getShSellerID()%></td>
			</tr>
			<tr>
						<td>撥款日期:</td>
				<td><%=secOrdVO.getShSellerID()%></td>
			</tr>
			<tr>
						<td>買家備註:</td>
				<td><%=secOrdVO.getShSellerID()%></td>
			</tr>
			

		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="shOrdID" value="<%=secOrdVO.getShOrdID()%>">
		<input type="submit" value="送出修改">
	</FORM>
</body>

</html>
