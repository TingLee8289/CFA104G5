<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ezs.ren_appointment.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
RenAppointmentVO renAppointmentVO = (RenAppointmentVO) request.getAttribute("renAppointmentVO");
%>
<jsp:useBean id="memSvc" scope="page" class="ezs.member.model.MemberService" />
<jsp:useBean id="renLDDSvc" scope="page" class="ezs.ren_landlord.model.RenLandlordService" />
<jsp:useBean id="renLisSvc" scope="page" class="ezs.ren_listing.model.RenListingService" />


<html>
<head>
<title>EASY SPACE</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" integrity="sha256-46qynGAkLSFpVbEBog43gvNhfrOj+BmwXdxFgVK/Kvc=" crossorigin="anonymous" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>   
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/member.center.styles.css"	rel="stylesheet" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<link rel="stylesheet"href=" https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css ">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">

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

<style>
        #test{
         color: white;
            background-color: #212529;
            border-color: #32383e;
            text-align: center;
        }
        
        table td {
        text-align: center;
        }
        </style>   
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



			<h3>預約訂單資料</h3>
			<h5><a href="frontend/ren_appointment/listRenAppByMEM.jsp">回預約單首頁</a></h5>
	
	 <div class="container">
	    <div class="row">
		    <table class="table table-hover table-striped">	
		<tr>
			<th id="test">預約訂單編號:</th>
			<td><%=renAppointmentVO.getAptId()%></td>
		</tr>
		<tr>	
			<th id="test">預約會員:</th>
			<td><c:forEach var="memVO" items="${memSvc.all}">
					<c:if test="${renAppointmentVO.aptMemId==memVO.memID}">
	                    【${memVO.memID}】 - ${memVO.memUsername}
                    </c:if></c:forEach></td>
		</tr>
		<tr>
			<th id="test">房東:</th>
			<td><c:forEach var="renLDDVO" items="${renLDDSvc.all}">
					<c:if test="${renAppointmentVO.aptLddId==renLDDVO.lddId}">
						<c:forEach var="memVO" items="${memSvc.all}">
							<c:if test="${memVO.memID==renLDDVO.lddMemId}">
		                    【${memVO.memID}】 - ${memVO.memUsername}
	                    </c:if></c:forEach></c:if></c:forEach></td>
		</tr>
		<tr>
			<th id="test">房源:</th>
			<td><a href="<%=request.getContextPath()%>/frontend/ren_listing/GetOneRenListingServlet.do?lisID=${renAppointmentVO.aptLisId}&action=getOne_For_Display_A">
		
			<c:forEach var="renLisVO" items="${renLisSvc.all}">
					<c:if test="${renAppointmentVO.aptLisId==renLisVO.lisID}">
	                    【${renLisVO.lisID}】 - ${renLisVO.lisTitle}
                    </c:if></c:forEach></a></td>
		</tr>
		<tr>
			<th id="test">預約單狀態:</th>
			<td>
				<c:if test="${renAppointmentVO.aptStatus == 0}">預約確認中</c:if> 
				<c:if test="${renAppointmentVO.aptStatus == 1}">已確認預約</c:if> 
				<c:if test="${renAppointmentVO.aptStatus == 2}">已取消</c:if>
				<c:if test="${renAppointmentVO.aptStatus == 3}">預約時間已變更</c:if></td>
		</tr>
		<tr>
			<th id="test">預約時間:</th>
			<td><c:set value="${renAppointmentVO.aptTime}" var="dateString" />
			<fmt:parseDate value="${dateString}" var="dateObject"
                pattern="yyyy-MM-dd HH:mm" />
                <fmt:formatDate value="${dateObject}" pattern="yyyy-MM-dd HH:mm" /></td>
		</tr>
		</table>
		</div>
    </div>

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