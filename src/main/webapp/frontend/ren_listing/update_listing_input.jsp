<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ren_listing.model.*"%>

<%
RenListingVO renListingVO = (RenListingVO) request.getAttribute("renListingVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
System.out.print(renListingVO);
%>
<%= renListingVO==null %>--${renListingVO.lisID}--
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>房源修改</title>

<style>
  table#table-1 {
	background-color: #c27f29;
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
<body bgcolor='white'>
<table id="table-1">
 

	<tr><td>
		<h3>房東修改</h3>
		<h4><a href="listing_select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>
	<h3>資料修改</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="RenListingServlet.do" name="form1">
<table>
	<tr>
		<td>房源編號:</td>
		<td><%=renListingVO.getLisID()%></td>
	</tr>
	<tr>
		<td>房東編號:</td>
		<td><%=renListingVO.getLisLddID()%></td>
	</tr>
	<tr>
		<td>房型:</td>
		<td><%=renListingVO.getLisRtID()%></td>
	</tr>
	<tr>
		<td>區域:</td>
		<td><%=renListingVO.getLisAreaID()%></td>
	</tr>
	<tr>
		<td>詳細地址<font color=red><b>*</b></font></td>
		<td><%=renListingVO.getLisAddress()%></td>
	<tr>
		<td>房源標題<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="lisTitle" maxlength="25" size="45"
			value="<%=renListingVO.getLisTitle()%>"/></td>
	</tr>
	<tr>
		<td>房源介紹<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="lisAbt" size="45"	
			value="<%=renListingVO.getLisAbt()%>"/></td>
	</tr>
	
</table>





</FORM>



</body>
</html>