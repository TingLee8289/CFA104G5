<%@page import="ezs.ren_listing.model.RenListingService"%>
<%@page import="ezs.member.model.MemberService"%>
<%@page import="ezs.ren_landlord.model.RenLandlordService"%>
<%@page import="ezs.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ren_appointment.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	Integer aptMemId = (Integer)session.getAttribute("memID");
	RenAppointmentService renAppSvc = new RenAppointmentService();
    List<RenAppointmentVO> list = renAppSvc.getAllMEM(aptMemId);
    pageContext.setAttribute("list",list);
 
%>

<jsp:useBean id="memSvc" scope="page" class="ezs.member.model.MemberService" />
<jsp:useBean id="renLDDSvc" scope="page" class="ezs.ren_landlord.model.RenLandlordService" />
<jsp:useBean id="renLisSvc" scope="page" class="ezs.ren_listing.model.RenListingService" />


<html>
<head>
<script src="https://kit.fontawesome.com/1c2ccc4859.js" crossorigin="anonymous"></script>
<title>EASY SPACE</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" integrity="sha256-46qynGAkLSFpVbEBog43gvNhfrOj+BmwXdxFgVK/Kvc=" crossorigin="anonymous" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>   
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
    vertical-align: middle;
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
    vertical-align: middle;
  }
</style>
<script src="https://kit.fontawesome.com/1c2ccc4859.js" crossorigin="anonymous"></script>

    
   
<style>
    #test{
        color: white;
        background-color: #212529;
        border-color: #32383e;
        text-align: center;
        vertical-align: middle;
    }
        
    table td {
        text-align: center;
        vertical-align: middle;
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

<div class="container">
	    <div class="row">
		    <table class="table table-hover table-striped">
		        <thead>
		        <tr class="thead-dark">

		<th>預約訂單編號</th>
		<th>房東</th>
		<th>房東評分</th>
		<th>房源</th>
		<th>預約單狀態</th>
		<th>預約時間</th>
		<th>確認</th>
		<th>修改</th>
		<th>取消預約</th>
		<th>刪除預約單</th>
	</tr></thead>
	
	<tbody>
	<c:forEach var="renAppointmentVO" items="${list}">
		<tr align='center' valign='middle'>
			<td>${renAppointmentVO.aptId}</td>		
			
			<td><c:forEach var="renLDDVO" items="${renLDDSvc.all}">
                    <c:if test="${renAppointmentVO.aptLddId==renLDDVO.lddId}">
                    	<c:forEach var="memVO" items="${memSvc.all}">
                    	 <c:if test="${memVO.memID==renLDDVO.lddMemId}">
	                    【${memVO.memID}】 - ${memVO.memUsername}
	                    </c:if> </c:forEach>
                    </c:if> </c:forEach>
			</td>
			<td><c:forEach var="renLDDVO" items="${renLDDSvc.all}">
					<c:if test="${renAppointmentVO.aptLddId==renLDDVO.lddId}">
                    	<c:forEach var="memVO" items="${memSvc.all}">
                    		<c:if test="${memVO.memID==renLDDVO.lddMemId}">
                    		<c:choose>
								<c:when test="${(memVO.memRedCount) == 0}">尚無評分</c:when>
							<c:otherwise>
								<fmt:formatNumber type="number" maxFractionDigits="1" 
									value="${(memVO.memRedScore/memVO.memRedCount)}"/>
							</c:otherwise></c:choose></c:if> </c:forEach> </c:if> </c:forEach></td>
			
			<td><c:forEach var="renLisVO" items="${renLisSvc.all}">
                    <c:if test="${renAppointmentVO.aptLisId==renLisVO.lisID}">
	                    【${renLisVO.lisID}】 - ${renLisVO.lisTitle}
                    </c:if>
                </c:forEach>
			</td>
			
			<td>
				<c:if test="${renAppointmentVO.aptStatus == 0}">預約確認中</c:if> 
				<c:if test="${renAppointmentVO.aptStatus == 1}">已確認預約</c:if>
				<c:if test="${renAppointmentVO.aptStatus == 2}">已取消</c:if>
				<c:if test="${renAppointmentVO.aptStatus == 3}">預約時間已變更</c:if>
			</td>
			
			<td>${renAppointmentVO.aptTime}</td>		
				
			<td>
			<c:if test="${renAppointmentVO.aptStatus != 2 and renAppointmentVO.aptStatus != 1}">
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" style="margin-bottom: 0px;">
<!-- 					<input type="submit" value="確認"> 			 -->
					<input type="hidden" name="aptId" value="${renAppointmentVO.aptId}"> 
					<input type="hidden" name="aptMemId" value="${renAppointmentVO.aptMemId}"> 
					<input type="hidden" name="aptLddId" value="${renAppointmentVO.aptLddId}"> 
					<input type="hidden" name="aptLisId" value="${renAppointmentVO.aptLisId}"> 
					<input type="hidden" name="aptStatus" value="${renAppointmentVO.aptStatus}"> 
					<input type="hidden" name="aptTime" value="${renAppointmentVO.aptTime}"> 
					<input type="hidden" name="action" value="MemConfirm">
					<button id ="submit" onclick="submit"><i class="fa-solid fa-check"></i></button> 
				</FORM></c:if>
			</td>
			<td>
			<c:if test="${renAppointmentVO.aptStatus != 2}">
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" style="margin-bottom: 0px;">
<!-- 					<input type="submit" value="修改">  -->
					<input type="hidden" name="aptId" value="${renAppointmentVO.aptId}"> 
					<input type="hidden" name="action" value="getOne_For_Update">
					<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
					<button id ="submit" onclick="submit"><i class="fa-solid fa-pen-to-square"></i></button> 
				</FORM></c:if>
			</td>
			<td><c:if test="${renAppointmentVO.aptStatus != 2}">
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" style="margin-bottom: 0px;">
<!-- 					<input type="submit" value="取消預約">  -->
					<input type="hidden" name="aptId" value="${renAppointmentVO.aptId}"> 
					<input type="hidden" name="aptMemId" value="${renAppointmentVO.aptMemId}"> 
					<input type="hidden" name="aptLddId" value="${renAppointmentVO.aptLddId}"> 
					<input type="hidden" name="aptLisId" value="${renAppointmentVO.aptLisId}"> 
					<input type="hidden" name="aptStatus" value="${renAppointmentVO.aptStatus}"> 
					<input type="hidden" name="aptTime" value="${renAppointmentVO.aptTime}"> 
					<input type="hidden" name="action" value="MemCancel">
					<button id ="submit" onclick="submit"><i class="fa-solid fa-xmark"></i></button> 
				</FORM></c:if>
			</td>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" style="margin-bottom: 0px;">
<!-- 					<input type="submit" value="刪除預約單">  -->
					<input type="hidden" name="aptId" value="${renAppointmentVO.aptId}"> 
					<input type="hidden" name="action" value="delete">
					<button id ="submit" onclick="submit"><i class="fa-solid fa-trash"></i></button> 
				
				</FORM>
			</td>
		</tr>
	</c:forEach>
</tbody></table></div>
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