<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_dmd.model.*"%>
<% 
	Integer memID = (Integer) session.getAttribute("memID");
%>


<%
SerDmdVO serDmdVO = (SerDmdVO) request.getAttribute("serDmdVO"); 
//SerDmdServlet.java (Concroller) 存入req的serDmdVO物件 (包括幫忙取出的serDmdVO, 也包括輸入資料錯誤時的serDmdVO物件)
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>EASY SPACE</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/member.center.styles.css"	rel="stylesheet" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<link rel="stylesheet"href=" https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css ">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<script src="<%=request.getContextPath()%>/frontend/js/jquery-1.11.3.min.js"></script>
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
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
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
						href="<%=request.getContextPath()%>/frontend/ren_listing/listingView.jsp">租賃服務</a></li>
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

						<div class="sb-sidenav-menu-heading">管理專區</div>
						<a class="nav-link" href="<%= request.getContextPath()%>/frontend/member/listOneMember.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 會員資料管理
						</a>
						<!-- ------------------------------------------------------------------------------------------------- -->
						<div class="sb-sidenav-menu-heading">買家管理專區</div>
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
								<a class="nav-link" href="<%=request.getContextPath()%>/frontend/ren_appointment/listRenAppByMEM.jsp">預約單管理</a>
								<a class="nav-link" href="<%=request.getContextPath()%>/frontend/ren_lease/MEMlistOneLease.jsp">租賃單管理</a>
                                <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ren_favorites/listOneRenFavorites.jsp">收藏房源管理</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-couch"></i>
							</div> 二手家電管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=request.getContextPath()%>/sec_ord/SecOrdServlet.do?action=listSecOrd_ByShBuyerID">二手訂單管理</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages2" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-wrench"></i>
							</div> 居家服務專區
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages2"
							aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_dmd/addSerDmd.jsp">新增需求單</a>
								<a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_dmd/getByDmdMemID.jsp">需求單/報價單管理</a>
                                <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_ord/getOrdByMemID.jsp">服務訂單管理</a>
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
<div style="text-align: center">
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
</div>




<FORM METHOD="post" enctype="multipart/form-data" ACTION="<%=request.getContextPath()%>/ser_dmd/UpdateSerDmdServlet.do" name="form1">
<table>
	<tr>
		<td>需求單ID:</td>
		<td><input type="TEXT" name="dmdID" size="8" value="<%= serDmdVO.getDmdID() %>" disabled /></td>
	</tr>
<!-- 	<tr> -->
		
<%-- 		<td><input type="hidden" name="dmdStatus" size="8" value="<%= serDmdVO.getDmdStatus() %>" /></td> --%>
<!-- 	</tr> -->
	
	<jsp:useBean id="serClaSvc" scope="page" class="ezs.ser_cla.model.SerClaService" />
	<tr>
		<td>服務類別:</td>
		<td>
			<c:forEach var="serClaVO" items="${serClaSvc.all}">
				<c:if test="${serDmdVO.dmdSerClaID==serClaVO.serClaID}">
					${serClaVO.serClaName}
				</c:if>
			</c:forEach>
		<input type="hidden" name="dmdSerClaID" size="8" value="<%= serDmdVO.getDmdSerClaID() %>"/>
		</td>
	</tr>
	<tr>
		<td>需求人姓名:</td>
		<td><input type="TEXT" name="dmdName" 
			 value="<%= serDmdVO.getDmdName() %>"/></td>
	</tr>
	<tr>
		<td>需求人電話:</td>
		<td><input type="TEXT" name="dmdTel" 
			 value="<%=  serDmdVO.getDmdTel() %>"/></td>
	</tr>
	<tr>
		<td>需求人信箱:</td>
		<td><input type="EMAIL" name="dmdMail" size="20" value="<%=  serDmdVO.getDmdMail() %>"/></td>
	</tr>
	<tr>
		<td>案場縣市:</td>
		<td><input type="TEXT" name="dmdCounty" size="20"
			 value="<%= serDmdVO.getDmdCounty() %>"/></td>
	</tr>
	<tr>
		<td>案場地區:</td>
		<td><input type="TEXT" name="dmdRegion" size="20"
			 value="<%= serDmdVO.getDmdRegion() %>"/></td>
	</tr>
	<tr>
		<td>案場詳細地址:</td>
		<td><input type="TEXT" name="dmdAddress" size="50"
			 value="<%= serDmdVO.getDmdAddress() %>"/></td>
	</tr>
	<tr>
		<td>空間類別:</td>
		<td><input type="TEXT" name="dmdSpaceClass" size="20"
			 value="<%= serDmdVO.getDmdSpaceClass() %>"/></td>
	</tr>
	<tr>
		<td>坪數:</td>
		<td><input type="TEXT" name="dmdSquare" 
			 value="<%= serDmdVO.getDmdSquare() %>"/></td>
	</tr>
	<tr>
		<td>預算:</td>
		<td><input type="TEXT" name="dmdBudget" 
			 value="<%= serDmdVO.getDmdBudget() %>"/></td>
	</tr>
	<tr>
		<td>需求簡介:</td>
		<td>
				<textarea name="dmdIntro"rows="4" cols="50" >${serDmdVO.dmdIntro}</textarea>
		
		</td>
	</tr>
	<tr>
		<td>照片:</td>
		<td>
			<input type="file" name="dmdPic" id="upfiles" accept="image/gif, image/jpeg, image/png" multiple="multiple"/>
		<div id="previews">
			<p>圖片預覽</p>
		</div>
	</tr>
	<tr>
	<td>
	
<input type="submit" value="送出修改">
	</td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="dmdID" value="<%=serDmdVO.getDmdID()%>">
<input type="hidden" name="dmdStatus" size="8" value="<%= serDmdVO.getDmdStatus() %>" />
<input type="hidden" name="dmdMemID" size="8" value="<%= serDmdVO.getDmdMemID() %>"/>
<input type="hidden" name="dmdSerClaID" size="8" value="<%= serDmdVO.getDmdSerClaID() %>"/>

</FORM>

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