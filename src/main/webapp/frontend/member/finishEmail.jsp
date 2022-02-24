<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.member.model.*"%>
<%
MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EASY SPACE</title>
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<body>


	<div align="center">
		<h2>驗證信</h2>
		<p>系統已成功寄出驗證信，煩請於30分鐘內開啟驗證信，並重新設定密碼</p>

	
			
			<h4>
				<a
					href="<%=request.getContextPath()%>/frontend/EZ_home.jsp">
					<img
					src="<%=request.getContextPath()%>/images/cmn/member/login_pic.png" width="100" height="32" border="0">回首頁</a>
			</h4>


	</div>


</body>
</html>