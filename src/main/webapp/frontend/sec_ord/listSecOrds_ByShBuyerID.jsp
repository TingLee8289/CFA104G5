<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.sec_ord.model.*"%>
<%@ page import="java.util.*"%>

<jsp:useBean id="MemberSvc" scope="page"
	class="ezs.member.model.MemberService" />
<jsp:useBean id="SecOrdSvc" scope="page"
	class="ezs.sec_ord.model.SecOrdService" />
<%
Integer memID = (Integer) session.getAttribute("memID");
System.out.print(memID);
Set<SecOrdVO> listSecOrds_ByShBuyerID = SecOrdSvc.getSecOrdByShBuyerID(memID);
%>

<html>
<head>
<title>EASY SPACE</title>
<style>
table#table-2 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-2 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}

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
<style>
#nav {
	background-color: lightgrey;
	z-index: 9999;
	padding: 0px;
	height: 40px;
	width: 100%;
	position: fixed;
}

main{

}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/member.center.styles.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<link rel="stylesheet"
	href=" https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css ">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">


</head>
<body bgcolor='white'>
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
			<div class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">管理專區</div>
						<a class="nav-link"
							href="<%=request.getContextPath()%>/frontend/member/listOneMember.jsp">
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
								<a class="nav-link"
									href="<%=request.getContextPath()%>/frontend/ren_appointment/listRenAppByMEM.jsp">預約單管理</a>
								<a class="nav-link"
									href="<%=request.getContextPath()%>/frontend/ren_lease/MEMlistOneLease.jsp">租賃單管理</a>
								<a class="nav-link"
									href="<%=request.getContextPath()%>/frontend/ren_favorites/listOneRenFavorites.jsp">收藏房源管理</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-couch"></i>
							</div> 二手家電專區
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link"
									href="<%=request.getContextPath()%>/frontend/sec_ord/listSecOrds_ByShBuyerID.jsp">二手訂單管理</a>
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
								<a class="nav-link"
									href="<%=request.getContextPath()%>/frontend/ser_dmd/getByDmdMemID.jsp">需求單/報價單管理</a>
								<a class="nav-link"
									href="<%=request.getContextPath()%>/frontend/ser_ord/getOrdByMemID.jsp">服務訂單管理</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
					</div>
				</div>
			</div>
		</div>
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
	<main>
	<div>
		<h4>此頁練習採用 EL 的寫法取值:</h4>
		<table id="table-2">
			<tr>
				<td>
					<h3>買家會員訂單 - listSecOrds_ByShBuyerID.jsp</h3>
					<h4>
						<a
							href="<%=request.getContextPath()%>/frontend/sec_ord/listAllMember.jsp">回首頁</a>
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

		<table>
			<tr>
				<th>訂單ID</th>
				<th>買家ID</th>
				<th>賣家ID</th>
				<th>收件地址郵遞區號</th>
				<th>收件地址縣市</th>
				<th>收件地址鄉鎮區</th>
				<th>收件地址路街弄等</th>
				<th>付款方式</th>
				<th>訂單狀態</th>
				<th>訂單金額</th>
				<th>訂單日期</th>
				<th>賣家評價買家星數</th>
				<th>賣家評價買家內容</th>
				<th>買家評價賣家星數</th>
				<th>買家評價賣家內容</th>
				<th>撥款日期</th>
				<th>買家備註</th>
				<th>查看訂單明細</th>
				<th>完成訂單</th>
				<th>申請退款</th>
			</tr>

			<c:forEach var="secOrdVO" items="${listSecOrds_ByShBuyerID}">
				<tr>
					<td>${secOrdVO.shOrdID}</td>
					<td>${secOrdVO.shBuyerID}</td>
					<td>${secOrdVO.shSellerID}</td>
					<td>${secOrdVO.shPostcode}</td>
					<td>${secOrdVO.shCounty}</td>
					<td>${secOrdVO.shDist}</td>
					<td>${secOrdVO.shRoad}</td>
					<td>${secOrdVO.shPayment}</td>
					<td>${secOrdVO.shOrdStatus}</td>
					<td>${secOrdVO.shPrice}</td>
					<td>${secOrdVO.shDate}</td>
					<td>${secOrdVO.shBuyerScore}</td>
					<td>${secOrdVO.shBuyerTXT}</td>
					<td>${secOrdVO.shSellerScore}</td>
					<td>${secOrdVO.shSellerTXT}</td>
					<td>${secOrdVO.shAPPDate}</td>
					<td>${secOrdVO.shNotes}</td>
					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/sec_ord/SecOrdServlet.do"
							style="margin-bottom: 0px;">
							<input type="submit" value="查看訂單明細"> <input type="hidden"
								name="shOrdID" value="${secOrdVO.shOrdID}"> <input
								type="hidden" name="action" value="getSecOrdDetails">
						</FORM>
					</td>
					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/sec_ord/SecOrdServlet.do"
							style="margin-bottom: 0px;">
							<input type="submit" value="完成訂單"> <input type="hidden"
								name="secOrdID" value="${secOrdVO.shOrdID}"> <input
								type="hidden" name="action" value="completeOrder">
						</FORM>
					</td>
					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/sec_ord/SecOrdServlet.do"
							style="margin-bottom: 0px;">
							<input type="submit" value="申請退款"> <input type="hidden"
								name="secOrdID" value="${secOrdVO.shOrdID}"> <input
								type="hidden" name="action" value="refundOrder">
						</FORM>
					</td>
				</tr>
			</c:forEach>
		</table>

		<%
		if (request.getAttribute("listSecOrdDetails_ByShOrdID") != null) {
		%>
		<jsp:include page="listSecOrdDetails_ByShOrdID.jsp" />
		<%
		}
		%>
	</div>
	</main>
</body>
</html>