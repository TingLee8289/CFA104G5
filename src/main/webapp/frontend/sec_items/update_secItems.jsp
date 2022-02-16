<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.sec_items.model.*"%>
<%
SecItemsVO secItemsVO = (SecItemsVO) request.getAttribute("secItemsVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>二手商品修改</title>
</head>
<body>
	<a href="<%=request.getContextPath() %>/frontend/sec_items/select_sec_items_page.jsp">回首頁</a>
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font> 
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<form method="post" action="SecItemsServlet.do" name="form1">
		<table>
<!-- 			<tr> -->
<!-- 				<td>商品ID:</td> -->
<%-- 				<td><input type="text" name="shID" value="<%= (secItemsVO==null)? "" : secItemsVO.getShID()%>" /></td> --%>
<!-- 			</tr> -->
			<tr>
				<td>商品分類ID:</td>
				<td><input type="text" name="shCateID" value="<%= (secItemsVO==null)? "" : secItemsVO.getShCateID()%>" /></td>
			</tr>
			<tr>
				<td>賣家ID:</td>
				<td><input type="text" name="shSellerID" value="<%= (secItemsVO==null)? "" : secItemsVO.getShSellerID()%>" /></td>
			</tr>
			<tr>
				<td>商品名稱:</td>
				<td><input type="text" name="shName" value="<%= (secItemsVO==null)? "" : secItemsVO.getShName()%>" /></td>
			</tr>
			<tr>
				<td>商品價格:</td>
				<td><input type="text" name="shPrice" value="<%= (secItemsVO==null)? "" : secItemsVO.getShPrice()%>" /></td>
			</tr>
			<tr>
				<td>商品數量:</td>
				<td><input type="text" name="shQTY" value="<%= (secItemsVO==null)? "" : secItemsVO.getShQTY()%>" /></td>
			</tr>
			<tr>
				<td>商品尺寸:</td>
				<td><input type="text" name="shSize" value="<%= (secItemsVO==null)? "" : secItemsVO.getShSize()%>" /></td>
			</tr>
			<tr>
				<td>商品介紹:</td>
				<td><input type="text" name="shDescription" value="<%= (secItemsVO==null)? "" : secItemsVO.getShDescription()%>" /></td>
			</tr>
			<tr>
				<td>商品新舊狀況:</td>
				<td><input type="text" name="shCondition" value="<%= (secItemsVO==null)? "" : secItemsVO.getShCondition()%>" /></td>
			</tr>
			<tr>
				<td>商品已使用時間:</td>
				<td><input type="text" name="shTime" value="<%= (secItemsVO==null)? "" : secItemsVO.getShTime()%>" /></td>
			</tr>
			<tr>
				<td>商品保固:</td>
				<td><input type="text" name="shGuarantee" value="<%= (secItemsVO==null)? "" : secItemsVO.getShGuarantee()%>" /></td>
			</tr>
			<tr>
				<td>商品狀態:</td>
				<td><input type="text" name="shStatus" value="<%= (secItemsVO==null)? "" : secItemsVO.getShStatus()%>" /></td>
			</tr>
			<tr>
				<td>商品所在縣市:</td>
				<td><input type="text" name="shCounty" value="<%= (secItemsVO==null)? "" : secItemsVO.getShCounty()%>" /></td>
			</tr>
			<tr>
				<td>商品所在鄉鎮區:</td>
				<td><input type="text" name="shDist" value="<%= (secItemsVO==null)? "" : secItemsVO.getShDist()%>" /></td>
			</tr>
			
			</table>
			<input type="hidden" name="action" value="update">
			<input type="hidden" name="shID" value="<%=secItemsVO.getShID()%>">
			<input type="submit" value="送出修改">
	</form>

</body>
</html>