<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>




	<form METHOD="post"
		ACTION="<%=request.getContextPath()%>/AdminEmpServlet">
		<b>帳號:</b> <input type="text" name="admUsername"> 
		<b>密碼:</b> <input type="password" name="admPassword"> 
		<input type="hidden" name="action" value="getOne_For_Display"> 
			<input type="submit" value="送出">
	</form>
	帳號:
	<b>BOSS</b>
	<br> 密碼:
	<b>boss123</b>
	<br>
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<p style="color: red">${message}</p>
			</c:forEach>
		</ul>
	</c:if>

</body>
</html>