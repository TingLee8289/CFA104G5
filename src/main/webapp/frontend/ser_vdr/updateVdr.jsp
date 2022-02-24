<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_vdr.model.*"%>
<%-- <% session.setAttribute("memID", 1);%> --%>
<%
Integer memID = (Integer) session.getAttribute("memID");
SerVdrService serVdrSvc = new SerVdrService();
SerVdrVO serVdrVO = serVdrSvc.getoneSerVdr(memID);
// SerVdrVO serVdrVO = (SerVdrVO) request.getAttribute("serVdrVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
pageContext.setAttribute("serVdrVO", serVdrVO);
%>

<!DOCTYPE html>

<html>
<head>
<script src="<%=request.getContextPath()%>/frontend/js/jquery-1.11.3.min.js"></script>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>EASY SPACE</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/member.center.styles.css"	rel="stylesheet" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<link rel="stylesheet"href=" https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css ">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style>
#nav {
	background-color: lightgrey;
	z-index: 9999;
	padding: 0px;
	height: 40px;
	width: 100%;
	position: fixed;
}
</style>
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
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table {
    border: 0px groove #E0E0FF;
  }
  th, td {
    padding: 5px;
    text-align: left;
  }
</style>
<script src="https://kit.fontawesome.com/1c2ccc4859.js" crossorigin="anonymous"></script>

</head>
<body class="sb-nav-fixed">
	<!-- 上端導覽列開始--------------------------------------- -->
	<div class="navbar navbar-expand-lg navbar-dark" id="nav">
		<div class="container">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03"
				aria-controls="navbarTogglerDemo03" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
				<ul class="navbar-nav ms-auto me-sm-2 mt-2 mt-lg-0">
					<li class="nav-item active me-3"><a class="nav-link text-dark"
						href="<%=request.getContextPath()%>/frontend/EZ_home.jsp">首頁 </a></li>
					<li class="nav-item me-3"><a class="nav-link text-dark"
						href="#">租賃服務</a></li>
					<li class="nav-item me-3"><a class="nav-link text-dark"
						href="<%=request.getContextPath()%>/frontend/sec_items/secItemsViewPage.jsp">二手家電</a>
					</li>
					<li class="nav-item me-3"><a class="nav-link text-dark"
						href="<%=request.getContextPath()%>/frontend/ser_ad/serAdViewPage.jsp">居家服務</a>
					</li>

					<%
					String memUsername = (String) session.getAttribute("memUsername");

					if (memUsername != null) {
					%>
					<li class="nav-item dropdown"><a class="nav-link text-dark"
						href="#" id="navbarDropdown" role="button"
						data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <img
							class="rounded-circle u-box-shadow-sm me-2 text-dark" width="25"
							height="25" src=" https://dummyimage.com/100/007bff/efefef"
							alt="Htmlstream"> ${memUsername} <i
							class="fa fa-angle-down   "></i></a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/frontend/member/memberCenter/buyerMemberCenter.jsp">會員中心</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/frontend/member/memberCenter/sellerMemberCenter.jsp">賣家中心</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/frontend/chat/index.jsp">聊聊</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/frontend/sec_items/shoppingCart.jsp">購物車</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/member/MemberServlet.do?action=logout">登出</a>
						</div></li>
					<%
					} else {
					%>
					<li class="nav-item me-3"><a class="nav-link text-dark"
						href="<%=request.getContextPath()%>/frontend/member/login.jsp">登入</a></li>
					<%
					}
					%>
				</ul>

			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<!-- 上端導覽列結束--------------------------------------- -->

	<!-- 側邊導覽列開始--------------------------------------- -->

	

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<!-- ------------------------------------------------------------------------------------------------- -->
						<div class="sb-sidenav-menu-heading">賣家管理專區</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-home"></i>
							</div> 租賃相關管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								 <a class="nav-link" href="layout-static.html">申請成為房東</a>
                                    <a class="nav-link" href="layout-static.html">房源管理</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ren_appointment/listRenAppByLDD.jsp">預約單管理</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">租賃單管理</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-couch"></i>
							</div> 二手相關管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								  <a class="nav-link" href="<%=request.getContextPath()%>/frontend/sec_items/select_page.jsp">商品管理</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/sec_ord/listAllSecOrd.jsp">訂單管理</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages2" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-wrench"></i>
							</div> 服務相關管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages2"
							aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_vdr/update_SerVdr_input.jsp">成為廠商</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_vdr/listOneSerVdr.jsp">檢視廠商基本資料</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_ad/addSerAd.jsp">刊登服務</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_ad/listAllSerAd.jsp">檢視服務</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_quo/getQuoByVdrID.jsp">需求單管理</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_ord/findQuoBeforeByVdrID.jsp">新增訂單</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_ord/getOrdByVdrID.jsp">檢視訂單</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
					</div>
				</div>

			</nav>
		</div>
