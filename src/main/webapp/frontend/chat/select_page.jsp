<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Chat: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body>

<table id="table-1">
   <tr><td><h3>Chat: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for Chat: Home</p>

<h3>資料查詢:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllChat.jsp'>List</a> all Chats.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="chat.do" >
        <b>輸入聊天編號 :</b>
        <input type="text" name="chatMsgId">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="chatSvc" scope="page" class="ezs.chat.model.ChatService" />
   
  <li>
     <FORM METHOD="post" ACTION="chat.do" >
       <b>選擇聊天編號:</b>
       <select size="1" name="chatMsgId">
         <c:forEach var="chatVO" items="${chatSvc.all}" > 
          <option value="${chatVO.chatMsgId}">${chatVO.chatMsgId}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="chat.do" >
       <b>選擇發送會員ID:</b>
       <select size="1" name="chatMsgId">
         <c:forEach var="chatVO" items="${chatSvc.all}" > 
          <option value="${chatVO.chatMsgId}">${chatVO.chatFromMemId}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>


<h3>聊天管理</h3>

<ul>
  <li><a href='addChat.jsp'>Add</a> a new Chat.</li>
</ul>


</body>
</html>