<%@page import="ezs.admin_emp.model.AdminEmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="ezs.admin_priv.model.*"%>
    <%@ page import="java.util.*"%>
    <%
    List<AdminPrivVO> adminprivVO = (List<AdminPrivVO>) request.getAttribute("adminprivVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EASY SPACE後台管理系統</title>
</head>

<body>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<c:forEach var=adminprivVO items="${list}">
</c:forEach>
</body>
</html>