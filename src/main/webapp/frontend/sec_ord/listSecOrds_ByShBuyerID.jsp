<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.sec_ord.model.*"%>

<jsp:useBean id="listSecOrds_ByShBuyerID" scope="session" type="java.util.Set<SecOrdVO>" /> <!-- 於EL此行可省略 -->
<jsp:useBean id="MemberSvc" scope="page" class="ezs.member.model.MemberService" />


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
				<h3>買家會員訂單 - listSecOrds_ByShBuyerID.jsp</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/frontend/sec_ord/listAllMember.jsp"><img
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
			<th>訂單ID</th>
			<th>買家ID</th>
			<th>賣家ID</th>
			<th>收件地址郵遞區號</th>
			<th>收件地址縣市</th>
			<th>收件地址鄉鎮區</th>
			<th>收件地址路街弄等</th>
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
			<th>查看訂單明細</th>
			<th>完成訂單</th>
			<th>申請退款</th>
		</tr>

		<c:forEach var="secOrdVO" items="${listSecOrds_ByShBuyerID}">
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
					<FORM METHOD="post"	ACTION="<%=request.getContextPath()%>/sec_ord/SecOrdServlet.do" style="margin-bottom: 0px;">
						<input type="submit" value="查看訂單明細"> 
						<input type="hidden" name="shOrdID" value="${secOrdVO.shOrdID}"> 
						<input type="hidden" name="action" value="getSecOrdDetails">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"	ACTION="<%=request.getContextPath()%>/sec_ord/SecOrdServlet.do" style="margin-bottom: 0px;">
						<input type="submit" value="完成訂單"> 
						<input type="hidden" name="secOrdID" value="${secOrdVO.shOrdID}"> 
						<input type="hidden" name="action" value="completeOrder">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"	ACTION="<%=request.getContextPath()%>/sec_ord/SecOrdServlet.do" style="margin-bottom: 0px;">
						<input type="submit" value="申請退款"> 
						<input type="hidden" name="secOrdID" value="${secOrdVO.shOrdID}"> 
						<input type="hidden" name="action" value="refundOrder">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	
		<%if (request.getAttribute("listSecOrdDetails_ByShOrdID")!=null){%>
		       <jsp:include page="listSecOrdDetails_ByShOrdID.jsp" />
		<%} %>

</body>
</html>