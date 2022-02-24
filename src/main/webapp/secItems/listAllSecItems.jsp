<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.sec_items.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	SecItemsService secItemsSvc = new SecItemsService();
    List<SecItemsVO> list = secItemsSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>EASY SPACE</title>

<style>
  table#table-1 {
	background-color: LightSkyBlue;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: SkyBlue;
    display: inline;
  }
</style>

<style>
  table {
	width: 2000px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 10px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='Linen'>

<h4></h4>
<table id="table-1">
	<tr><td>
		 <h3>所有商品列表</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
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
		<th>商品編號</th>
		<th>商品分類編號</th>
		<th>賣家編號</th>
		<th>商品名稱</th>
		<th>商品價格</th>
		<th>數量</th>
		<th>尺寸</th>
		<th>摘要</th>
		<th>新舊程度</th>
		<th>已使用時間</th>
		<th>保固期間</th>
		<th>狀態</th>
		<th>所在縣市</th>
		<th>所在鄉鎮區</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
<!-- 	分頁功能 -->
	<%@ include file="page1.file" %> 
	<c:forEach var="secItemsVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${secItemsVO.shID}</td>
			<td>${secItemsVO.shCateID}</td>
			<td>${secItemsVO.shSellerID}</td>
			<td>${secItemsVO.shName}</td>
			<td>${secItemsVO.shPrice}</td>
			<td>${secItemsVO.shQTY}</td>
			<td>${secItemsVO.shSize}</td>
			<td>${secItemsVO.shDescription}</td>
			<td>${secItemsVO.shCondition}</td>
			<td>${secItemsVO.shTime}</td>
			<td>${secItemsVO.shGuarantee}</td>
			<td>${secItemsVO.shStatus}</td>
			<td>${secItemsVO.shCounty}</td>
			<td>${secItemsVO.shDist}</td>
		
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sec_items/sec_items.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="shID"  value="${secItemsVO.shID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sec_items/sec_items.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="shID"  value="${secItemsVO.shID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>