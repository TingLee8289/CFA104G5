<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EASY SPACE</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
body {
	margin: 0;
	color: #edf3ff;
	background: #c8c8c8;
	background: url(<%=request.getContextPath()%>/images/cmn/index/login_pic.png)
		fixed;
	background-size: cover;
	font: 600 16px/18px 'Open Sans', sans-serif;
}

:after, :before {
	box-sizing: border-box
}

.clearfix:after, .clearfix:before {
	content: '';
	display: table
}

.clearfix:after {
	clear: both;
	display: block
}

a {
	color: inherit;
	text-decoration: none
}

.login-wrap {
	width: 100%;
	margin: auto;
	max-width: 510px;
	min-height: 510px;
	position: relative;
	background:
		/* 				url(https://maxcdn.icons8.com/app/uploads/2016/03/material-1-1000x563.jpg) */
		no-repeat center;
	background-size: cover;
	box-shadow: 0 12px 15px 0 rgba(0, 0, 0, .24), 0 17px 50px 0
		rgba(0, 0, 0, .19);
}

.login-html {
	width: 100%;
	height: 100%;
	position: absolute;
	padding: 90px 70px 50px 70px;
	background: rgba(0, 0, 0, 0.5);
}

.login-html .sign-in-htm, .login-html .for-pwd-htm {
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	position: absolute;
	-webkit-transform: rotateY(180deg);
	transform: rotateY(180deg);
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
	-webkit-transition: all .4s linear;
	transition: all .4s linear;
}

.login-html .sign-in, .login-html .for-pwd, .login-form .group .check {
	display: none;
}

.login-html .tab, .login-form .group .label, .login-form .group .button
	{
	text-transform: uppercase;
}

.login-html .tab {
	font-size: 22px;
	margin-right: 15px;
	padding-bottom: 5px;
	margin: 0 15px 10px 0;
	display: inline-block;
	border-bottom: 2px solid transparent;
}

.login-html .sign-in:checked+.tab, .login-html .for-pwd:checked+.tab {
	color: #fff;
	border-color: #1161ee;
}

.login-form {
	min-height: 345px;
	position: relative;
	-webkit-perspective: 1000px;
	perspective: 1000px;
	-webkit-transform-style: preserve-3d;
	transform-style: preserve-3d;
}

.login-form .group {
	margin-bottom: 15px;
}

.login-form .group .label, .login-form .group .input, .login-form .group .button
	{
	width: 100%;
	color: #fff;
	display: block;
}

.login-form .group .input, .login-form .group .button {
	border: none;
	padding: 15px 20px;
	border-radius: 25px;
	background: rgba(255, 255, 255, .1);
}

.login-form .group input[data-type="password"] {
	-webkit-text-security: circle;
}

.login-form .group .label {
	color: #aaa;
	font-size: 12px;
}

.login-form .group .button {
	background: #1161ee;
}

.login-form .group label .icon {
	width: 15px;
	height: 15px;
	border-radius: 2px;
	position: relative;
	display: inline-block;
	background: rgba(255, 255, 255, .1);
}

.login-form .group label .icon:before, .login-form .group label .icon:after
	{
	content: '';
	width: 10px;
	height: 2px;
	background: #fff;
	position: absolute;
	-webkit-transition: all .2s ease-in-out 0s;
	transition: all .2s ease-in-out 0s;
}

.login-form .group label .icon:before {
	left: 3px;
	width: 5px;
	bottom: 6px;
	-webkit-transform: scale(0) rotate(0);
	transform: scale(0) rotate(0);
}

.login-form .group label .icon:after {
	top: 6px;
	right: 0;
	-webkit-transform: scale(0) rotate(0);
	transform: scale(0) rotate(0);
}

.login-form .group .check:checked+label {
	color: #fff;
}

.login-form .group .check:checked+label .icon {
	background: #1161ee;
}

.login-form .group .check:checked+label .icon:before {
	-webkit-transform: scale(1) rotate(45deg);
	transform: scale(1) rotate(45deg);
}

.login-form .group .check:checked+label .icon:after {
	-webkit-transform: scale(1) rotate(-45deg);
	transform: scale(1) rotate(-45deg);
}

.login-html .sign-in:checked+.tab+.for-pwd+.tab+.login-form .sign-in-htm
	{
	-webkit-transform: rotate(0);
	transform: rotate(0);
}

.login-html .for-pwd:checked+.tab+.login-form .for-pwd-htm {
	-webkit-transform: rotate(0);
	transform: rotate(0);
}

.hr {
	height: 2px;
	margin: 60px 0 50px 0;
	background: rgba(255, 255, 255, .2);
}

.foot-lnk {
	text-align: center;
}
</style>
</head>
<body>
	<%-- 	<jsp:include page="/frontend/EZ_LoginHeader.jsp" /> --%>






	<div class="login-wrap">
		<div class="login-html">
			<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
				for="tab-1" class="tab">會員登入</label> <input id="tab-2" type="radio"
				name="tab" class="for-pwd"><label for="tab-2" class="tab">忘記密碼</label>
			<div class="login-form">
				<div class="sign-in-htm">
					<form id="login-form" method="post"
						action="<%=request.getContextPath()%>/member/MemberServlet.do">
						<div class="group">
							<label for="user" class="label">帳號</label> <input id="user"
								type="text" class="input" name="name">
						</div>
						<div class="group">
							<label for="pass" class="label">密碼</label> <input id="pass"
								type="password" class="input" data-type="password" name="psw">
						</div>
						<div class="group">
							<input type="submit" class="button" value="登入"> <input
								type="hidden" name="action" value="getOne_For_Display">
						</div>
					</form>
					<div class="group">
						<form
							action="<%=request.getContextPath()%>/frontend/member/memberRegister.jsp">
							<input type="submit" class="button" value="註冊會員">
						</form>
					</div>
					<div class="hr"></div>

				</div>
				<div class="for-pwd-htm">
					<form id="resetForm"
						ACTION="<%=request.getContextPath()%>/member/ForgetPasswordServlet.do"
						method="post">
						<div class="group">
							<label for="email" class="label">請輸入Email</label> <input
								type="text" class="input" name="email" id="email"> <input
								type="hidden" name="action" value="reset_Password_Email">
						</div>
						<div class="group">
							<input type="submit" class="button" value="重置密碼">
						</div>
						<div class="hr"></div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div style="text-align: center; background-color: gray; width: 400px; margin: auto;">
		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
<!-- 			<front style="color: red">請修正以下錯誤:</front> -->
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<p style="color: red">${message}</p>
				</c:forEach>
			</ul>
		</c:if>
	</div>
</body>
</html>