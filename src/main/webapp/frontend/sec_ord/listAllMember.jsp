<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.sec_ord.model.*"%>

<jsp:useBean id="memberSvc" scope="page" class="ezs.member.model.MemberService" />

<html>
<head>
<title>EASY SPACE</title>

<style>
  table#table-1 {
	background-color: orange;
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
<table id="table-1">
	<tr><td>
		 <h3>所有買家 - listAllMember.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/frontend/sec_ord/listAllMember.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
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
		<th>買家會員ID</th>
		<th>買家會員帳號</th>
		<th>查詢買家會員訂單</th>
	</tr>
	
	<c:forEach var="memberVO" items="${memberSvc.all}">
		<tr>
			<td>${memberVO.memID}</td>
			<td>${memberVO.memUsername}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sec_ord/SecOrdServlet.do" style="margin-bottom: 0px;">
			    <input type="submit" value="送出查詢"> 
			    <input type="hidden" name="shBuyerID" value="${memberVO.memID}">
			    <input type="hidden" name="action" value="listSecOrd_ByShBuyerID"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>

<%if (request.getAttribute("listSecOrds_ByShBuyerID")!=null){%>
       <jsp:include page="/frontend/sec_ord/listSecOrds_ByShBuyerID.jsp" />
<%} %>

</body>
</html>