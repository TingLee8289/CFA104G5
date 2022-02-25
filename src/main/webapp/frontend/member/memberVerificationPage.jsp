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
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
		<style>
			body {
				margin: 0;
				color: #edf3ff;
				background: #c8c8c8;
				background:
					url(<%=request.getContextPath()%>/images/cmn/index/verification_pic.jpeg)
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
<%-- 					url(<%=request.getContextPath()%>/images/cmn/index/verification_pic.jpeg) --%>
					no-repeat center;
				background-size: cover;
				box-shadow: 0 12px 15px 0 rgba(0, 0, 0, .24), 0 17px 50px 0
					rgba(0, 0, 0, .19);
			}
			
			.verify-html {
				width: 100%;
				height: 100%;
				position: absolute;
				padding: 90px 70px 50px 70px;
				background: rgba(0, 0, 0, 0.5);
			}
			
			.verify-html .sign-in, .verify-html .for-pwd, .login-form .group .check
				{
				display: none;
			}
			
			.verify-html .tab, .login-form .group .label, .login-form .group .button
				{
				text-transform: uppercase;
			}
			
			.verify-html .tab {
				font-size: 22px;
				margin-right: 15px;
				padding-bottom: 5px;
				margin: 0 15px 10px 0;
				display: inline-block;
				border-bottom: 2px solid transparent;
				text-align: center;
			}
			
			.verify-html .sign-in:checked+.tab, .verify-html .for-pwd:checked+.tab {
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
				text-security: circle;
				-webkit-text-security: circle;
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
			
			.verify-html .sign-in:checked+.tab+.for-pwd+.tab+.login-form .sign-in-htm
				{
				-webkit-transform: rotate(0);
				transform: rotate(0);
			}
			
			.verify-html .for-pwd:checked+.tab+.login-form .for-pwd-htm {
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
			
			::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
				color: rgba(29, 11, 11, 0.5);
				opacity: 1; /* Firefox */
				text-align: center;
			}
			
			:-ms-input-placeholder { /* Internet Explorer 10-11 */
				color: rgba(29, 11, 11, 0.5);
					text-align: center;
			}
			
			::-ms-input-placeholder { /* Microsoft Edge */
				color: rgba(29, 11, 11, 0.5);
				text-align: center;
			}
		</style>
	</head>

<body>


	<div class="login-wrap">
		<div class="verify-html">
			<input id="tab-2" type="radio" name="tab" class="for-pwd">
			<label for="tab-2" class="tab">已將驗證碼發送至您的信箱</label>
			<div class="login-form">

				<div class="for-pwd-htm">
					<form method="post" action="<%=request.getContextPath()%>/member/MemberVerificationServlet.do">
						<div class="group">
							<input id="user" type="text" class="input" placeholder="請輸入驗證碼" name="verifCode">
						</div>
						<div class="group">
							<input type="hidden" name="action" value="verify"> 
							<input type="submit" class="button" value="送出">
						</div>
					</form>
					<form method="post" action="<%=request.getContextPath()%>/member/MemberVerificationServlet.do">
						<div class="group">
							<input type="hidden" name="action" value="resent"> 
							<input type="submit" class="button" value="重寄驗證信">
						</div>
					</form>
					<div class="hr"></div>
					
<!-- 提示訊息列------------------------------------------------------------- -->
					<div style="background-color: gray;">
						<c:if test="${not empty errorMsgs}">
							<div style="margin: 0px auto;">
								<font style="color: red">請修正以下錯誤:</font>
								<ul style="list-style-type: none;">
									<c:forEach var="message" items="${errorMsgs}">
										<li style="color: red">${message}</li>
									</c:forEach>
								</ul>
							</div>
						</c:if>
					</div>
<!-- 提示訊息列------------------------------------------------------------- -->					
				</div>
			</div>
		</div>
	</div>
</body>

</html>