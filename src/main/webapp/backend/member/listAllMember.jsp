<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.member.model.*"%>

<%
    MemberService memberSvc = new MemberService();
    List<MemberVO> list = memberSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有會員資料</title>

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
		 <h3>所有會員資料</h3>
<!-- 		 <h4><a href="select_page.jsp">回首頁</a></h4> -->
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
		<th>會員ID</th>
		<th>帳號</th>
		<th>姓名</th>
		<th>會員狀態</th>
		<th>房東身份</th>
		<th>廠商身份</th>
		<th>賣家身份</th>
		<th>被檢舉數</th>
		<th>房東被檢舉數</th>
		<th>廠商被檢舉數</th>
		<th>賣家被檢舉數</th>
		
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="memberVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${memberVO.memID}</td>
			<td>${memberVO.memUsername}</td>
			<td>${memberVO.memName}</td>
			<td>	
				<c:if test="${memberVO.memStatus == 0}">Email未驗證</c:if>
				<c:if test="${memberVO.memStatus == 1}">Email已驗證</c:if>
				<c:if test="${memberVO.memStatus == 2}">停權</c:if></td>
			<td>
				<c:if test="${memberVO.memLandlord == 0}">未驗證</c:if>
				<c:if test="${memberVO.memLandlord == 1}">已驗證</c:if>
				<c:if test="${memberVO.memLandlord == 2}">停權</c:if></td>   
			<td>
				<c:if test="${memberVO.memSupplier == 0}">停權</c:if>
				<c:if test="${memberVO.memSupplier == 1}">啟用</c:if></td> 
			<td>
				<c:if test="${memberVO.memSeller == 0}">停權</c:if>
				<c:if test="${memberVO.memSeller == 1}">啟用</c:if></td>
			<td>${memberVO.memReported}</td>
			<td>${memberVO.memLddReported}</td>
			<td>${memberVO.memSupReported}</td>
			<td>${memberVO.memSelReported}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/MemberServletUpdate.do" style="margin-bottom: 0px;">
			     <input type="submit" value="查看詳細資料">
			     <input type="hidden" name="memID"  value="${memberVO.memID}">
			     <input type="hidden" name="action"	value="getOneMem_Display"> </FORM>
			</td>
		</tr>
	</c:forEach>
</table>


<%@ include file="page2.file" %>

</body>
</html>