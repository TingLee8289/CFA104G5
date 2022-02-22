<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.member.model.*"%>

<%
    MemberService memberSvc = new MemberService();
    List<MemberVO> list = memberSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
     
<title>所有會員資料</title>

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
<body bgcolor='white'>

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
                            <div class="sb-sidenav-menu-heading">後台管理專區</div>
                            <a class="nav-link" href="index.html">
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
                                    <a class="nav-link" href="layout-static.html">審核房源</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">審核房東</a>
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
                                    <a class="nav-link" href="layout-static.html">退款審核</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">商品下架</a>
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
                                    <a class="nav-link" href="layout-static.html">管理服務檢舉</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">管理服務類別</a>
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
<!--                                     <a class="nav-link" href="layout-static.html">會員資料管理</a> -->
                                </nav>
                            </div>
<!-- ------------------------------------------------------------------------------------------------- -->
    
                        
                        </div>
                    </div>
                   
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">所有會員資料</h1>
                       

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>


<table>
	<tr>
		<th>會員ID</th>
		<th>帳號</th>
		<th>姓名</th>
		<th>會員狀態</th>
		<th>房東身份</th>
		<th>廠商身份</th>
		<th>賣家身份</th>
		<th>被檢舉數</th>
		<th>查看詳細資料</th>
<!-- 		<th>廠商被檢舉數</th> -->
<!-- 		<th>賣家被檢舉數</th> -->
		
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="memberVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${memberVO.memID}</td>
			<td>${memberVO.memUsername}</td>
			<td>${memberVO.memName}</td>
			<td>	
				<c:if test="${memberVO.memStatus == 0}">未驗證</c:if>
				<c:if test="${memberVO.memStatus == 1}">已驗證</c:if>
				<c:if test="${memberVO.memStatus == 2}">停權</c:if></td>		
			<td>
				<c:if test="${memberVO.memLandlord == 0}">未驗證</c:if>
				<c:if test="${memberVO.memLandlord == 1}">已驗證</c:if>
				<c:if test="${memberVO.memLandlord == 2}">停權</c:if></td>   
			<td>
				<c:if test="${memberVO.memSupplier == 0}">停權</c:if>
				<c:if test="${memberVO.memSupplier == 1}">啟用</c:if></td> 
			<td>
				<c:if test="${memberVO.memSeller == 0}">停權</c:if>
				<c:if test="${memberVO.memSeller == 1}">啟用</c:if></td>
		
		
			<td>${memberVO.memReported}</td>

			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/MemberServletUpdate.do" style="margin-bottom: 0px;">
			     <button id ="submit" onclick="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
			     <input type="hidden" name="memID"  value="${memberVO.memID}">
			     <input type="hidden" name="action"	value="getOneMem_Display"> </FORM>
			</td>
		</tr>
	</c:forEach>
</table>


<%@ include file="page2.file" %>
                    </div>
                </main>
               
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