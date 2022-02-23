<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>EASY SPACE</title>
<style></style>
</head>
<body bgcolor="lightblue">
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
<!-- 	查詢多筆 -->
	<a href="<%=request.getContextPath() %>/frontend/sec_items/listAllSecItems.jsp"><b>列出所有二手商品</b></a>
	
<!-- 	查詢單筆 -->
	<form method="post" action="<%=request.getContextPath() %>/sec_items/GetSecItemsServlet.do">
		<b>請輸入查詢商品編號</b> 
		<input type="text" name="shID"> 
		<input type="hidden" name="action" value="getOne_For_Display"> 
		<input type="submit" value="送出">
	</form>
	
<!-- 	新增單筆 -->
	<a href="addSecItems.jsp"><b>新增一筆二手商品</b></a>
	
<!-- 	修改單筆 -->

</body>
</html>