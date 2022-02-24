<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.sec_items.model.*"%>

<%
	SecItemsVO secItemsVO = (SecItemsVO) request.getAttribute("secItemsVO"); 
//SecItemsServlet.java (Concroller) 存入req的secItemsVO物件 (包括幫忙取出的secItemsVO, 也包括輸入資料錯誤時的SecItemsVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>EASY SPACE</title>

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
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>商品資料修改 - update_secItems_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
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

<FORM METHOD="post" ACTION="sec_items.do" name="form1">
<table>
	<tr>
		<td>商品編號:<font color=red><b>*</b></font></td>
		<td><%=secItemsVO.getShID()%></td>
	</tr>
	
	<jsp:useBean id="secCategorySvc" scope="page" class="ezs.sec_category.model.SecCategoryService" />
	<tr>
		<td>商品類別:<font color=red><b>*</b></font></td>
		<td><select size="1" name="secCategory">
			<c:forEach var="secCategoryVO" items="${secCategorySvc.all}">
				<option value="${secItemsVO.shCateID}" ${(secItemsVO.shCateID==secCategoryVO.shCateID)? 'selected':'' } >${secCategoryVO.shCateName}
			</c:forEach>
		</select></td>

	<tr>
	
	
	<tr>
		<td>會員編號:</td>
		<td><input type="TEXT" name="id" size="45"
			 value="<%=secItemsVO.getShSellerID()%>" /></td>
	</tr>
	
	<tr>
		<td>商品名稱:</td>
		<td><input type="TEXT" name="shname" size="45"
			 value="<%=secItemsVO.getShName()%>" /></td>
	</tr>
	<tr>
		<td>價格:</td>
		<td><input type="TEXT" name="job" size="45"
			 value="<%=secItemsVO.getShPrice()%>" /></td>
	</tr>
	<tr>
		<td>數量:</td>
		<td><input type="TEXT" name="job" size="45"
			 value="<%=secItemsVO.getShQTY()%>" /></td>
	</tr>
	<tr>
		<td>尺寸:</td>
		<td><input type="TEXT" name="job" size="45"
			 value="<%=secItemsVO.getShSize()%>" /></td>
	</tr>
	<tr>
		<td>簡介:</td>
		<td><input type="TEXT" name="sal" size="100"
			 value="<%=secItemsVO.getShDescription()%>" /></td>
	</tr>
	<tr>
		<td>新舊程度:</td>
		<td><input type="TEXT" name="comm" size="45"
			 value="<%=secItemsVO.getShCondition()%>" /></td>
	</tr>
	<tr>
		<td>已使用時間:</td>
		<td><input type="TEXT" name="comm" size="45"
			 value="<%=secItemsVO.getShTime()%>" /></td>
	</tr>
	<tr>
		<td>保固:</td>
		<td><input type="TEXT" name="comm" size="45"
			 value="<%=secItemsVO.getShGuarantee()%>" /></td>
	</tr>
	
	
	<tr>
		<td>狀態:</td>
		<td><input type="TEXT" name="comm" size="45"
			 value="<%=secItemsVO.getShStatus()%>" /></td>
	</tr>
	<tr>
		<td>所在縣市:</td>
		<td><input type="TEXT" name="comm" size="45"
			 value="<%=secItemsVO.getShCounty()%>" /></td>
	</tr>
	<tr>
		<td>所在鄉鎮區:</td>
		<td><input type="TEXT" name="comm" size="45"
			 value="<%=secItemsVO.getShDist()%>" /></td>
	</tr>
	
	
	
	

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="shID" value="<%=secItemsVO.getShID()%>">
<input type="submit" value="送出修改"></FORM>
</body>

</html>