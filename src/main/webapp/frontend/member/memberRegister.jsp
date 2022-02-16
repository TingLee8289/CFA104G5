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
<meta charset="UTF-8">
<title>EASY SPACE</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
/*-----Background-----*/
body {
	background-image: url(https://s3.envato.com/files/243754334/primag.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	width: 100%;
	height: 100vh;
	overflow: auto;
}

/*-----for border----*/
.container {
	font-family: Roboto, sans-serif;
	background-image:
		url(https://image.freepik.com/free-vector/dark-blue-blurred-background_1034-589.jpg);
	border-style: 1px solid grey;
	margin: 0 auto;
	text-align: center;
	opacity: 0.8;
	margin-top: 67px;
	box-shadow: 2px 5px 5px 0px #eee;
	max-width: 500px;
	padding-top: 10px;
	height: 500px;
	margin-top: 166px;
}
/*---for heading-----*/
.heading {
	text-decoration: bold;
	text-align: center;
	font-size: 30px;
	color: #F96;
	padding-top: 10px;
}
/*--- for username label & input---*/
.Username {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 10px;
}

#memUsername {
	margin-top: 5px;
}
/*--- for password label & input---*/
.Password {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 10px;
}

#memPassword {
	margin-top: 5px;
}
/*--- for name label & input---*/
.Name {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 10px;
}

#memName {
	margin-top: 5px;
}
/*--- for phone label & input---*/
.Phone {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 10px;
}

#memPhone {
	margin-top: 5px;
}
/*--- for address label & input---*/
.Address {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 10px;
}

#memAddress {
	margin-top: 5px;
}
/*--- for email label & input---*/
.Email {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 10px;
}

#memEmail {
	margin-top: 5px;
}
/*--- for PID label & input---*/
.PID {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 10px;
}

#memPID {
	margin-top: 5px;
}
/*--- for Vatno label & input---*/
.Vatno {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 10px;
}

#memVatno {
	margin-top: 5px;
}
/*--- for username label & input---*/
.Username {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 10px;
}

#memUsername {
	margin-top: 5px;
}
/*--- for Headshot label & input---*/
.Headshot {
	margin-left: 1px;
	font-family: sans-serif;
	font-size: 14px;
	color: white;
	margin-top: 10px;
}

#memHeadshot {
	margin-top: 5px;
}

/*------------For submit button---------*/
.btn-submit {
	margin-top: 5px;
}
.btn.btn-submit:hover {
	box-shadow: 2px 1px 2px 3px #99ccff;
	background: #5900a6;
	color: #fff;
	transition: background-color 1.15s ease-in-out, border-color 1.15s
		ease-in-out, box-shadow 1.15s ease-in-out;
}
</style>
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
	<div class="container">
		<!---heading---->
		<header class="heading">填寫會員資料</header>
		<hr></hr>
		<!---Form starting---->
		<form method="post"
			action="<%=request.getContextPath()%>/member/MemberServlet.do"
			enctype="multipart/form-data">
			<!--- For memUsername---->
			<div class="col-sm-12">
				<div class="row">
					<div class="col-xs-4">
						<label class="Username">帳號 :</label>
					</div>
					<div class="col-xs-8">
						<input type="text" name="memUsername" id="memUsername"
							placeholder="請輸入帳號" class="form-control "
							value="<%=(memberVO == null) ? "" : memberVO.getMemUsername()%>">
					</div>
				</div>
			</div>
			<!--- For memPassword---->
			<div class="col-sm-12">
				<div class="row">
					<div class="col-xs-4">
						<label class="Password">密碼 :</label>
					</div>
					<div class="col-xs-8">
						<input type="password" name="memPassword" id="memPassword"
							placeholder="請輸入密碼" class="form-control "
							value="<%=(memberVO == null) ? "" : memberVO.getMemPassword()%>">
					</div>
				</div>
			</div>
			<!--- For memName---->
			<div class="col-sm-12">
				<div class="row">
					<div class="col-xs-4">
						<label class="Name">會員名稱 :</label>
					</div>
					<div class="col-xs-8">
						<input type="text" name="memName" id="memName"
							placeholder="請輸入會員名稱" class="form-control "
							value="<%=(memberVO == null) ? "" : memberVO.getMemName()%>">
					</div>
				</div>
			</div>
			<!--- For memPhone---->
			<div class="col-sm-12">
				<div class="row">
					<div class="col-xs-4">
						<label class="Phone">電話 :</label>
					</div>
					<div class="col-xs-8">
						<input type="text" name="memPhone" id="memPhone"
							placeholder="請輸入電話" class="form-control "
							value="<%=(memberVO == null) ? "" : memberVO.getMemPhone()%>">
					</div>
				</div>
			</div>
			<!--- For memAddress---->
			<div class="col-sm-12">
				<div class="row">
					<div class="col-xs-4">
						<label class="Address">地址 :</label>
					</div>
					<div class="col-xs-8">
						<input type="text" name="memAddress" id="memAddress"
							placeholder="請輸入地址" class="form-control "
							value="<%=(memberVO == null) ? "" : memberVO.getMemAddress()%>">
					
					
					
					
					</div>
				</div>
			</div>
			<!--- For memEmail---->
			<div class="col-sm-12">
				<div class="row">
					<div class="col-xs-4">
						<label class="Email">email :</label>
					</div>
					<div class="col-xs-8">
						<input type="email" name="memEmail" id="memEmail"
							placeholder="請輸入email" class="form-control "
							value="<%=(memberVO == null) ? "" : memberVO.getMemEmail()%>">
					</div>
				</div>
			</div>
			<!--- For memPID---->
			<div class="col-sm-12">
				<div class="row">
					<div class="col-xs-4">
						<label class="PID">身分證字號 :</label>
					</div>
					<div class="col-xs-8">
						<input type="text" name="memPID" id="memPID"
							placeholder="請輸入身分證字號" class="form-control "
							value="<%=(memberVO == null) ? "" : memberVO.getMemPID()%>">
					</div>
				</div>
			</div>
			<!--- For memVatno---->
			<div class="col-sm-12">
				<div class="row">
					<div class="col-xs-4">
						<label class="Vatno">統一編號 :</label>
					</div>
					<div class="col-xs-8">
						<input type="text" name="memVatno" id="memVatno"
							placeholder="請輸入統一編號" class="form-control "
							value="<%=(memberVO == null) ? "" : memberVO.getMemVatno()%>">
					</div>
				</div>
			</div>
			<!--- For memHeadshot---->
			<div class="col-sm-12">
				<div class="row">
					<div class="col-xs-4">
						<label class="Headshot">個人頭像 :</label>
					</div>
					<div class="col-xs-8">
						<input type="file" name="memHeadshot" id="memHeadshot"
							class="form-control "
							value="<%=(memberVO == null) ? "" : memberVO.getMemHeadshot()%>">
					</div>
				</div>
			</div>
			<!-------------------->
			<input type="hidden" name="action" value="insert"> 
			<input type="submit" value="送出新增" class="btn btn-submit">
		</form>
	</div>


</body>
</html>