<!-- main 開始--------------------------------------------------------------------------------- -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
<!-- 塞頁面從這裡開始--------------------------------------------------------------------------------- -->






<%-- <html>
<head>
<script src="<%=request.getContextPath()%>/frontend/js/jquery-1.11.3.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>EASY SPACE</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head> --%>

<body>

	

	


	<h3>廠商資料修改:</h3>
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

	<FORM METHOD="post" enctype="multipart/form-data"
		ACTION="<%=request.getContextPath()%>/frontend/ser_vdr/UpdateSerVdrServlet.do"
		name="form1">
		<table>
			<tr>
				<td>廠商編號:<font color=red></font></td>

				<td>${serVdrVO.vdrID}</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td>廠商狀態:</td> -->
<%-- 				<td>${serVdrVO.vdrStatus}</td> --%>
				
<!-- 			</tr> -->
			<tr>
				<td>廠商姓名:</td>
				<td><input type="TEXT" name="vdrName" size="50" value="${serVdrVO.vdrName}" /></td>
			</tr>

			<tr>
				<td>廠商電話:</td>
				<td><input type="TEXT" name="vdrTel" size="50"
					value="${serVdrVO.vdrTel}" /></td>
			</tr>


			<tr>
				<td>廠商統一編號:</td>
				<td><input type="TEXT" name="vdrVatno" size="50"
					value="${serVdrVO.vdrVatno}" /></td>
			</tr>

			<tr>
				<td>縣市:</td>
				<td><input type="TEXT" name="vdrCounty" size="50"
					value="${serVdrVO.vdrCounty}" /></td>
			</tr>

			<tr>
				<td>地區:</td>
				<td><input type="TEXT" name="vdrDist" size="50"
					value="${serVdrVO.vdrDist}" /></td>
			</tr>

			<tr>
				<td>詳細地址:</td>
				<td><input type="TEXT" name="vdrAddr" size="50"
					value="${serVdrVO.vdrAddr}" /></td>
			</tr>

			<tr>
				<td>營業時間:</td>
				<td><input type="TEXT" name="vdrOpen" size="50"
					value="${serVdrVO.vdrOpen}" /></td>
			</tr>

			<tr>
				<td>廠商簡介:</td>
				<td>
				<textarea name="vdrIntro"rows="4" cols="50" value="${ serVdrVO.vdrIntro}"></textarea>
<%-- 					<input type="TEXT" name="vdrIntro" size="50" value="<%=serVdrVO.getVdrIntro()%>" /> --%>
				</td>
			</tr>

			<tr>
				<td>廠商圖片:</td>
				<td><input type="file" id="upfiles" name="vdrPic"
					accept="image/gif, image/jpeg, image/png" multiple="multiple" />
					<div id="previews">
						<p>圖片預覽</p>
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
		 <input type="hidden" name="vdrID" value="${serVdrVO.vdrID}">
		 <input	type="hidden" name="vdrStatus" value="1"> 
		 <input type="submit" value="送出修改">
	</FORM>
	
	
	
	

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

<!-- 塞頁面從這裡結束--------------------------------------------------------------------------------- -->
				</div>
			</main>
		</div>
<!-- main 結束--------------------------------------------------------------------------------- -->
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
	<script src="js/datatables-simple-demo.js"></script>

	<!-- 側邊導覽列結束--------------------------------------- -->
	<main></main>			
		
	
	



</body>




</html>