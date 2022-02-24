<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<%@ page import="ezs.ser_vdr.model.*"%>
<%@ page import="ezs.ser_ad.model.*"%>
<%@ page import="ezs.ser_cla.model.*"%>
<%
SerVdrService serVdrSvc = new SerVdrService();
List<SerVdrVO> serVdrList = serVdrSvc.getAll();
pageContext.setAttribute("serVdrList", serVdrList);

SerAdService serAdSvc = new SerAdService();
List<SerAdVO> serAdList = serAdSvc.getAll();
pageContext.setAttribute("serAdList", serAdList);

SerClaService serClaSvc = new SerClaService();
List<SerClaVO> serClaList = serClaSvc.getAll();
pageContext.setAttribute("serClaList", serClaList);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>EASY SPACE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=yes">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
* {
	box-sizing: border-box;
}

:root { -
	-header-height: 60px; -
	-aside-width: 180px;
}

body {
	margin: 0;
}

img {
	max-width: 100%;
	max-height: 100%
}

/* ==================== header 區域 ==================== */

/* ==================== aside 區域 ==================== */
aside.aside {
	border: 1px solid blue;
	position: fixed;
	top: var(- -header-height) +100px;
	left: 0;
	height: calc(100% - var(- -header-height));
	width: var(- -aside-width);
	background-color: #ecb88a;
	overflow-y: auto;
	padding: 20px 0;
	transition: all 1s;
}

aside.aside button.btn_hamburger {
	display: none;
}

@media screen and (max-width: 767px) {
	aside.aside {
		top: 0;
		height: 100%;
		transform: translateX(-100%);
	}
	aside.aside.-on {
		transform: translateX(0%);
	}
	header.header button.btn_hamburger, aside.aside button.btn_hamburger {
		display: inline-block;
	}
}

aside.aside>nav.nav>ul.nav_list {
	margin: 0;
	padding: 0;
	list-style: none;
}

aside.aside>nav.nav>ul.nav_list>li>a {
	display: inline-block;
	border: 1px solid lightblue;
	width: 100%;
	padding: 3px 10px;
}

/* ==================== main 區域 ==================== */
main.main {
	border: 1px solid red;
	margin-left: var(- -aside-width);
	width: calc(100% - var(- -aside-width));
	padding: 20px;
	background-color: hsl(34, 100%, 84%);
	min-height: calc(100vh - var(- -header-height));
	transition: all 1s;
}

body {
	background-color: #ecb88a;
}

* {
	margin: 0;
	padding: 0;
}

.card {
	outline: 2px solid black;
	margin-left: 120px;
}



.right-side {
	outline: 2px solid red;
}



.bottom {
	outline: 2px solid green;
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

<jsp:include page="/frontend/EZ_nav.jsp" />
	<!-- 	header 開始------------------------------------------------------ -->
	
	<!-- 	header 結束------------------------------------------------------ -->
	<!-- 	側邊欄 開始-------------------------------------------------------- -->
	<aside class="aside">
		<nav class="nav">
			<button type="button" class="btn_hamburger">按鈕</button>
			<ul class="nav_list">
				<c:forEach var="serClaVO" items="${serClaList}">
					<li>
						<form method="get" action="<%=request.getContextPath() %>/ser_ad/getAdBySerClaID.do">
							<button type="submit" id="Cla${serClaVO.serClaID}">${serClaVO.serClaName}</button>
							<input type="hidden" name="serClaID" value="${serClaVO.serClaID}">
						</form>
					</li>
				</c:forEach>
			</ul>
		</nav>
	</aside>
	<!-- 	側邊欄 結束-------------------------------------------------------- -->
	<!-- 	main 開始-------------------------------------------------------- -->

	<main class="main">

		<c:forEach var="serAdVO" items="${serAdVO}">

			<div class="container">
				<div class="card d-flex row flex-row p-4" style="min-width: 800px;">
					<div class="company-img col-3">
						
						<img class="img img-fluid"
							<c:forEach var="serVdrVO" items="${serVdrList}">
							 <c:if test="${serAdVO.adVdrID==serVdrVO.vdrID}">
							 src="<%=request.getContextPath()%>/ser_vdr/DBGifReader4.do?vdr_id=${serVdrVO.vdrID}"
                    		</c:if>
						</c:forEach >
							
							alt="company-logo">
					</div>
					<div class="right-side col-9 d-flex flex-column">
						<div
							class="upper p-2 mb-5 d-flex flex-row justify-content-between">
							<div class="company-info fs-5">
								<h2 class="text-nowrap">
									<c:forEach var="serVdrVO" items="${serVdrList}">
							 			<c:if test="${serAdVO.adVdrID==serVdrVO.vdrID}">
	                   						 ${serVdrVO.vdrName}
                    					</c:if>
									</c:forEach >
								</h2>
								<!-- ${companies[0].companyName} -->
								<div>
									<span class="me-1"><strong>5.0</strong></span> <i
										class="bi bi-star-fill" style="color: Gold;"></i> <i
										class="bi bi-star-fill" style="color: Gold;"></i> <i
										class="bi bi-star-fill" style="color: Gold;"></i> <i
										class="bi bi-star-fill" style="color: Gold;"></i> <i
										class="bi bi-star-fill" style="color: Gold;"></i> <i
										class="bi bi-star-fill" style="color: Gold;"></i> <span
										class="ms-1">(27)</span>
								</div>
								<div>
									<i class="bi bi-trophy">服務地區:${serAdVO.adDist}</i> 
								</div>
								<div>
									<i class="bi bi-check-circle-fill" style="color: DodgerBlue;">
									<c:forEach var="serVdrVO" items="${serVdrList}">
							 			<c:if test="${serAdVO.adVdrID==serVdrVO.vdrID}">
	                   						 服務時間:${serVdrVO.vdrOpen}
                    					</c:if>
									</c:forEach >
									</i>
								</div>
								<span class="badge rounded-pill bg-info">活躍專家</span>
							</div>
							<div class="contact fs-5 text-end">
								<div>
									<i class="bi bi-chat bg-light"></i>
								</div>
								<p class="text-nowrap"></p>
							</div>
						</div>
						<div
							class="bottom p-2 d-flex flex-row align-items-end justify-content-between">
							<div class="p-2 w-70 company-profile d-inline-block text-truncate" style="max-width: 500px;">
								<p class="text-nowrap">${serAdVO.adTxt}</p>
							</div>
							<a href="<%=request.getContextPath()%>/frontend/ser_quo/addSerQuo.jsp?quoVdrID=${serAdVO.adVdrID}" class="btn btn-outline-success text-nowrap">投遞需求單</a>
						</div>

					</div>
				</div>
			</div>

			</c:forEach>
		









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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
      $(function(){

        $("button.btn_hamburger").on("click", function(){
          $("aside.aside").toggleClass("-on");
        });
		
        console.log(location.href.indexOf('serAdViewPage.jsp'));
        if(location.href.indexOf('serAdViewPage.jsp') > -1) {
        	$("#Cla1").trigger('click');
        }
      });
</script>
	

	<!-- 	main 結束-------------------------------------------------------- -->
</body>
</html>