<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.chat.model.*"%>

<%
  ChatVO chatVO = (ChatVO) request.getAttribute("chatVO");
%>
<%= chatVO==null %>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>聊天資料新增 - addChat.jsp</title>

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


<table id="table-1">
	<tr><td>
		 <h3>員工資料新增 - addEmp.jsp</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="chat.do" name="form1">
<table>
	<tr>
		<td>發送會員ID:</td>
		<td><input type="TEXT" name="chatFromMemId" 
			 value="<%= (chatVO==null)? "1" : chatVO.getChatFromMemId()%>" /></td>
	</tr>
	<tr>
		<td>接收會員ID:</td>
		<td><input type="TEXT" name="chatToMemId" 
			 value="<%= (chatVO==null)? "2" : chatVO.getChatToMemId()%>" /></td>
	</tr>
	<tr>
		<td>聊天內容:</td>
		<td><input type="TEXT" name="job" size="255"
			 value="<%= (chatVO==null)? "HELLLOOOO!!!!" : chatVO.getChatContent()%>" /></td>
	</tr>
	<tr>
		<td>發送時間:</td>
		<td><input type="TEXT" name="chatTime" size="30"
			 value="<%= (chatVO==null)? "2022-02-02 22:00:00" : chatVO.getChatTime()%>" /></td>
	</tr>	
	<tr>
		<td>圖片:</td>
		<td><input type="IMAGE" name="chatTime" size="30"
			 value="<%= chatVO.getChatImages()%>" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</body>

</html>