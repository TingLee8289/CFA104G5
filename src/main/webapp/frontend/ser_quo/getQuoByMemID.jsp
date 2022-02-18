<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_quo.model.*"%>
<% session.setAttribute("memID", 2);%>
<%
    Integer memID = (Integer)session.getAttribute("memID");
    SerQuoService serQuoSvc = new SerQuoService();
    List<SerQuoVO> memQuoList = serQuoSvc.findByDmdID(2);
     									//如何動態取值
    pageContext.setAttribute("memQuoList",memQuoList);
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
		 <h3>廠商檢視估價單資料 - listAllSerDmd.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/frontend/ser_quo/serQuoHome.jsp">回首頁</a></h4>
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
		<th>估價單ID</th>
			<th>估價單狀態</th>
			<th>需求單ID</th>
			<th>廠商ID</th>
			<th>估價日期</th>
			<th>有效限期</th>
			<th>估價項目</th>
			<th>估價總價</th>
			<th>修改</th>
			<th>刪除</th>
	</tr>
	
	<c:forEach var="serQuoVO" items="${memQuoList}" >
		
		<tr>
				<td>${serQuoVO.quoID}</td>
				<td>
					<c:if test="${serQuoVO.quoStatus == 0}">未報價</c:if>
					<c:if test="${serQuoVO.quoStatus == 1}">已報價</c:if>
					<c:if test="${serQuoVO.quoStatus == 2}">拒絕報價</c:if>
					<c:if test="${serQuoVO.quoStatus == 3}">接受報價</c:if>
				</td>
				
				<td>${serQuoVO.quoDmdID}</td>
				<td>${serQuoVO.quoVdrID}</td>
				<td>${serQuoVO.quoDate}</td>
				<td>${serQuoVO.quoExpiryDate}</td>
				<td>${serQuoVO.quoItem}</td>
				<td>${serQuoVO.quoTotalPrice}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ser_quo/UpdateQuoServlet.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="quoID"  value="${serQuoVO.quoID}">
			     <input type="hidden" name="action"	value="updateOneQuo"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ser_quo/DeleteOrdServlet.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="quoID"  value="${serQuoVO.quoID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>


</body>
		
				
		
		
		
		<!--  end of main -->	
	</div>
	<!-- Footer ends from here -->
	<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>
	<!-- Footer ends from here -->
</body>
</html>