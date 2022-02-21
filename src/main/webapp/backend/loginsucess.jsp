<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>success登入</title>
</head>
<body>
<a>success</a>
<h3> 歡迎:<font color=red> ${admUsername} </font>您好</h3>

	<%
	Object admUsername = session.getAttribute("admUsername");
	out.print("getAttribute: " + admUsername);
	%>

	<form METHOD="post"
		ACTION="<%=request.getContextPath()%>/admin_emp/AdminEmpServlet.do">
		<input type="hidden" name="action" value="logout"> 
		<button name="button">登出</button>
	</form>

</body>
</html>