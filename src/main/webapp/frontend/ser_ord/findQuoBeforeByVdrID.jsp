<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_quo.model.*"%>
<%-- <%session.setAttribute("memID", 5);%> --%>
<%
Integer memID = (Integer) session.getAttribute("memID");
SerQuoService serQuoSvc = new SerQuoService();
List<SerQuoVO> vdrQuoList = serQuoSvc.findByVdrID(memID);

pageContext.setAttribute("vdrQuoList", vdrQuoList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>廠商估價單管理</title>
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
						<h2>所有估價單資料</h2>
					</caption>
					<thead class="table-success">
						<tr class="text-nowrap">
							<!--   insert data         -->
							<th>估價單ID</th>
							<th>估價單狀態</th>
							<th>需求單ID</th>
							<th>估價日期</th>
							<th>有效限期</th>
							<th>估價項目</th>
							<th>估價總價</th>
							<th>修改</th>
						</tr>
					</thead>
					<tbody id="show-list">

						<%-- 						<%@ include file="page1.file"%> --%>
						<c:forEach var="serQuoVO" items="${vdrQuoList}">
							<%-- 						<c:forEach var="serDmdVO" items="${list}" begin="<%=pageIndex%>"end="<%=pageIndex+rowsPerPage-1%>"> --%>
							<c:choose>
					 			<c:when test="${serQuoVO.quoStatus==3}">
									<tr>
								<td>${serQuoVO.quoID}</td>
								<td>
								
								<c:if test="${serQuoVO.quoStatus == 0}">未報價</c:if> 
								<c:if test="${serQuoVO.quoStatus == 1}">已報價</c:if> 
								<c:if test="${serQuoVO.quoStatus == 2}">拒絕報價</c:if> 
								<c:if test="${serQuoVO.quoStatus == 3}">接受報價</c:if>
								</td>
								<td>${serQuoVO.quoDmdID}</td>
								<td>${serQuoVO.quoDate}</td>
								<td>${serQuoVO.quoExpiryDate}</td>
								<td>${serQuoVO.quoItem}</td>
								<td>${serQuoVO.quoTotalPrice}</td>
								<td>
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/ser_ord/addSerOrd.jsp" style="margin-bottom: 0px;">
										<input type="submit" value="新增訂單"> 
										<input type="hidden" name="quoID" value="${serQuoVO.quoID}"> 
									</FORM>
								</td>	
							</tr>
								</c:when>
							</c:choose>
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