<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_vdr.model.*"%>

<%
SerVdrVO serVdrVO = (SerVdrVO) request.getAttribute("serVdrVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
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
	width: 1000px;
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



	

	<table >
		<tr>
			<td>
			
				<h4>
					<a href="<%=request.getContextPath()%>/backend/ser/serVdr/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料修改:</h3>

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
		ACTION="<%=request.getContextPath()%>/ser_vdr/BackUpdateSerVdrServlet.do"
		name="form1">
		<table>
			<tr>
				<td>廠商編號:<font color=red><b>*</b></font></td>

				<td><%=serVdrVO.getVdrID()%></td>
			</tr>
			<tr>
				<td>廠商狀態:</td>
				<td>
				<input type="radio" name="vdrStatus" value="0"<%=(serVdrVO.getVdrStatus() == 0) ? "checked" : ""%> />停權 
				<input type="radio" name="vdrStatus" value="1" <%=(serVdrVO.getVdrStatus() == 1) ? "checked" : ""%> />正常
				</td>
			</tr>
			<tr>
				<td>廠商姓名:</td>
				<td><%=serVdrVO.getVdrName()%></td>
			</tr>

			<tr>
				<td>廠商電話:</td>
				<td><%=serVdrVO.getVdrTel()%></td>
			</tr>


			<tr>
				<%-- <td>廠商統一編號:</td>--%>
				<td><input type="hidden" name="vdrVatno" size="50"
					value="${serVdrVO.getVdrVatno()}" /></td>
			</tr>

			<tr>
				<td>縣市:</td>
				<td><%=serVdrVO.getVdrCounty()%></td>
			</tr>

			<tr>
				<td>地區:</td>
				<td><%=serVdrVO.getVdrDist()%></td>
			</tr>

			<tr>
				<td>詳細地址:</td>
				<td><%=serVdrVO.getVdrAddr()%></td>
			</tr>

			<tr>
				<td>營業時間:</td>
				<td><%=serVdrVO.getVdrOpen()%></td>
			</tr>

			<tr>
				<td>廠商簡介:</td>
				<td><%=serVdrVO.getVdrIntro()%></td>
			</tr>

			<tr>
				<td>廠商圖片:</td>
				<td><input type="file" id="upfiles" name="vdrPic"
					accept="image/gif, image/jpeg, image/png" multiple="multiple" />
					<div id="previews">
					
					</div> </td>
			</tr>

			<tr>
				<%-- <td>廠商評價人數:</td> --%>
				<td><input type="hidden" name="vdrRevCount" size="50"
					value="<%=serVdrVO.getVdrRevCount()%>" /></td>
			</tr>

			<tr>
				<%-- <td>廠商評價星數:</td>--%>
				<td><input type="hidden" name="vdrRevScore" size="50"
					value="<%=serVdrVO.getVdrRevScore()%>" /></td>
			</tr>




		</table>
		<br>
		 <input type="hidden" name="action" value="update"> 
		 <input type="hidden" name="vdrID" value="<%=serVdrVO.getVdrID()%>">
		 <input type="hidden" name="vdrName" value="<%=serVdrVO.getVdrName()%>">
		 <input type="hidden" name="vdrTel" value="<%=serVdrVO.getVdrTel()%>">
		 <input type="hidden" name="vdrCounty" value="<%=serVdrVO.getVdrCounty()%>">
		 <input type="hidden" name="vdrDist" value="<%=serVdrVO.getVdrDist()%>">
		 <input type="hidden" name="vdrAddr" value="<%=serVdrVO.getVdrAddr()%>">
		 <input type="hidden" name="vdrOpen" value="<%=serVdrVO.getVdrOpen()%>">
		 <input type="hidden" name="vdrIntro" value="<%=serVdrVO.getVdrIntro()%>">
		 
		 
		 <input type="submit" value="送出修改">
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
	

	<script>
		$("#upfiles").change(function() {
			$("#errorMessage").html(""); // 清除錯誤訊息
			$("#previews").html(""); // 清除預覽
			readURL(this);
		});

		function readURL(input) {
			if (input.files && input.files.length >= 0) {
				for (var i = 0; i < input.files.length; i++) {
					var reader = new FileReader();
					reader.onload = function(e) {
						var img = $("<img width='143' height='100'>").attr(
								'src', e.target.result);
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


</body>




</html>