<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_dmd.model.*"%>
<%@ page import="ezs.ser_quo.model.*"%>

<%
session.setAttribute("memID", 2);
%>
<%
Integer memID = (Integer) session.getAttribute("memID");
SerDmdService serDmdSvc = new SerDmdService();
List<SerDmdVO> serDmdList = serDmdSvc.findByMemID(memID);
//如何動態取值
pageContext.setAttribute("serDmdList", serDmdList);
%>
<%
    List<SerDmdVO> OneMemDmdList = serDmdSvc.findByMemID(memID);
     									//如何動態取值
    pageContext.setAttribute("OneMemDmdList",OneMemDmdList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="<%=request.getContextPath()%>/frontend/js/jquery-1.11.3.min.js"></script>
<title>會員檢視需求單</title>
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
						<h2>所有需求單資料</h2>
						<h4>
							<a
								href="<%=request.getContextPath()%>/frontend/member/memberCenter/memberCenterBuyerDmd.jsp">回首頁</a>
						</h4>
					</caption>
					<thead class="table-success">
						<tr class="text-nowrap">
							<!--   insert data         -->
							<th>需求單ID</th>
							<th>需求單狀態</th>
							<th>會員ID</th>
							<th>服務類別ID</th>
							<th>需求人姓名</th>
							<th>需求人電話</th>
							<th>需求人信箱</th>
							<th>案場縣市</th>
							<th>案場地區</th>
							<th>案場詳細地址</th>
							<th>空間類別</th>
							<th>坪數</th>
							<th>預算</th>
							<th>需求簡介</th>
							<th>照片</th>
							<th>檢視估價單</th>
							<th>修改</th>
							<th>刪除</th>
						</tr>
					</thead>
					<tbody id="show-list">

						<%-- 						<%@ include file="page1.file"%> --%>
						<c:forEach var="serDmdVO" items="${serDmdList}">
							<%-- 						<c:forEach var="serDmdVO" items="${list}" begin="<%=pageIndex%>"end="<%=pageIndex+rowsPerPage-1%>"> --%>

							<tr>
								<td>${serDmdVO.dmdID}</td>
								<td><c:if test="${serDmdVO.dmdStatus == 0}">未投遞</c:if> <c:if
										test="${serDmdVO.dmdStatus == 1}">投遞中</c:if> <c:if
										test="${serDmdVO.dmdStatus == 2}">訂單成立</c:if></td>
								<td>${serDmdVO.dmdMemID}</td>
								<td>${serDmdVO.dmdSerClaID}</td>
								<td>${serDmdVO.dmdName}</td>
								<td>${serDmdVO.dmdTel}</td>
								<td>${serDmdVO.dmdMail}</td>
								<td>${serDmdVO.dmdCounty}</td>
								<td>${serDmdVO.dmdRegion}</td>
								<td>${serDmdVO.dmdAddress}</td>
								<td>${serDmdVO.dmdSpaceClass}</td>
								<td>${serDmdVO.dmdSquare}</td>
								<td>${serDmdVO.dmdBudget}</td>
								<td>${serDmdVO.dmdIntro}</td>
								<td><img src="<%=request.getContextPath()%>/ser_dmd/DBGifReader4?dmdID=${serDmdVO.dmdID}" width=200px></td>
								
									
										
								<td>
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ser_quo/FindByQuoDmdIDServlet.do" name="form1">
									
									
									<input type="hidden" name="quoDmdID" value="${serDmdVO.dmdID}">
										
									<input type="hidden" name="action" value="findByDmdID"> 
									<input type="submit" value="檢視報價">
									</FORM>
								</td>
								
								
								<td>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/ser_dmd/UpdateSerDmdServlet.do"
										style="margin-bottom: 0px;">
										<input type="submit" value="修改"> 
										<input type="hidden" name="dmdID" value="${serDmdVO.dmdID}"> 
										<input type="hidden" name="action" value="UpdateDmd">
									</FORM>
								</td>
								<td>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/ser_dmd/SerDmdServlet.do"
										style="margin-bottom: 0px;">
										<input type="submit" value="刪除"> <input type="hidden"
											name="dmdID" value="${serDmdVO.dmdID}"> <input
											type="hidden" name="action" value="delete">
									</FORM>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<%-- 					<%@ include file="page2.file"%> --%>
					<!--   insert data         -->
				</table>
			</div>
		</main>
	</div>
</body>
</html>