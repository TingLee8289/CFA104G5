<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%--JSTL標籤宣告 --%>

<html>
<head>
<title>Easy Space 廠商</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style>


table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

</head>
<body>
	<header>
		<div class="container">
			<div class="navbar d-flex flex-nowrap py-3">
				<a href="#"> <img
					src="<%=request.getContextPath()%>/images/cmn/index/EASYSPACE.png"
					alt="brand-logo-image" class=" brand-logo" style="height: 130px">
				</a>
				<div class="function-link d-flex flex-column col-10 bd-highlight">
					<div
						class="pages-login d-flex flex-row align-items-center col-12 justify-content-between mx-auto">
						<ul
							class="nav nav-items justify-content-between align-items-center col-9">
							<li class="nav-item"><a class="nav-link" role="button"
								href="#">房屋租賃</a></li>
							<li class="nav-item"><a class="nav-link" href="#">居家服務</a></li>
							<li class="nav-item"><a class="nav-link" href="#">二手家電</a></li>
						</ul>
						<div
							class="nav-menu-shopping-bag d-flex col-3 justify-content-sm-end  align-items-center">
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
							<button type="submit" class="btn btn-primary " id="search-button"
								style="background-color: #1AA179">開始搜尋</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</header>
	<table>
		<tr>
			<td>

			</td>
			<td>
				<h4>
					<a href="serVdrHome.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>
<br>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
	
	<li>
			<FORM METHOD="post" ACTION="GetSerVdrServlet.do">
				<b>輸入廠商編號 (例如:1):</b> <input type="text" name="vdrID"> <input
					type="hidden" name="action" value="getOne_For_Display"> <input
					type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="serVdrSvc" scope="page"
			class="ezs.ser_vdr.model.SerVdrService" />

		<li>
			<FORM METHOD="post" ACTION="GetSerVdrServlet.do">
				<b>選擇廠商編號:</b> <select size="1" name="vdrID">
					<c:forEach var="serVdrVO" items="${serVdrSvc.all}">
						<option value="${serVdrVO.vdrID}">${serVdrVO.vdrID}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>


		<li>
			<FORM METHOD="post" ACTION="GetSerVdrServlet.do">
				<b>選擇廠商姓名:</b> <select size="1" name="vdrID">
					<c:forEach var="serVdrVO" items="${serVdrSvc.all}">
						<option value="${serVdrVO.vdrID}">${serVdrVO.vdrName}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		</ul>
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
							tortor mauris condimentum nibh, ut fermentum massa justo sit amet
							risus.</p>
					</div>
				</div>
			</div>
		</section>
	</footer>


</body>
</html>