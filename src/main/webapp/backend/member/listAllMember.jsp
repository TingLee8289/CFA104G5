<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.member.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    MemberService memberSvc = new MemberService();
    List<MemberVO> list = memberSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有會員資料 - listAllMember.jsp</title>

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

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有會員資料 - listAllMember.jsp</h3>
		 <h4><a href="select_page.jsp">回首頁</a></h4>
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
		<th>密碼</th>
		<th>會員名稱</th>
		<th>房東身份</th>
		<th>廠商身份</th>
		<th>賣家身份</th>
		<th>電話</th>
		<th>地址</th>
		<th>會員Email帳號</th>
		<th>身分證字號</th>
		<th>會員狀態</th>
		<th>個人頭像</th>
		<th>評價總數</th>
		<th>評價總分</th>
		<th>被評價總數</th>
		<th>被評價總分</th>
		<th>被被檢舉數</th>
		<th>房東被檢舉數</th>
		<th>廠商被檢舉數</th>
		<th>賣家被檢舉數</th>
		<th>會員統一編號</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="memberVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${memberVO.memID}</td>
			<td>${memberVO.memUsername}</td>
			<td>${memberVO.memPassword}</td>
			<td>${memberVO.memName}</td>
			<td>${memberVO.memLandlord}</td>
			<td>${memberVO.memSupplier}</td> 
			<td>${memberVO.memSeller}</td>
			<td>${memberVO.memPhone}</td>
			<td>${memberVO.memAddress}</td>
			<td>${memberVO.memEmail}</td>
			<td>${memberVO.memPID}</td>
			<td>${memberVO.memStatus}</td>
			<td>${memberVO.memHeadshot}</td> 
			<td>${memberVO.memRevCount}</td>
			<td>${memberVO.memRevScore}</td>
			<td>${memberVO.memRedCount}</td>
			<td>${memberVO.memRedScore}</td>
			<td>${memberVO.memReported}</td>
			<td>${memberVO.memLddReported}</td>
			<td>${memberVO.memSupReported}</td>
			<td>${memberVO.memSelReported}</td>
			<td>${memberVO.memVatno}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="memID"  value="${memberVO.memID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/member.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="memID"  value="${memberVO.memID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>