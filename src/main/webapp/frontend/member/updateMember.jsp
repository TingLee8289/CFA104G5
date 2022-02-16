<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.member.model.*"%>

<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
<meta charset="UTF-8">
<title>會員資料修改</title>
</head>
<body>
	<table>
		<tr>
			<th>密碼</th>
			<th>名稱</th>
			<th>電話</th>
			<th>地址</th>
			<th>email帳號</th>
			<th>個人頭像</th>
			<th>統一編號</th>
			<th>修改</th>
<!-- 			<th>刪除</th> -->
		</tr>
		
		
		
		<tr>
		<form enctype="multipart/form-data">	
				<td><input type="TEXT" name="memPassword" size="20" value="<%=memberVO.getMemPassword()%>" /></td>
				<td><input type="TEXT" name="memName" size="20" value="<%=memberVO.getMemName()%>" /></td>
				<td><input type="TEXT" name="memPhone" size="20" value="<%=memberVO.getMemPhone()%>" /></td>
				<td><input type="TEXT" name="memAddress" size="20" value="<%=memberVO.getMemAddress()%>" /></td>
				<td><input type="TEXT" name="memEmail" size="20" value="<%=memberVO.getMemEmail()%>" /></td>
				<td><input type="TEXT"  name="memHeadshot" size="20" value="<%=memberVO.getMemHeadshot()%>" /></input>
				<td><input type="TEXT" name="memVatno" size="20" value="<%=memberVO.getMemVatno()%>" /></td>
	</form>		
				<td><form method="post" action="<%= request.getContextPath() %>/member/MemberServletUpdate.do">
						<input type="submit" value="修改"> 
						<input type="hidden" name="memID" value="${memberVO.memID}"> 
						<input type="hidden" name="action" value="getOne_For_Update">
					</form></td>

<!-- 				<td> -->
<%-- 					<form method="post" action="<%= request.getContextPath() %>/member/MemberServletUpdate.do"> --%>
<!-- 						<input type="submit" value="刪除">  -->
<%-- 						<input type="hidden" name="memID" value="${memberVO.memID}">  --%>
<!-- 						<input type="hidden" name="action" value="delete"> -->
<!-- 					</form> -->
<!-- 				</td> -->

			</tr>


	</table>
</body>
</html>