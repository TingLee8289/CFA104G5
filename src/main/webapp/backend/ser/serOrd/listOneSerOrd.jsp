<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ezs.ser_ord.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
SerOrdVO serOrdVO = (SerOrdVO) request.getAttribute("serOrdVO");
//GetOneQuoServlet.java(Concroller), 存入req的serquoVO物件
%>

<html>
<head>
<title>資料 - listOneSerQuo.jsp</title>

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
					<a href="<%=request.getContextPath()%>/backend/ser/serOrd/ordBackend.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>訂單ID</th>
			<th>服務訂單狀態</th>
			<th>付款狀態</th>
			<th>廠商ID</th>
			<th>需求單ID</th>
			<th>估價單ID</th>
			<th>會員ID</th>
			<th>廠商ID</th>
			<th>會員統一編號</th>
			<th>廠商統一編號</th>
			<th>業主姓名</th>
			<th>業主電話</th>
			<th>施作日期</th>
			<th>案場縣市</th>
			<th>案場地區</th>
			<th>案場詳細地址</th>
			<th>施工項目</th>
			<th>總金額</th>
			<th>訂金</th>
			<th>訂金付款方式</th>
			<th>訂金付款日期</th>
			<th>尾款</th>
			<th>尾款付款方式</th>
			<th>尾款付款日期</th>
			<th>廠商評價客戶星數</th>
			<th>廠商評價客戶留言</th>
			<th>客戶評價廠商星數</th>
			<th>客戶評價廠商留言</th>
			<th>備註</th>
			<th>修改</th>
			<th>刪除</th>

		</tr>
		<tr>
			<td>${serOrdVO.ordID}</td>
				<td>${serOrdVO.ordStatus}</td>
				<td>${serOrdVO.ordPayStatus}</td>
				<td>${serOrdVO.ordDmdID}</td>
				<td>${serOrdVO.ordQuoID}</td>
				<td>${serOrdVO.ordMemID}</td>
				<td>${serOrdVO.ordVdrID}</td>
				<td>${serOrdVO.ordSerClaID}</td>
				<td>${serOrdVO.ordMemVatno}</td>
				<td>${serOrdVO.ordVdrVatno}</td>
				<td>${serOrdVO.ordClnName}</td>
				<td>${serOrdVO.ordClnTel}</td>
				<td>${serOrdVO.ordWorkDate}</td>
				<td>${serOrdVO.ordCounty}</td>
				<td>${serOrdVO.ordDist}</td>
				<td>${serOrdVO.ordAddr}</td>
				<td>${serOrdVO.ordItem}</td>
				<td>${serOrdVO.ordTotalPrice}</td>
				<td>${serOrdVO.ordPrePay}</td>
				<td>${serOrdVO.ordPayType}</td>
				<td>${serOrdVO.ordPayDate}</td>
				<td>${serOrdVO.ordFpay}</td>
				<td>${serOrdVO.ordFpayType}</td>
				<td>${serOrdVO.ordFpayDate}</td>
				<td>${serOrdVO.ordBuyerScore}</td>
				<td>${serOrdVO.ordBuyerTxt}</td>
				<td>${serOrdVO.ordVdrScore}</td>
				<td>${serOrdVO.ordVdrTxt}</td>
				<td>${serOrdVO.ordNote}</td>
			<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/ser_ord/UpdateOrdServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> 
						<input type="hidden"name="ordID" value="${serOrdVO.ordID}"> 
						<input type="hidden" name="action" value="updateOneOrd">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/ser_ord/DeleteOrdServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> 
						<input type="hidden" name="ordID" value="${serOrdVO.ordID}"> 
						<input type="hidden" name="action" value="delete">
					</FORM>
				</td>
		</tr>
	</table>

</body>
</html>