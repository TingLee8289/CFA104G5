<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_vdr.model.*"%>
<%-- <% session.setAttribute("memID", 1);%> --%>
<%
Integer memID = (Integer)session.getAttribute("memID");
SerVdrVO servdrVO = (SerVdrVO) request.getAttribute("servdrVO");
%>

<html>
<head>
 <script src="<%=request.getContextPath()%>/frontend/js/jquery-1.11.3.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>EASY SPACE</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

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

<style>
table {
	width: 550px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body>




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
	

	<table>
		<tr>
			<td>
				<h2>廠商資料新增</h2>
			</td>
			<td>
				<h4>
					<a href="serVdrHome.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" enctype="multipart/form-data"
		ACTION="InsertSerVdrServlet.do" name="form1">
		<table>
			<tr>
				<td>廠商編號:</td>
				<td><input type="TEXT" name="vdrID" size="45" value="${memID}" disabled /></td>
			</tr>
			<tr>
				<%-- <td>廠商狀態:</td>--%>

				<td><input type="hidden" name="vdrStatus" size="45" value="1" /></td>

			</tr>



			<tr>
				<td>廠商姓名:</td>
				<td><input type="TEXT" name="vdrName" size="45"
					value="<%=(servdrVO == null) ? "蔡英文" : servdrVO.getVdrName()%>" /></td>
			</tr>


			<tr>
				<td>廠商電話:</td>
				<td><input type="TEXT" name="vdrTel" size="45"
					value="<%=(servdrVO == null) ? "0944556889" : servdrVO.getVdrTel()%>" /></td>
			</tr>

			<tr>
				<td>廠商統一編號:</td>
				<td><input type="TEXT" name="vdrVatno" size="45"
					value="<%=(servdrVO == null) ? "" : servdrVO.getVdrVatno()%>" /></td>
			</tr>

			<tr>
				<td>縣市:</td>
				<td><input type="TEXT" name="vdrCounty" size="45"
					value="<%=(servdrVO == null) ? "台北市" : servdrVO.getVdrCounty()%>" /></td>
			</tr>

			<tr>
				<td>地區:</td>
				<td><input type="TEXT" name="vdrDist" size="45"
					value="<%=(servdrVO == null) ? "大安區" : servdrVO.getVdrDist()%>" /></td>
			</tr>


			<tr>
				<td>詳細地址:</td>
				<td><input type="TEXT" name="vdrAddr" size="45"
					value="<%=(servdrVO == null) ? "羅斯福路一段一號" : servdrVO.getVdrAddr()%>" /></td>
			</tr>


			<tr>
				<td>營業時間:</td>
				<td><input type="TEXT" name="vdrOpen" size="45"
					value="<%=(servdrVO == null) ? "8:00-18:00" : servdrVO.getVdrOpen()%>" /></td>
			</tr>


			<tr>
				<td>廠商簡介:</td>
				<td><input type="TEXT" name="vdrIntro" size="45"
					value="<%=(servdrVO == null) ? "哈囉!" : servdrVO.getVdrIntro()%>" /></td>
			</tr>
			
			
			<tr>
				<%-- <td>廠商評價人數:</td>--%>
				<td><input type="hidden" name="vdrRevCount" size="45"
					value="<%=(servdrVO == null) ? "0" : servdrVO.getVdrRevCount()%>" /></td>
			</tr>

			<tr>
				<%-- <td>廠商評價星數:</td>--%>
				<td><input type="hidden" name="vdrRevScore" size="45"
					value="<%=(servdrVO == null) ? "0" : servdrVO.getVdrRevScore()%>" /></td>
			</tr>

			<tr>
				<td>廠商圖片:</td>
				<td><input type="file" id="upfiles" name="vdrPic"
					accept="image/gif, image/jpeg, image/png" multiple="multiple" />
					<div id="previews">
						<p>圖片預覽</p>
					</div>
			</tr>

			

		</table>
		<br> 
		<input type="hidden" name="action" value="insert"> 
		<input type="submit" value="送出新增">
		<input type="hidden" name="vdrID" size="45" value="${memID}" />
	</FORM>
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


</body>

<script>
	// 	// // change這個event有只代表改變，並不代表有檔案。
	// 	// 	如果要FileReader去讀檔案，必須給他一個檔案Object。
	// 	// 	它拿到檔案Object後會驅動onload事件
	// 	// 	藉由 FileReader 物件，Web 應用程式能以非同步（asynchronously）方式讀取儲存在用戶端的檔案（或原始資料暫存）內容
	// 	// 裡面的input 就是我們丟進去的this，也就是<input type="file">，
	// 	// 當<input type="file">被DOM變成Object的時候，如果他有選擇到檔案，
	// 	// 會被放在input.files裡面，而且是一個Array(因為input如果寫成 <input type="file" multiple> 的時候是可以複選的)
	$("#upfiles").change(function() {
		$("#previews").html(""); // 清除預覽
		readURL(this);
	});
	function readURL(input) {
		if (input.files && input.files.length >= 0) {
			for (var i = 0; i < input.files.length; i++) {
				var reader = new FileReader();
				reader.onload = function(e) {
					var img = $("<img width='300' height='200'>").attr('src',
							e.target.result);
					$("#previews").append(img);
				}
				reader.readAsDataURL(input.files[i]);
			}
		} else {
			var noPictures = $("<p>目前沒有圖片</p>");
			$("#previews").append(noPictures);
		}
	}
</script>




</html>