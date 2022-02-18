<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.admin_emp.model.*"%>
<%
AdminEmpService admSvc = new AdminEmpService();
List<AdminEmpVO> list = admSvc.getAll();
pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>員工管理</title>
</head>
<body>
	<table>
		<tr>
			<th>管理員ID</th>
			<th>管理員帳號</th>
			<th>管理員密碼</th>
			<th>管理員狀態</th>

		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="AdminEmpVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td>${AdminEmpVO.admID}</td>
				<td>${AdminEmpVO.admUsername}</td>
				<td>${AdminEmpVO.admPassword}</td>
				<td>${AdminEmpVO.admStatus}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/admin_priv/AdminPrivServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改權限"> 
						<input type="hidden" name="admID" value="${AdminEmpVO.admID}"> 
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM></td><td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/admin_priv/AdminPrivServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> 
						<input type="hidden" name="admID" value="${AdminEmpVO.admID}"> 
						<input type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>
</body>
</html>