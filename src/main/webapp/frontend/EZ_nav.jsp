<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EASY SPACE</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" href="favicon.ico">
	<link rel="stylesheet" href=" https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css ">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
	<style>
		#nav{
			background-color: lightgrey;
		}
		
	</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark  " id="nav" style="padding: 0px;">
		<div class="container">
<!-- 			<a class="navbar-brand" href="index.html"> <img -->
<%-- 				src=" <%=request.getContextPath() %>/images/cmn/index/bannerLogo.jpg" alt="UI Kit" --%>
<!-- 				style="width: 100px; height: 30px;"> -->
<!-- 			</a> -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03"
				aria-controls="navbarTogglerDemo03" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
				<ul class="navbar-nav ms-auto me-sm-2 mt-2 mt-lg-0">
					<li class="nav-item active me-3"><a class="nav-link text-dark" href="#">首頁
					</a></li>
					<li class="nav-item me-3"><a class="nav-link text-dark" href="#">租賃服務</a>
					</li>
					<li class="nav-item me-3"><a class="nav-link text-dark" href="#">二手家電</a>
					</li>
					<li class="nav-item me-3"><a class="nav-link text-dark" href="#">居家服務</a>
					</li>
					<li class="nav-item dropdown"><a class="nav-link text-dark" href="#"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <img
							class="rounded-circle u-box-shadow-sm me-2 text-dark" width="25"
							height="25" src=" https://dummyimage.com/100/007bff/efefef"
							alt="Htmlstream"> John Doe <i class="fa fa-angle-down   "></i>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">會員中心</a> <a
								class="dropdown-item" href="#">賣家中心</a> <a class="dropdown-item"
								href="#">聊聊</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">登出</a>
						</div></li>
				</ul>

			</div>
		</div>
	</nav>


	<section></section>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>