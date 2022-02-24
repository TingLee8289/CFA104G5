<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.sec_items.model.*"%>

<%
	SecItemsVO secItemsVO = (SecItemsVO) request.getAttribute("secItemsVO");
%>
<%= secItemsVO==null  %>
<%--  --${secItemsVO.shCateID}-- --%>
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
	width: 600px;
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
		 <h3>商品資料新增 - addSecItems.jsp</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="images/tomcat.png" width="150" height="150" border="0">回首頁</a></h4>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sec_items/sec_items.do" name="form1">
<!-- 確認路徑動態改法 -->
<%-- <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sec_items/sec_items.do" name="form1"> --%>
<table>
	<tr>
	
		
	<jsp:useBean id="secCategorySvc" scope="page" class="ezs.sec_category.model.SecCategoryService" />
	<tr>
		<td>選擇商品類別:<font color=red><b>*</b></font></td>
		<td><select size="1" name="secCategory">
			<c:forEach var="secCategoryVO" items="${secCategorySvc.all}">
				<option value="${secItemsVO.shCateID}" ${(secItemsVO.shCateID==secCategoryVO.shCateID)? 'selected':'' } >${secCategoryVO.shCateName}
			</c:forEach>
		</select></td>
	</tr>
	<tr>
	
		<td>會員編號:</td>
		<td><input type="TEXT" name="id" size="45"
			 value="<%= (secItemsVO==null)? "1" : secItemsVO.getShSellerID()%>" /></td>
	</tr>
	<tr>
		<td>商品名稱:</td>
		<td><input type="TEXT" name="shname" size="45"
			 value="<%= (secItemsVO==null)? "國際牌13公斤滾筒洗衣機" : secItemsVO.getShName()%>" /></td>
	</tr>
	<tr>
		<td>價格:</td>
		<td><input type="TEXT" name="job" size="45"
			 value="<%= (secItemsVO==null)? "12000" : secItemsVO.getShPrice()%>" /></td>
	</tr>
	<tr>
		<td>數量:</td>
		<td><input type="TEXT" name="job" size="45"
			 value="<%= (secItemsVO==null)? "1" : secItemsVO.getShQTY()%>" /></td>
	</tr>
	<tr>
		<td>尺寸:</td>
		<td><input type="TEXT" name="job" size="45"
			 value="<%= (secItemsVO==null)? "長67寬82高103(cm)" : secItemsVO.getShSize()%>" /></td>
	</tr>
	<tr>
		<td>簡介:</td>
		<td><input type="TEXT" name="sal" size="45"
			 value="<%= (secItemsVO==null)? "國際牌13公斤滾筒洗衣機" : secItemsVO.getShDescription()%>" /></td>
	</tr>
	<tr>
		<td>新舊程度:</td>
		<td><input type="TEXT" name="comm" size="45"
			 value="<%= (secItemsVO==null)? "八成新" : secItemsVO.getShCondition()%>" /></td>
	</tr>
	<tr>
		<td>已使用時間:</td>
		<td><input type="TEXT" name="comm" size="45"
			 value="<%= (secItemsVO==null)? "一年" : secItemsVO.getShTime()%>" /></td>
	</tr>
	<tr>
		<td>保固:</td>
		<td><input type="TEXT" name="comm" size="45"
			 value="<%= (secItemsVO==null)? " 一年" : secItemsVO.getShGuarantee()%>" /></td>
	</tr>
	
	
	<tr>
		<td>狀態:</td>
		<td><input type="TEXT" name="comm" size="45"
			 value="<%= (secItemsVO==null)? "1" : secItemsVO.getShStatus()%>" /></td>
	</tr>
	<tr>
		<td>所在縣市:</td>
		<td><input type="TEXT" name="comm" size="45"
			 value="<%= (secItemsVO==null)? "桃園市" : secItemsVO.getShCounty()%>" /></td>
	</tr>
	<tr>
		<td>所在鄉鎮區:</td>
		<td><input type="TEXT" name="comm" size="45"
			 value="<%= (secItemsVO==null)? "中壢區" : secItemsVO.getShDist()%>" /></td>
	</tr>
	


</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</body>



</html>