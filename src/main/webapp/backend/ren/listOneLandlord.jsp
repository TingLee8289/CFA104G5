<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ren_landlord.model.*"%>
<%@ page import="ezs.member.model.*"%>
<%@ page import="java.util.*"%>


<%
MemberService memberSvc = new MemberService();
List<MemberVO> list2 = memberSvc.getAll();
pageContext.setAttribute("list2", list2);
%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
RenLandlordVO renLandlordVO = (RenLandlordVO) request.getAttribute("renLandlordVO");
%>

<html>

<head>

 <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
         <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

  
<title>EASY SPACE後台管理系統</title>


<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css"
	integrity="sha256-46qynGAkLSFpVbEBog43gvNhfrOj+BmwXdxFgVK/Kvc="
	crossorigin="anonymous" />

<title>EASY SPACE</title>

</head>
<style>
#cssTable td 
{
    vertical-align: middle;
}
</style>

 <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="<%=request.getContextPath()%>/backend/index.jsp">EASY SPACE</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">設定</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">登出</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">後台管理專區</div>
                            <a class="nav-link" href="<%=request.getContextPath()%>/backend/adminEmp/adminEmp.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                員工管理
                            </a>
<!-- ------------------------------------------------------------------------------------------------- -->
                            <div class="sb-sidenav-menu-heading">前台管理專區</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                                房屋租賃管理
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<%=request.getContextPath()%>/backend/index.jsp">審核房源</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/backend/ren/select.jsp">審核房東</a>
                                </nav>
                            </div>
<!-- ------------------------------------------------------------------------------------------------- -->
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-couch"></i></div>
                                二手家電管理
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<%=request.getContextPath()%>/backend/index.jsp">退款審核</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/backend/sec_items/secitems.jsp">商品下架</a>
                                </nav>
                            </div>
<!-- ------------------------------------------------------------------------------------------------- -->
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages2" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-wrench"></i></div>
                                居家服務管理
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages2" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link"
									href="<%=request.getContextPath()%>/backend/ser/ser_repo/select_page.jsp">服務檢舉管理</a>
								<a class="nav-link"
									href="<%=request.getContextPath()%>/backend/ser/ser_cla/select_page.jsp">服務類別管理</a>
								<a class="nav-link"
									href="<%=request.getContextPath()%>/backend/ser/serAd/select_page.jsp">刊登服務管理</a>
                                </nav>
                            </div>
<!-- ------------------------------------------------------------------------------------------------- -->
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages3" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-user-circle"></i></div>
                                會員管理
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages3" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<%=request.getContextPath()%>/backend/member/listAllMember.jsp">會員資料管理</a>
                                </nav>
                            </div>
<!-- ------------------------------------------------------------------------------------------------- -->
    
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                       
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">房東資料</h1></div>

	
				<h4>
					<a href="<%=request.getContextPath()%>/backend/ren/select.jsp"><img
						src="<%=request.getContextPath()%>/images/ren/back_icon.png"
						width="60" height="60" border="0">回首頁</a>
				</h4>
<div class="container">
					<div class="row">
						<table class="table table-hover table-striped" id="cssTable">
							<thead>
								<tr class="thead-dark" style="text-align: left;">
									
			<th>房東編號</th>
			<th>會員編號</th>
			<th>會員名稱</th>
			<th>審核狀態</th>
		</tr>
		</thead>
							<tbody>
		<tr>
			<td><%=renLandlordVO.getLddId()%></td>
			<td><%=renLandlordVO.getLddMemId()%></td>
					<td>
		<c:forEach var="memberVO" items="${list2}">
		<c:if test="${renLandlordVO.lddMemId == memberVO.memID}">${memberVO.memName}</c:if>
		</c:forEach>
		</td>	
			<td><c:if test="${renLandlordVO.lddApproval == 0}"><c:out value="審核中"/></c:if>
			<c:if test="${renLandlordVO.lddApproval == 1}"><c:out value="審核未過"/></c:if>
			<c:if test="${renLandlordVO.lddApproval == 2}"><c:out value="審核已過"/></c:if>
			</td></tr>
	</tbody>
	</table>
	</div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; EASY SPACE 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
  

</body>
</html>