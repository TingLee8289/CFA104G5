<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZ_SPACE</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">
* {
	box-sizing: border-box;
}

html, body {
	width: 100%;
	height: 100%;
}

body {
	background-color: #ecb88a;
}

.container {
	width: 90%;
	min-width: 768px;
	font-size: 1.2rem;
}

footer {
	background-color: #fecba1;
}

.nav-link {
	/* 去除超連結的線 */
	color: #666666;
}

.nav-item>a, a {
	/*  去除連結線 */
	text-decoration: none;
	color: #373c3f;
}

.nav-item>a:hover, a:hover {
	color: #31a0b7;
}

header {
	outline: 1px solid black;
}
</style>
</head>
<body>
	<div id="ezhome" class="">
		<header>
			<div class="container">
				<div class="navbar d-flex flex-nowrap py-3">
					<a href="#"> <img
						src="<%= request.getContextPath()%>/images/cmn/index/EASYSPACE.png"
						alt="brand-logo-image" class=" brand-logo" style="height: 130px">
					</a>
					<div class="function-link d-flex flex-column col-10 bd-highlight">
						<div
							class="pages-login d-flex flex-row align-items-center col-12 justify-content-between mx-auto">
							<ul
								class="nav nav-items justify-content-between align-items-center col-9">
								<li class="nav-item">
									<a class="nav-link" role="button" href="#">房屋租賃</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#">居家服務</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#">二手家電</a>
								</li>
								
								<li class="nav-item">
									<a class="nav-link" href="#">會員中心</a>
								</li>
								
							</ul>
							<div class="nav-menu-shopping-bag d-flex col-3 justify-content-sm-end  align-items-center">
								
								<a href="#"><i class="bi bi-cart3 mx-2"
									style="font-size: 3rem; color: #8C4E37;"></i></a> <a class="btn"
									href="#" role="button" style="background-color: #FD9843">會員登入</a>
							</div>

						</div>
						<form class="form-inline col-12 mx-auto mt-3">
							<div class="input-group">
								<input type="text" name="keyword" class="form-control"
									id="searchinput" aria-describedby="search-input"
									placeholder="Search" value="">
								<button type="submit" class="btn btn-primary "
									id="search-button" style="background-color: #1AA179">開始搜尋</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</header>

		<main>
			<section>
				<div class="container">
					<div class="card-group my-5">
						<div class="card">
							<img
								src="https://images.unsplash.com/photo-1554995207-c18c203602cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGludGVyaW9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
								class="card-img-top" alt="..." data-bs-toggle="tooltip"
								data-bs-placement="bottom" title="房屋租賃" style="height: 100%">

						</div>
						<div class="card">
							<img
								src="https://media.istockphoto.com/photos/emergency-emergency-plumber-call-picture-id1296737106?b=1&k=20&m=1296737106&s=170667a&w=0&h=LxktlA5vroADLiZfbU9h3F2v8vSB4lhQVEB93EVSELw="
								class="card-img-top" alt="..." data-bs-toggle="tooltip"
								data-bs-placement="bottom" title="居家服務" style="height: 100%">

						</div>
						<div class="card">
							<img
								src="https://media.istockphoto.com/photos/energy-efficiency-of-home-kitchen-appliances-concept-picture-id1301959047?b=1&k=20&m=1301959047&s=170667a&w=0&h=zNfwslJxQYuWrU3pjtZdu7QbCgoVjAr_znVRBPVjVEQ="
								class="card-img-top" alt="..." data-bs-toggle="tooltip"
								data-bs-placement="bottom" title="二手家電" style="height: 100%">

						</div>
					</div>
				</div>
			</section>
		</main>

		<footer>
			<section class="ccc website-map pt-5">
				<div class="container">
					<div class="row">
						<div class="footer-company-address col-xs-6 col-sm-3">
							<address class="color-light-20">
								1600 Amphitheatre Parkway <br> Mountain View, CA 94043
							</address>
						</div>
						<div class="footer-about-us col-xs-6 col-sm-3">
							<h4 class="my-2">關於我們</h4>
							<ul class="list-unstyled list-light text-light">
								<li><a href="#">品牌故事</a></li>
								<li><a href="#">最新消息</a></li>
								<li><a href="#">連絡我們</a></li>
							</ul>
						</div>
						<br style="clear: both" class="hidden-sm-up">
						<div class="footer-service col-xs-6 col-sm-3">
							<h4 class="my-2">功能服務</h4>
							<ul class="list-unstyled list-light">
								<li><a href="#">房屋租賃</a></li>
								<li><a href="#">居家服務</a></li>
								<li><a href="#">二手家電</a></li>

							</ul>
						</div>
						<div class="footer-center col-xs-6 col-sm-3">
							<h4 class="my-2">會員中心</h4>
							<ul class="list-unstyled list-light">
								<li><a href="#">會員註冊</a></li>
								<li><a href="#">忘記密碼</a></li>
							</ul>
						</div>
					</div>
					<hr>
					<div class="footer-copyright row f-flex justify-content-between">
						<div class="col-md-8 text-xs-center text-left my-1">
							<p class="mt-1 text-muted">
								© Copyright 2021 • All Rights Reserved | <a class=" " href="#">Disclaimer</a>
								| <a class=" " href="#">Contact</a>
							</p>
						</div>
					</div>
				</div>
			</section>
			<section class="kkkk company-mail pt-3 bg-gray">
				<div class="container">
					<div class="row text-center justify-content-center">
						<div class="col-12 col-md-8 col-lg-7">
							<p class="text-h2">support@website.com</p>
							<p class="text-h3">Fusce dapibus, tellus ac cursus commodo,
								tortor mauris condimentum nibh, ut fermentum massa justo sit
								amet risus.</p>
						</div>
					</div>
				</div>
			</section>
		</footer>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>