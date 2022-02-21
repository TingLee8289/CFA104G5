<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>EASY SPACE會員專區</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">EASY SPACE</a>
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
                            <div class="sb-sidenav-menu-heading">會員資料管理</div>
                            <a class="nav-link" href="index.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                會員資料修改
                            </a>
<!-- ------------------------------------------------------------------------------------------------- -->
                            <div class="sb-sidenav-menu-heading">買家管理</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                                租屋訂單管理
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">預約單管理</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">租賃訂單管理</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">收藏房源</a>
                                </nav>
                            </div>
<!-- ------------------------------------------------------------------------------------------------- -->
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-couch"></i></div>
                                二手訂單管理
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">完成訂單</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">取消訂單</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">申請退款</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">完成付款</a>
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
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/member/memberCenter/memberCenterMemDmd.jsp">需求單管理</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">估價單管理</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">訂單管理</a>
                                </nav>
                            </div>
<!-- ------------------------------------------------------------------------------------------------- -->
                            <div class="sb-sidenav-menu-heading">賣家管理</div>
                              <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages5" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-user-circle"></i></div>
                                租賃管理
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages5" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="">申請房東</a>
                                    <a class="nav-link" href="">房源管理</a>
                                    <a class="nav-link" href="">租賃單管理</a>
                                    <a class="nav-link" href="">預約單管理</a>
                                   
                                </nav>
                            </div>
                            
                             <!-- ------------------------------------------------------------------------------------------------- -->
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages4" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-user-circle"></i></div>
                                二手管理
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages4" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<%=request.getContextPath()%>/backend/member/listAllMember.jsp">訂單管理</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/backend/member/listAllMember.jsp">商品管理</a>
                                </nav>
                            </div>
          
           
                             
                             
          <!-- ------------------------------------------------------------------------------------------------- -->
                             <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages6" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-wrench"></i></div>
                                居家服務
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages6" aria-labelledby="headingSix" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">估價單管理</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">訂單管理</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">服務項目管理</a>
                                </nav>
                        	</div>
                        	<!-- ------------------------------------------------------------------------------------------------- -->
                    </div>
                   
                </nav>
            </div>
            <main>
            
            
            
            
            
            
            </main>
               
                
                
                
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
           
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>

