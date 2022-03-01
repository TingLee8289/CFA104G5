<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>EASY SPACE</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<link rel="stylesheet"
	href=" https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css ">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
</head>
<body>
<jsp:include page="/frontend/EZ_nav.jsp"/>
	<nav class="navbar navbar-light bg-white  navbar-expand-md " style="padding-top: 45px;">
		<div class="container">
			<div class="text-left" style="padding:20px;">
				<a href="<%= request.getContextPath()%>/frontend/EZ_home.jsp"> <img src="<%=request.getContextPath() %>/images/cmn/index/EASYSPACE.png" height="100px" alt="image">
				</a>
			</div>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target=".navbar-collapse-1" aria-controls="navbarNav6"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div
				class="collapse navbar-collapse col-md-8 navbar-collapse-1">
				<ul
					class="nav nav-pills nav-pills-primary justify-content-center mb-5"
					role="tablist">
					<li class="nav-item me-md-4"><a
						class="nav-link nav-icon rounded p-3 shadow-sm active show"
						id="home-tab" data-toggle="tab" href="#home" role="tab"
						aria-controls="home" aria-selected="true" style="height: 45px;"> <i
							class=" far fa-gem fa-lg  me-2"></i> 房屋租賃
					</a></li>
					<li class="nav-item me-md-4"><a
						class="nav-link nav-icon rounded p-3 shadow-sm" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false" style="height: 45px;"> <i
							class="fab fa-html5 fa-lg me-2"></i> 居家服務
					</a></li>
					<li class="nav-item me-md-4"><a
						class="nav-link nav-icon p-3 shadow-sm" id="contact-tab"
						data-toggle="tab" href="#contact" role="tab"
						aria-controls="contact" aria-selected="false" style="height: 45px;"> <i
							class="fa fa-suitcase fa-lg me-2"></i> 二手商城
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
<!-- 	Search Bar 開始-->
		<div>
			<form class="form-noborder" style="left: 178px; position: absolute; top: 130px;">
				<div class="row mb-5 justify-content-center">
					<div class="col-lg-8 col-sm-12 form-group" style="width: 650px; padding: 0 10px 0 0;">
						<input class="form-control form-control-lg"
							placeholder="Search keyword" type="text" style="font-size: 10px; width: 620px; margin-left: 40px"/>
					</div>
		
					<div class="col-lg-3 col-sm-12 form-group" style="width:100px">
						<button class="btn btn-primary" type="submit" style="font-size:15px;">搜尋</button>
					</div>
				</div>
			</form>
		</div>
