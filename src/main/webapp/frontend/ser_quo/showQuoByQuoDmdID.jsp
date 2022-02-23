<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_quo.model.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EASY　SPACE</title>
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
						<h2>會員檢視估價單資料</h2>
						
						<h4>
							<a
								href="<%=request.getContextPath()%>/frontend/ser_dmd/getByDmdMemID.jsp">回需求單</a>
						</h4>
					</caption>
					<thead class="table-success">
						<tr class="text-nowrap">
							<!--   insert data         -->
							<th>估價單ID</th>
							<th>估價單狀態</th>
<!-- 							<th>需求單ID</th> -->
							<th>廠商ID</th>
							<th>估價日期</th>
							<th>有效限期</th>
							<th>估價項目</th>
							<th>估價總價</th>
							<th>接受報價</th>
							<th>拒絕報價</th>
						</tr>
					</thead>
					<tbody id="show-list">

						<%-- 						<%@ include file="page1.file"%> --%>
						<c:forEach var="serQuoVO" items="${serQuoVOList}">
							<%-- 						<c:forEach var="serDmdVO" items="${list}" begin="<%=pageIndex%>"end="<%=pageIndex+rowsPerPage-1%>"> --%>

							<tr>
								<td>${serQuoVO.quoID}</td>
								<td><c:if test="${serQuoVO.quoStatus == 0}">未報價</c:if> <c:if
										test="${serQuoVO.quoStatus == 1}">已報價</c:if> <c:if
										test="${serQuoVO.quoStatus == 2}">拒絕報價</c:if> <c:if
										test="${serQuoVO.quoStatus == 3}">接受報價</c:if></td>
<%-- 								<td>${serQuoVO.quoDmdID}</td> --%>
								<td>${serQuoVO.quoVdrID}</td>
								<td>${serQuoVO.quoDate}</td>
								<td>${serQuoVO.quoExpiryDate}</td>
								<td>${serQuoVO.quoItem}</td>
								<td>${serQuoVO.quoTotalPrice}</td>
								<td>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/ser_quo/AcceptQuoServlet.do"
										style="margin-bottom: 0px;">
										<input type="submit" value="接受報價"> <input
											type="hidden" name="quoID" value="${serQuoVO.quoID}">
										<input type="hidden" name="action" value="acceptQuo">
									</FORM>
								</td>
								<td>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/ser_quo/RejectQuoServlet.do"
										style="margin-bottom: 0px;">
										<input type="submit" value="拒絕報價"> <input
											type="hidden" name="quoID" value="${serQuoVO.quoID}">
										<input type="hidden" name="action" value="rejectQuo">
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