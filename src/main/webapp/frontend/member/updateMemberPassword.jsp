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
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<div align="center">
		<h2>重設密碼</h2>
		<p>請輸入帳號及密碼:</p>
		<form method="post" action="<%=request.getContextPath()%>/member/ResetPasswordServlet.do">
		
			<div class="col-sm-12">
				<div class="row">
					<div class="col-xs-4">
						<label class="memID">帳號 :</label>
<!-- 					</div> -->
<!-- 					<div class="col-xs-8"> -->
						<input type="text" name="memID" id="memID"
							placeholder="請輸入帳號" class="form-control "
							value="<%=(memberVO == null) ? "" : memberVO.getMemID()%>">
					</div>
				</div>
			</div>
		
			<div class="col-sm-12">
				<div class="row">
					<div class="col-xs-4">
						<label class="memPassword">密碼 :</label>
<!-- 					</div> -->
<!-- 					<div class="col-xs-8"> -->
						<input type="text" name="memPassword" id="memPassword"
							placeholder="請輸入密碼" class="form-control "
							value="<%=(memberVO == null) ? "" : memberVO.getMemPassword()%>">
					</div>
				</div>
			</div>
			<br>
			<input type="hidden" name="action" value="update"> <input
				type="submit" value="送出更新" class="btn btn-submit">
				
				
		</form>
	</div>







	<!-- <script type="text/javascript"> -->

	<!-- </script> -->
</body>
</html>