<!-- 	Search Bar 結束-->
	<section class="pt-5">
		<div class="container">
			<div class="row d-flex justify-content-center p-5">
				<div class="col-md-12">
					<div class=" ">


						<div class="tab-content    " id="myTabContent">
							<div class="tab-pane fade active show" id="home" role="tabpanel"
								aria-labelledby="home-tab">
								<div class="row row-grid">
									<div class="col-6  my-1">
										<img
											src="https://images.unsplash.com/photo-1472289065668-ce650ac443d2?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=a31064bea3004e5cc8f4ac7d82d5b31b"
											alt="" class="img-fluid rounded img-rised">
									</div>
									<div class="col-6 my-1">
										<img
											src="https://images.unsplash.com/photo-1432888498266-38ffec3eaf0a?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=facb007f2ae21929c7bd6391d713b9b2"
											alt="" class="img-fluid rounded img-rised">
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="profile" role="tabpanel"
								aria-labelledby="profile-tab">
								<div class="row row-grid">
									<div class="col-6  my-1">
										<img
											src="https://images.unsplash.com/photo-1498075702571-ecb018f3752d?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=9525c58ae827191a9da8dafa137bb215"
											alt="" class="img-fluid rounded img-rised">
									</div>
									<div class="col-6 my-1">
										<img
											src="https://images.unsplash.com/3/doctype-hi-res.jpg?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=36e78819951713de55caa1409e5c4f43"
											alt="" class="img-fluid rounded img-rised">
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="contact" role="tabpanel"
								aria-labelledby="contact-tab">
								<div class="row row-grid">
									<div class="col-6  my-1">
										<img
											src="https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=7a53b590be20029171f12780a6347ca0"
											alt="" class="img-fluid rounded img-rised">
									</div>
									<div class="col-6 my-1">
										<img
											src="https://images.unsplash.com/photo-1493932484895-752d1471eab5?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=26019c8c8a3ab1e052bb3e38cd6004dc"
											alt="" class="img-fluid rounded img-rised">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="mb-0 mt-0">
		<div class="footer ">
			<div class="     pt-5 pb-5">
				<div class="container">
					<div class="row  ">
						<div class="col-xs-6 col-sm-3">
							<a href="#"> <svg class="d-block mb-4" width="36" height="36"
									viewBox="0 0 612 612" xmlns="http://www.w3.org/2000/svg"
									focusable="false">
                    <path fill="currentColor"
										d="M510 8a94.3 94.3 0 0 1 94 94v408a94.3 94.3 0 0 1-94 94H102a94.3 94.3 0 0 1-94-94V102a94.3 94.3 0 0 1 94-94h408m0-8H102C45.9 0 0 45.9 0 102v408c0 56.1 45.9 102 102 102h408c56.1 0 102-45.9 102-102V102C612 45.9 566.1 0 510 0z">
                    </path>
                    <path fill="currentColor"
										d="M196.77 471.5V154.43h124.15c54.27 0 91 31.64 91 79.1 0 33-24.17 63.72-54.71 69.21v1.76c43.07 5.49 70.75 35.82 70.75 78 0 55.81-40 89-107.45 89zm39.55-180.4h63.28c46.8 0 72.29-18.68 72.29-53 0-31.42-21.53-48.78-60-48.78h-75.57zm78.22 145.46c47.68 0 72.73-19.34 72.73-56s-25.93-55.37-76.46-55.37h-74.49v111.4z">
                    </path>
                  </svg>
							</a>
							<address class="color-light-20">
								EASY SPACE<br>
								320 桃園市中壢區復興路46號9樓
							</address>
							<ul class="list-unstyled list-light">
								<li><a href="#">Disclaimer</a></li>
							</ul>
						</div>
						<div class="col-xs-6 col-sm-3">
							<h4 class="my-2">Product</h4>
							<ul class="list-unstyled list-light text-light">
								<li><a class=" " href="#">Pricing</a></li>
								<li><a href="#">Features</a></li>
								<li><a href="#">Customers</a></li>
								<li><a href="#">Store</a></li>
							</ul>
						</div>
						<br style="clear: both" class="hidden-sm-up">
						<div class="col-xs-6 col-sm-3">
							<h4 class="my-2">CFA104G5</h4>
							<ul class="list-unstyled list-light">
								<li><a href="#">李宛庭</a></li>
								<li><a href="#">楊慈旻</a></li>
								<li><a href="#">劉冠鳴</a></li>
								<li><a href="#">林孟蓉</a></li>
								<li><a href="#">謝豐睿</a></li>
								<li><a href="#">陳富津</a></li>
								<li><a href="#">賴傳韻</a></li>
								<li><a href="#">巫詠琳</a></li>
							</ul>
						</div>
						<div class="col-xs-6 col-sm-3">
							<h4 class="my-2">Connect</h4>
							<ul class="list-unstyled list-light">
								<li><a href="#">Support</a></li>
								<li><a href="#">Social</a></li>
								<li><a href="#">Community</a></li>
							</ul>
							<p class="color-light mt-2">Stay up-to-date!</p>
							<form>
								<div class="input-group mb-3">
									<input type="text" class="form-control form-control-sm"
										placeholder="Email" aria-label="Email"
										aria-describedby="basic-addon2">
									<button class="btn btn-white btn-sm" type="button">OK</button>
								</div>
							</form>
						</div>
					</div>
					<hr>
					<div class="row f-flex justify-content-between">
						<div class="col-md-8 text-xs-center  text-left   my-1">
							<p class="mt-2  text-muted">
								© Copyright 2022 • All Rights Reserved | <a class=" " href="#">Disclaimer</a>
								| <a class=" " href="#">Contact</a>
							</p>
						</div>
						<div class="col-md-4 text-xs-center   text-lg-right   my-1">
							<div class="btn-container  mt-1 text-md-end text-sm-center">
								<div class="mb-1 mr-3 align-self-right pt-0 d-inline-block">
									<a href="#" role="button"
										class=" btn-white p-2 m-2 btn btn-round btn-rised btn-icon x">
										<i class="fab fa-twitter fa-lg color-light" aria-hidden="true"></i>
									</a> <a href="#" role="button"
										class="btn-white p-2 m-2 btn btn-round btn-rised btn-icon ">
										<i class="fab fa-facebook fa-lg" aria-hidden="true"></i>
									</a> <a href="#" role="button"
										class="btn-white p-2 m-2 btn btn-round btn-rised btn-icon  ">
										<i class="fab fa-linkedin fa-lg" aria-hidden="true"></i>
									</a> <a href="#" role="button"
										class="btn-white p-2 m-2 btn btn-rised btn-round btn-icon  ">
										<i class="fab fa-google-plus fa-lg" aria-hidden="true"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-popRpmFF9JQgExhfw5tZT4I9/CI5e2QcuUZPOVXb1m7qUmeR2b50u+YFEYe1wgzy"
		crossorigin="anonymous"></script>


</body>
</html>