<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>EASY SPACE</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<style>
body {
	font-family: "Lato", sans-serif;
}

.main-head {
	height: 150px;
	background: #FFF;
}

.sidenav {
	height: 100%;
	background-color: #000;
	overflow-x: hidden;
}

#login {
	height: 200px;
}

.main {
	padding: 0px 10px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
}

@media screen and (max-width: 450px) {
	.login-form {
		margin-top: 10%;
	}
	.register-form {
		margin-top: 10%;
	}
}

@media screen and (min-width: 768px) {
	.main {
		margin-left: 40%;
	}
	.sidenav {
		width: 40%;
		position: fixed;
		z-index: 1;
		top: 0;
		left: 0;
	}
	.login-form {
		margin-top: 80%;
	}
	.register-form {
		margin-top: 20%;
	}
}

.login-main-text {
	margin-top: 20%;
	padding: 60px;
	color: #fff;
}

.login-main-text h2 {
	font-weight: 300;
}

.btn-black {
	background-color: #000 !important;
	color: #fff;
}
</style>
</head>
<body>
	<div class="sidenav">
		<img alt=""
			src="<%=request.getContextPath()%>/images/cmn/member/login_pic.png"
			id=login>
		<div class="login-main-text">
			<h2>EASY SPACE</h2>
			<p>Easy Life</p>
		</div>
	</div>
	<div class="main">
		<div class="col-md-6 col-sm-12">
			<div class="login-form">
				<form method="post"
					action="<%=request.getContextPath()%>/member/MemberServlet.do">
					<div class="form-group">
						<label>User Name Gwen02</label> <input type="text" name="name"
							class="form-control" placeholder="User Name">
					</div>
					<div class="form-group">
						<label>Password gwen02</label> <input type="password" name="psw"
							class="form-control" placeholder="Password">
					</div>

					<div>
						<%
						Object memusername = session.getAttribute("memUsername");
						out.println("getAttribute :" + memusername);
						%>
					</div>


					<%-- 錯誤表列 --%>
					<c:if test="${not empty errorMsgs}">
						<font style="color: red">請修正以下錯誤:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<p style="color: red">${message}</p>
							</c:forEach>
						</ul>
					</c:if>

					<input type="hidden" name="action" value="getOne_For_Display">
					<input type="submit" class="btn btn-black" value="登入">
				</form>

				<form method="post"
					action="<%=request.getContextPath()%>/frontend/member/memberRegister.jsp">
					<input type="submit" class="btn btn-secondary" value="會員註冊">
				</form>
				<form method="post">
					<input type="submit" class="btn btn-black" value="忘記密碼">
				</form>
			</div>
		</div>
	</div>
</body>
</html>