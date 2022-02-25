<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.sec_ord.model.*"%>
<!DOCTYPE html>

<html>
<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>EASY SPACE</title>
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

</head>
<body class="sb-nav-fixed">
	<!-- 嚙磕嚙豎橘蕭嚙踝蕭C嚙罷嚙締--------------------------------------- -->
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
						href="<%=request.getContextPath()%>/frontend/EZ_home.jsp">嚙踝蕭嚙踝蕭 </a></li>
					<li class="nav-item me-3"><a class="nav-link text-dark"
						href="#">嚙踝蕭嚙踝蕭A嚙踝蕭</a></li>
					<li class="nav-item me-3"><a class="nav-link text-dark"
						href="<%=request.getContextPath()%>/frontend/sec_items/secItemsViewPage.jsp">嚙瘦嚙踝蕭a嚙緬</a>
					</li>
					<li class="nav-item me-3"><a class="nav-link text-dark"
						href="<%=request.getContextPath()%>/frontend/ser_ad/serAdViewPage.jsp">嚙羯嚙窮嚙璀嚙踝蕭</a>
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
								href="<%=request.getContextPath()%>/frontend/member/memberCenter/buyerMemberCenter.jsp">嚙罵嚙踝蕭嚙�</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/frontend/member/memberCenter/sellerMemberCenter.jsp">嚙踝蕭a嚙踝蕭嚙踝蕭</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/frontend/chat/index.jsp">嚙踝蕭嚙�</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/frontend/sec_items/shoppingCart.jsp">嚙褊迎蕭嚙踝蕭</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/member/MemberServlet.do?action=logout">嚙緯嚙碼</a>
						</div></li>
					<%
					} else {
					%>
					<li class="nav-item me-3"><a class="nav-link text-dark"
						href="<%=request.getContextPath()%>/frontend/member/login.jsp">嚙緯嚙皚</a></li>
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

	<!-- 嚙磕嚙豎橘蕭嚙踝蕭C嚙踝蕭嚙踝蕭--------------------------------------- -->

	<!-- 嚙踝蕭嚙踝蕭嚙踝蕭嚙瘠嚙罷嚙締--------------------------------------- -->

	

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<!-- ------------------------------------------------------------------------------------------------- -->
						<div class="sb-sidenav-menu-heading">嚙踝蕭a嚙豬理嚙瞎嚙踝蕭</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-home"></i>
							</div> 嚙踝蕭嚙踝蕭嚙踝蕭嚙豬理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								 <a class="nav-link" href="layout-static.html">嚙諉請佗蕭嚙踝蕭嚙請東</a>
                                    <a class="nav-link" href="layout-static.html">嚙請瘀蕭嚙豬理</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ren_appointment/listRenAppByLDD.jsp">嚙緩嚙踝蕭嚙豬理</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">嚙踝蕭嚙踝蕭嚙豬理</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-couch"></i>
							</div> 嚙瘦嚙踝蕭嚙踝蕭嚙豬理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								  <a class="nav-link" href="<%=request.getContextPath()%>/frontend/sec_items/select_page.jsp">嚙諉品嚙豬理</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/sec_ord/listAllSecOrd.jsp">嚙緬嚙踝蕭瑊z</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages2" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-wrench"></i>
							</div> 嚙璀嚙褓穿蕭嚙踝蕭瑊z
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages2"
							aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.html">嚙璀嚙褓管理</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">嚙豎求嚙踝蕭瑊z</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">嚙緬嚙踝蕭瑊z</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
					</div>
				</div>

			</nav>
		</div>
<!-- main 嚙罷嚙締--------------------------------------------------------------------------------- -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
<!-- 嚙趟頁嚙踝蕭嚙緬嚙緻嚙諒開嚙締--------------------------------------------------------------------------------- -->


	<h3>嚙踝蕭a嚙緬嚙踝蕭s嚙踝蕭嚙範嚙踝蕭:</h3>

	<%-- 嚙踝蕭~嚙踝蕭C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">嚙請修伐蕭嚙瘡嚙磊嚙踝蕭~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>


	<jsp:useBean id="secOrdSvc" scope="page"
		class="ezs.sec_ord.model.SecOrdService" />
		
		

<li>
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sec_ord/GetSecOrdBySellerServlet.do">
			<b><font color=blue>嚙踝蕭颩q嚙踝蕭s嚙踝蕭:</font></b> 
			<select size="1" name="shOrdID">
			<c:forEach var="secOrdVO" items="${secOrdSvc.all}">
				<option value="${secOrdVO.shOrdID}">${secOrdVO.shOrdID}
			</c:forEach>
			</select> <input type="submit" value="嚙箴嚙碼"> <input type="hidden"
				name="action" value="getOne_For_Display">
		</FORM>

	</li>




		<h3>嚙踝蕭a嚙緬嚙踝蕭d嚙踝蕭:</h3>
	

	<ul>
	<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sec_ord/GetSecOrdBySellerServlet.do" style="margin-bottom: 0px;">
			    <input type="submit" value="嚙踝蕭a嚙緬嚙踝蕭d嚙踝蕭"> 
			    <input type="hidden" name="shSellerID" value="${memberVO.memID}">
			    <input type="hidden" name="action" value="listSecOrd_ByShSellererID"></FORM>
			</td>

	</ul>
<!-- 嚙趟頁嚙踝蕭嚙緬嚙緻嚙諒蛛蕭嚙踝蕭--------------------------------------------------------------------------------- -->
				</div>
			</main>
		</div>
<!-- main 嚙踝蕭嚙踝蕭--------------------------------------------------------------------------------- -->
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

	<!-- 嚙踝蕭嚙踝蕭嚙踝蕭嚙瘠嚙踝蕭嚙踝蕭--------------------------------------- -->
	<main></main>
</body>
</html>
