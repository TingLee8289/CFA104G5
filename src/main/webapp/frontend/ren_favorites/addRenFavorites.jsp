<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ren_favorites.model.*"%>

<%
	RenFavoritesVO renFavoritesVO = (RenFavoritesVO) request.getAttribute("renFavoritesVO");
%>
<%= renFavoritesVO==null %>--${renFavoritesVO.favMemId}--
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>新增收藏房源</title>

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
	width: 450px;
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
<body>
<jsp:include page="/frontend/EZ_header.jsp"></jsp:include>

<table id="table-1">
	<tr><td>
		 <h3>新增收藏房源</h3></td><td>
		 <h4><a href="<%=request.getContextPath()%>/frontend/ren_favorites/select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<h3>新增收藏房源:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenFavoritesServlet.do" name="form1">
<table>
	<tr>
		<td>房源編號:</td>
		<td><input type="TEXT" name="favLisId"
			 value="<%= (renFavoritesVO==null)? "" : renFavoritesVO.getFavLisId()%>" /></td>
	</tr>
	<tr>
		<td>會員編號:</td>
		<td><input type="TEXT" name="favMemId"
			 value="<%= (renFavoritesVO==null)? "" : renFavoritesVO.getFavMemId()%>" /></td>
	</tr>
	

<!-- 	<tr> -->
<!-- 		<td>加入收藏時間:</td> -->
<!-- 		<td><input type="TEXT" name="favAddTime" size="45" -->
<%-- 			 value="<%= (renFavoritesVO==null)? "" :renFavoritesVO.getFavAddTime()%>" /></td> --%>
<!-- 	</tr> -->

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>

</body>

</html>