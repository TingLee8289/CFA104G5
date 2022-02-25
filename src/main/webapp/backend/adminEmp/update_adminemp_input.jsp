<%@page import="ezs.admin_emp.model.AdminEmpVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="ezs.admin_priv.model.*"%>
<%@page import="ezs.admin_emp.model.*"%>
<%@page import="java.util.*"%>
<%
AdminEmpVO admEmpVO =  (AdminEmpVO) request.getAttribute("adminEmpVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>EASY SPACE後台管理系統</title>

</head>

<body>
	<form method=post action="<%=request.getContextPath()%>/admin_emp/AdminEmpServlet.do">
		<div class="row">
		<input type="hidden" name="admID" value="<%=admEmpVO.getAdmID()%>">
			<table class="table table-hover table-striped">
			
				<tr>
					<th id="test">管理員名稱:</th>
					<td><%=admEmpVO.getAdmUsername()%></td>
				</tr>
				<tr>
					<th id="test">管理員密碼:</th>
					<td><input type="TEXT" name="admPassword" size="45" value="<%=admEmpVO.getAdmPassword()%>"/></td>
				</tr>
				<tr>
					<th id="test">管理員狀態:</th>
					<td><select name="admStatus" value="<%=admEmpVO.getAdmStatus()%>">
							<option value="1">在職</option>
							<option value="0">離職</option>
					</select></td>
				</tr>
				<div><tr>
				<th>
					<input type="hidden" name="admUsername" value="<%=admEmpVO.getAdmUsername()%>"/>
					<input type="hidden" name="action" value="update">
					<input type=submit  value="確認修改" >
				</tr></div>
			
			</table>
		</div>

	</form>
	<div><a href="<%=request.getContextPath()%>/backend/adminEmp/adminEmp.jsp">回首頁</a></div>
	<div><%-- 錯誤表列 --%>
					<c:if test="${not empty errorMsgs}">
						<font style="color: red">請修正以下錯誤:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color: red">${message}</li>
							</c:forEach>
						</ul>
					</c:if>
	</div>
</body>
</html>