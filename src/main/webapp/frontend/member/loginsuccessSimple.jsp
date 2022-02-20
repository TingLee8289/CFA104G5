<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EASY SPACE</title>
</head>
<body>
	<a>前台success登入</a>
	<div>
		<%
		Object memusername = session.getAttribute("memUsername");
		out.println("getAttribute :" + memusername);
		%>
		<%
		Object memberid = session.getAttribute("memID");
		out.println("getAttribute :" + memberid);
		%>
	</div>

	<form METHOD="post"
		ACTION="<%=request.getContextPath()%>/member/MemberServlet.do">
		<input type="hidden" name="action" value="logout">
		<button name="button">登出</button>
	</form>
</body>
</html>