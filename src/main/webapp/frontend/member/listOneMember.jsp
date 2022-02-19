<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.member.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
<title>會員資料</title>

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

<table id="table-1">
	<tr><td>
		 <h3>${memberVO.memID}- ${memberVO.memUsername} 會員資料</h3>
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
		<td>會員頭像</td>
		<td><img src="<%=request.getContextPath()%>/DBGifReader?mem_ID=${memberVO.memID}" height=200px width=200px></td>
	</tr>
	<tr>			
		<td>會員編號:</td>
		<td>${memberVO.memID}</td>
	</tr>
	<tr>
		<td>帳號:</td>
		<td>${memberVO.memUsername}</td>
	</tr>
	<tr>
		<td>姓名:</td>
		<td>${memberVO.memName}</td>
	</tr>
	<tr>
		<td>電話:</td>
		<td>${memberVO.memPhone}</td>
	</tr>
	<tr>
		<td>地址:</td>
		<td>${memberVO.memAddress}</td>
	</tr>
	<tr>
		<td>email:</td>
		<td>${memberVO.memEmail}</td>
	</tr>
	<c:if test="${memberVO.memSupplier == 1}">
	<tr>
		<td>會員統一編號:</td>
		<td>${memberVO.memVatno}</td>
	</tr>
	</c:if>
<!-- 	<tr> -->
<!-- 		<td>評價總數:</td> -->
<%-- 		<td>${memberVO.memRevCount}</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>評價總分:</td> -->
<%-- 		<td>${memberVO.memRevScore}</td> --%>
<!-- 	</tr> -->
	<tr>
		<td>被評價總數:</td>
		<td>${memberVO.memRedCount}</td>
	</tr>
	<tr>
		<td>被評價總分:</td>
		<td>${memberVO.memRedScore}</td>
	</tr>
	<tr>
		<td>被評價均分:</td>
		<td>
					<c:choose>
						<c:when test="${(memberVO.memRedCount) == 0}">尚無評分</c:when>
						<c:otherwise>
							<fmt:formatNumber type="number" maxFractionDigits="1" 
								value="${(memberVO.memRedScore/memberVO.memRedCount)}"/>
						</c:otherwise>
					</c:choose></td>
	</tr>
	<tr>
	<td><form method="post" action="<%= request.getContextPath() %>/member/MemberServletUpdate.do">
						<input type="submit" value="修改"> 
						<input type="hidden" name="memID" value="${memberVO.memID}"> 
						<input type="hidden" name="action" value="getOne_For_Update">
					</form></td>
	</tr>


</table>

</body>
</html>