<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_ord.model.*"%>
<%-- <%session.setAttribute("memID", 2);%> --%>
<%
Integer memID = (Integer) session.getAttribute("memID");
SerOrdService serOrdSvc = new SerOrdService();
List<SerOrdVO> memOrdList = serOrdSvc.findOrdByMemID(memID);

pageContext.setAttribute("memOrdList", memOrdList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>前台會員訂單管理</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<div class="container-fluid m-3 mx-auto">
		<main>
			<div id="data-panel" class="table-responsive ">
				<table
					class="table table-striped table-hover align-middle text-center caption-top">
					<caption>
						<h2>會員檢視訂單資料</h2>
						<h4>
							<a
								href="<%=request.getContextPath()%>/frontend/member/memberCenter/buyerMemberCenter.jsp">回首頁</a>
						</h4>
					</caption>
					<thead class="table-success">
						<tr class="text-nowrap">
							<!--   insert data         -->
							<th>訂單ID</th>
							<th>服務訂單狀態</th>
							<th>付款狀態</th>
							<th>付款方式</th>
							
							<th>廠商ID</th>
							<th>服務類別</th>
							<th>業主姓名</th>
							<th>業主電話</th>
							<th>施作日期</th>
							<th>案場縣市</th>
							<th>案場地區</th>
							<th>案場詳細地址</th>
							<th>施工項目</th>
							<th>總金額</th>
							<th>會員統一編號</th>
							<th>廠商統一編號</th>
							
<!-- 							<th>廠商評價客戶星數</th> -->
<!-- 							<th>廠商評價客戶留言</th> -->
							
							<th>備註</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody id="show-list">

						<%@ include file="page3.file"%>
						<c:forEach var="serOrdVO" items="${memOrdList}"
							begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
							<tr>
								<td>${serOrdVO.ordID}</td>

								<td>
									<c:if test="${serOrdVO.ordStatus == 0}">未成立</c:if> 
									<c:if test="${serOrdVO.ordStatus == 1}">已成立</c:if> 
									<c:if test="${serOrdVO.ordStatus == 2}">完工</c:if>
									<c:if test="${serOrdVO.ordStatus == 3}">結案</c:if>
								</td>
								<td>
									<c:if test="${serOrdVO.ordPayStatus == 0}">未付款</c:if> 
									<c:if test="${serOrdVO.ordPayStatus == 1}">已付款</c:if> 
									<c:if test="${serOrdVO.ordPayStatus == 2}">確認收款</c:if> 
								
								</td>
								<td>
									<c:if test="${serOrdVO.ordPayType == 0}"></c:if> 
									<c:if test="${serOrdVO.ordPayType == 1}">現金付款</c:if> 
									<c:if test="${serOrdVO.ordPayType == 2}">線上刷卡</c:if> 
									<c:if test="${serOrdVO.ordPayType == 3}">ATM轉帳</c:if>
								</td>
								
								<td>${serOrdVO.ordVdrID}</td>
								<td>${serOrdVO.ordSerClaID}</td>
								<td>${serOrdVO.ordClnName}</td>
								<td>${serOrdVO.ordClnTel}</td>
								<td>${serOrdVO.ordWorkDate}</td>
								<td>${serOrdVO.ordCounty}</td>
								<td>${serOrdVO.ordDist}</td>
								<td>${serOrdVO.ordAddr}</td>
								<td>${serOrdVO.ordItem}</td>
								<td>${serOrdVO.ordTotalPrice}</td>
								<td>${serOrdVO.ordMemVatno}</td>
								<td>${serOrdVO.ordVdrVatno}</td>
<%-- 								<td>${serOrdVO.ordBuyerScore}</td> --%>
<%-- 								<td>${serOrdVO.ordBuyerTxt}</td> --%>
								
								<td>${serOrdVO.ordNote}</td>
								<td>
<!-- 									<FORM METHOD="post" -->
<%-- 										ACTION="<%=request.getContextPath()%>/frontend/ser_ord/creditPay.jsp?" --%>
<!-- 										style="margin-bottom: 0px;"> -->
<!-- 										<input type="submit" value="線上付款">  -->
<%-- 										<input type="hidden" name="ordID" value="${serOrdVO.ordID}">  --%>
<!-- 										<input type="hidden" name="action" value="CreditPay"> -->
<!-- 									</FORM> -->
									<a href="<%=request.getContextPath()%>/frontend/ser_ord/creditPay.jsp?ordID=${serOrdVO.ordID}" class="btn btn-outline-success text-nowrap">線上付款</a>
								</td>
								<td>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/ser_ord/FinishOrdServlet.do"
										style="margin-bottom: 0px;">
										<input type="submit" value="驗收完成"> <input type="hidden"
											name="ordID" value="${serOrdVO.ordID}"> <input
											type="hidden" name="action" value="FinishOrd">
									</FORM>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<%@ include file="page4.file"%>
					<!--   insert data         -->
				</table>
			</div>
		</main>
	</div>
</body>
</html>