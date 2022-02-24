<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<%-- 	<% --%>
//     EmpService empSvc = new EmpService();
//     List<EmpVO> list = empSvc.getAll();
//     pageContext.setAttribute("list",list);
<%-- %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EASY SPACE</title>
</head>
<body>
	<%
	Object memusername = session.getAttribute("memUsername");
	out.print("getAttribute: " + memusername);
	%>
	<br>
	<a>${memUsername}交易紀錄</a>
	<table>
	<tr>
	<th>交易流水編號</th>
	<th>會員ID</th>
	<th>交易時間</th>
	<th>交易類別</th>
	<th>交易金額</th>
	<th>待付金額</th>
	<th>錢包可用餘額</th>
	</tr>

	
	
	
	</table>
</body>
</html>