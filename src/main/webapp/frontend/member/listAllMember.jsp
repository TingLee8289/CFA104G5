<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.sec_items.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有會員</title>
</head>
<body>
	<a href="select_sec_items_page.jsp">回首頁</a>
	<table>
		<tr>
			<th>MemUsername</th>
			<th>MemPassword</th>
			<th>MemName</th>
			<th>MemLandlord</th>
			<th>MemSupplier</th>
			<th>MemSeller</th>
			<th>MemPhone</th>
			<th>MemAddress</th>
			<th>MemEmail</th>
			<th>MemPID</th>
			<th>MemStatus</th>
			<th>MemHeadshot</th>
			<th>MemHeadshot</th>
			<th>MemRevCount</th>
			<th>MemRevScore</th>
			<th>MemRedCount</th>
			<th>MemRedScore</th>
			<th>MemReported</th>
			<th>MemLddReported</th>
			<th>MemSelReported</th>
			<th>MemSupReported</th>
			<th>MemVatno</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>

		<c:forEach var="memberVO" items="${list}">
			<tr>
				<td>${memberVO.memUsername}</td>
				<td>${memberVO.memPassword}</td>
				<td>${memberVO.memName}</td>
				<td>${memberVO.memLandlord}</td>
				<td>${memberVO.memSupplier}</td>
				<td>${memberVO.memSeller}</td>
				<td>${memberVO.memPhone}</td>
				<td>${memberVO.memAddress}</td>
				<td>${memberVO.memEmail}</td>
				<td>${memberVO.memPID}</td>
				<td>${memberVO.memStatus}</td>
				<td>${memberVO.memHeadshot}</td>
				<td>${memberVO.memRevCount}</td>
				<td>${memberVO.memRevScore}</td>
				<td>${memberVO.memRedCount}</td>
				<td>${memberVO.memRedScore}</td>
				<td>${memberVO.memReported}</td>
				<td>${memberVO.memLddReported}</td>
				<td>${memberVO.memSupReported}</td>
				<td>${memberVO.memSelReported}</td>
				<td>${memberVO.memVatno}</td>

				<td><form method="post" action="<%= request.getContextPath() %>/member/MemberServlet.do">
						<input type="submit" value="修改"> <input type="hidden"
							name="memID" value="${memberVO.memID}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</form></td>
				<td>
					<form method="post" action="<%= request.getContextPath() %>/member/MemberServlet.do">
						<input type="submit" value="刪除"> <input type="hidden"
							name="memID" value="${memberVO.memID}"> <input
							type="hidden" name="action" value="delete">
					</form>

				</td>

			</tr>
		</c:forEach>
	</table>
</body>
</html>