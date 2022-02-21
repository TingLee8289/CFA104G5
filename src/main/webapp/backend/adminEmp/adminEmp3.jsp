<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.admin_emp.model.*"%>
<%@ page import="java.util.*"%>
<%@page import="ezs.admin_func.model.AdminFuncService"%>
<%@page import="ezs.admin_func.model.AdminFuncVO"%>
<jsp:useBean id="adminFunSvc" scope="page"
	class="ezs.admin_func.model.AdminFuncService" />

<%
AdminEmpService admSvc = new AdminEmpService();
List<AdminEmpVO> list = admSvc.getAll();
pageContext.setAttribute("list", list);
// System.out.print(list);
%>
<%
AdminFuncService admfSvc = new AdminFuncService();
List<AdminFuncVO> funList = admfSvc.getAll();
pageContext.setAttribute("funList", funList);
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
			<th>管理員權限</th>

		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="adminEmpVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td>${adminEmpVO.admID}</td>
				<td>${adminEmpVO.admUsername}</td>
				<td>${adminEmpVO.admPassword}</td>
				<td>${adminEmpVO.admStatus}</td>
				
<!-- 				<td> -->
<%-- 				<c:forEach var="adminPrivVO" items="${adminEmpVO.authlist}"> --%>
<%-- 						<br>${adminFunSvc.getoneAdminFunc(adminPrivVO.funID).funName} --%>
<%-- 					</c:forEach> --%>
<!-- 				</td> -->
				
				<td>
				<c:forEach var="funElment" items="${funList}">
					<input type=hidden name="${funElment.funName}" value="${funElment.funID}" checked>
					<br>
					
					<c:set var="check" value="0" />
					<c:forEach var="adminPrivVO" items="${adminEmpVO.authlist}">
						<c:if test="${adminPrivVO.funID == funElment.funID }">
							<c:set var="check" value="1" />
						</c:if>
					</c:forEach>
					
					<c:if test="${ check == 1 }">
						<input type="checkbox" name="${funElment.funName}" value="${funElment.funID}" checked> ${funElment.funName}
					</c:if>
					<c:if test="${ check != 1 }">
						<input type="checkbox" name="${funElment.funName}" value="${funElment.funID}"> ${funElment.funName}
					</c:if>
				</c:forEach>
				</td>




				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/admin_priv/AdminPrivServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改權限"> <input type="hidden"
							name="admID" value="${adminEmpVO.admID}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/admin_priv/AdminPrivServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="admID" value="${adminEmpVO.admID}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<p style="color: red">${message}</p>
			</c:forEach>
		</ul>
	</c:if>
	<ul>
		<li><a
			href='<%=request.getContextPath()%>/backend/adminEmp/addNewAdmin.jsp'>Add</a>
			a new Emp</li>
	</ul>

</body>
</html>