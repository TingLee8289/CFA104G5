<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_ord.model.*"%>
<% session.setAttribute("memID", 3);%>
<%
    Integer memID = (Integer)session.getAttribute("memID");
    SerOrdService serOrdSvc = new SerOrdService();
    List<SerOrdVO> vdrOrdList = serOrdSvc.findOrdByVdrID(memID);
     									
    pageContext.setAttribute("vdrOrdList",vdrOrdList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EASY SPACE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<link rel="stylesheet"
	href=" https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css ">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-popRpmFF9JQgExhfw5tZT4I9/CI5e2QcuUZPOVXb1m7qUmeR2b50u+YFEYe1wgzy"
	crossorigin="anonymous"></script>
<!-- Plugins -->
</head>
<body>
	<!-- Header starts from here -->
	<jsp:include page="/frontend/EZ_header.jsp"></jsp:include>
	<!-- Header ends from here -->
	<div class="container-fluid">
		<!--  main start -->
		
		<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>廠商檢視訂單資料 - listAllSerOrd.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/frontend/ser_ord/serOrdHome.jsp">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

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
	<%@ include file="page1.file"%>
		<c:forEach var="serOrdVO" items="${vdrOrdList}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">
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
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ser_ord/UpdateOrdServlet.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="ordID"  value="${serOrdVO.ordID}">
			     <input type="hidden" name="action"	value="updateOneOrd"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ser_ord/DeleteOrdServlet.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="ordID"  value="${serOrdVO.ordID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file"%>

</body>
		
				
		
		
		
		<!--  end of main -->	
	</div>
	<!-- Footer ends from here -->
	<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>
	<!-- Footer ends from here -->
</body>
</html>