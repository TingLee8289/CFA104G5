<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_dmd.model.*"%>
<% session.setAttribute("mdmID", 3);%>
<%
    Integer memID = (Integer)session.getAttribute("memID");
    SerDmdService serDmdSvc = new SerDmdService();
    List<SerDmdVO> list = serDmdSvc.findByMemID(memID);
     									//如何動態取值
    pageContext.setAttribute("list",list);
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
		 <h3>所有需求單資料 - listAllSerDmd.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/frontend/ser_dmd/serDmdHome.jsp">回首頁</a></h4>
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
		<th>修改</th>
		<th>刪除</th>
	</tr>
	
	<c:forEach var="serDmdVO" items="${list}" >
		
		<tr>
			<td>${serDmdVO.dmdID}</td>
			<td>${serDmdVO.dmdStatus}</td>
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
			<td><img src="<%=request.getContextPath()%>/ser_dmd/DBGifReader4?dmd_id=${serDmdVO.dmdID}" width = 200px></td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ser_dmd/SerDmdServlet.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="dmdID"  value="${serDmdVO.dmdID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ser_dmd/SerDmdServlet.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="dmdID"  value="${serDmdVO.dmdID}">
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