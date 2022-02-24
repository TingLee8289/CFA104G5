<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="ezs.admin_func.model.*"%>
<jsp:useBean id="adminFunSvc" scope="page" class="ezs.admin_func.model.AdminFuncService" />
<%@ page import="java.util.*"%>
<%
AdminFuncService admfSvc = new AdminFuncService();
List<AdminFuncVO> funList = admfSvc.getAll();
pageContext.setAttribute("funlist", funList);
// System.out.print(funList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EASY SPACE</title>
</head>
<body>
<a href="<%=request.getContextPath()%>/backend/adminEmp/adminEmp.jsp">回首頁</a>
	<form method="post"
		action="<%=request.getContextPath()%>/admin_emp/AdminEmpServlet.do">
		<table>
			<tr>
				<td>管理員名稱:</td>
				<td><input type="TEXT" name="admUsername" size="45" /></td>
			</tr>
			<tr>
				<td>管理員密碼:</td>
				<td><input type="TEXT" name="admPassword" size="45" /></td>
			</tr>
			<tr>
				<td>管理員狀態:</td>
				<td><select name="admStatus">
						<option value="1">在職</option>
						<option value="0">離職</option>
				</select></td>
			</tr>
		</table>
		<td><input type="hidden" name="action" value="insert"> <input
			type="submit" value="確認新增"></td>
	</form>

<input type ="checkbox" name="priv" checked="null">
<input type ="checkbox" name="priv" checked="checked">
<input type ="checkbox" name="priv" checked="">
<input type ="checkbox" name="priv" >




	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
</body>
</html>