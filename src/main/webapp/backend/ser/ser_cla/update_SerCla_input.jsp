<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_cla.model.*"%>

<%
SerClaVO serClaVO = (SerClaVO) request.getAttribute("serClaVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>服務類別修改 - update_SerCla_input.jsp</title>

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
	width: 550px;
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
		 <h3>服務類別修改</h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/ser/ser_cla/select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="UpdateSerClaServlet.do" name="form1">
<table>
	<tr>
		<td>類別編號:<font color=red><b>*</b></font></td>
		<td><%=serClaVO.getSerClaID()%></td>
	</tr>
	<tr>
		<td>類別名稱:</td>
		<td><input type="TEXT" name="serClaName" size="50"	value="<%=serClaVO.getSerClaName()%>" /></td>
	</tr>
	
	

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="serClaID" value="<%=serClaVO.getSerClaID()%>">
<input type="submit" value="送出修改"></FORM>

<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>
</body>




</html>