<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZSPACE</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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

/************* test ************/
header {
	border-bottom: 1px solid #c3894f;
}

.login-form {
	flex-grow: 1;
}

.sign-in-image-div {
	text-align: center;
	flex-basis: 50%; /*寫在img無效*/
}

.sign-in-image {
	width: 80%;
	margin: 0 auto;
}
</style>
</head>
<body>
	<div id="ezhome" class="">
		<header>
			<div class="container">
				<div class="navbar d-flex flex-nowrap py-5">
					<a href="#"> <img
						src="https://images.unsplash.com/photo-1523217582562-09d0def993a6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fGhvbWV8ZW58MHx8MHx8&auto=format&fit=crop&w=700&q=60"
						alt="brand-logo-image" class=" brand-logo" style="height: 130px">
					</a>
					<div class="function-link d-flex flex-column col-10 bd-highlight">
						<div
							class="pages-login d-flex flex-row align-items-center col-12 justify-content-between mx-auto">
							<ul
								class="nav nav-items justify-content-between align-items-center col-9">
								<li class="nav-item"><a class="nav-link" role="button"
									href="#">房屋租賃</a></li>
								<li class="nav-item"><a class="nav-link" href="#">居家服務</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">二手家電</a>
								</li>
							</ul>
							<div
								class="nav-menu-shopping-bag d-flex col-3 justify-content-sm-end  align-items-center">
								<a href="#"><i class="bi bi-cart3 mx-2"
									style="font-size: 3rem; color: #8C4E37;"></i></a> <a class="btn"
									href="#" role="button" style="background-color: #FD9843">會員登入</a>
									<%
						Object memberid = session.getAttribute("memID");
						out.println("getAttribute :" + memberid);
						%>
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

		<!--<main>
    <section>
      <div class="container">
        <div class="card-group my-5">
          <div class="card main-rent-a-space">
            <img src="https://imgs.gvm.com.tw/upload/gallery/20201016/75161_01.jpg" class="card-img-top" alt="rent-a-space-img" data-bs-toggle="tooltip" data-bs-placement="bottom" title="房屋租賃">

          </div>
          <div class="card">
            <img src="https://imgs.gvm.com.tw/upload/gallery/20201016/75161_01.jpg" class="card-img-top" alt="..." data-bs-toggle="tooltip" data-bs-placement="bottom" title="居家服務">

          </div>
          <div class="card">
            <img src="https://imgs.gvm.com.tw/upload/gallery/20201016/75161_01.jpg" class="card-img-top" alt="..." data-bs-toggle="tooltip" data-bs-placement="bottom" title="二手商城">

          </div>
        </div>
      </div>
    </section>
<!--   </main> -->
		<main>
			<div class="container">
				<div class="d-flex justify-content-center align-items-center">
					<div class="sign-in-image-div ">
						<img class="sign-in-image"
							src="https://images.unsplash.com/photo-1532987978747-aa9d644e3b2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDF8fGhvbWV8ZW58MHx8MHx8&auto=format&fit=crop&w=700&q=60"
							alt="log-in-image">
					</div>
					<section class="login-form">
						<form id="login-form" method="post" action="<%=request.getContextPath()%>/member/MemberServlet.do">
							<div
								class="form__content text-center login-page text-nowrap flex-nowrap p-5">
								<h4>
									<strong>EASY SPACE 會員登入</strong>
								</h4>
								<div class="form__row__panel form__info">
									<div class="form__row mt-3">
										<input id="account" type="text" class="form-control w-100"
											placeholder="帳號" name="name">
									</div>
									<div class="form__row mt-3">
										<input id="inputPassword" type="password"
											class="form-control w-100" placeholder="密碼" name="psw">
									</div>
								</div>
								<div class="form__control__btn__panel d-flex flex-column"
									id="btn-control">
									<div class="form__row">
									<input type="hidden" name="action" value="getOne_For_Display">
										<input type ="submit" class="btn btn-warning w-100 mt-3 ml-4" value="登入按鈕">
									</div>
									<div class="form__row d-flex justify-content-between">
										<button class="btn btn-outline-warning mt-3"
											style="background-color: #C3894F; color: white">註冊</button>
											<%-- 錯誤表列 --%>
											<c:if test="${not empty errorMsgs}">
												<front style="color: red">請修正以下錯誤:</front>
												<ul>
													<c:forEach var="message" items="${errorMsgs}">
														<p style="color: red">${message}</p>
													</c:forEach>
												</ul>
											</c:if>
<%-- 											<a href="<%=request.getContextPath()%>/frontend/member/resetpassword.jsp"></a> --%>
										<button class="btn btn-outline-warning mt-3"
											style="background-color: #C3894F; color: white" onclick="location.href="<%=request.getContextPath()%>/frontend/member/resetpassword.jsp">
											忘記密碼</button>
									</div>
								</div>
							</div>

						</form>
					</section>
				</div>
			</div>
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
								<li><a href="#">空間租賃</a></li>
								<li><a href="#">空間服務</a></li>
								<li><a href="#">二手交易商城</a></li>

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
</body>
</html>