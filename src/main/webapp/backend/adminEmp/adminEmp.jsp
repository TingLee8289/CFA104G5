<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.admin_emp.model.*"%>
<%@ page import="java.util.*"%>
<%@page import="ezs.admin_func.model.AdminFuncService"%>
<%@page import="ezs.admin_func.model.AdminFuncVO"%>
<jsp:useBean id="adminFunSvc" scope="page"
	class="ezs.admin_func.model.AdminFuncService" />

<%
AdminEmpService admSvc = new AdminEmpService();
List<AdminEmpVO> list = admSvc.getAll();
pageContext.setAttribute("list", list);
// System.out.print(list);
%>
<%
AdminFuncService admfSvc = new AdminFuncService();
List<AdminFuncVO> funList = admfSvc.getAll();
pageContext.setAttribute("funList", funList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/styles.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>員工管理</title>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3"
			href="<%=request.getContextPath()%>/backend/index.jsp">EASY SPACE</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">設定</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="#!">登出</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">後台管理專區</div>
						<a class="nav-link"
							href="<%=request.getContextPath()%>/backend/adminEmp/adminEmp.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 員工管理
						</a>
						<!-- ------------------------------------------------------------------------------------------------- -->
						<div class="sb-sidenav-menu-heading">前台管理專區</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-home"></i>
							</div> 房屋租賃管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link"
									href="<%=request.getContextPath()%>/backend/index.jsp">審核房源</a>
								<a class="nav-link"
									href="<%=request.getContextPath()%>/backend/ren/select.jsp">審核房東</a>
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
								<a class="nav-link"
									href="<%=request.getContextPath()%>/backend/index.jsp">退款審核</a>
								<a class="nav-link"
									href="<%=request.getContextPath()%>/backend/sec_items/secitems.jsp">商品下架</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages2" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-wrench"></i>
							</div> 居家服務管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages2"
							aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link"
									href="<%=request.getContextPath()%>/backend/index.jsp">管理服務檢舉</a>
								<a class="nav-link"
									href="<%=request.getContextPath()%>/backend/index.jsp">管理服務類別</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages3" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-user-circle"></i>
							</div> 會員管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages3"
							aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link"
									href="<%=request.getContextPath()%>/backend/member/listAllMember.jsp">會員資料管理</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->

					</div>
				</div>
				<div class="sb-sidenav-footer"></div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">員工管理</h1>
				</div>
				<table>
					<tr>
						<th>管理員ID</th>
						<th>管理員帳號</th>
						<th>管理員密碼</th>
						<th>管理員狀態</th>
						<th>管理員權限</th>

					</tr>
					<%@ include file="page1.file"%>
					<c:forEach var="adminEmpVO" items="${list}" begin="<%=pageIndex%>"
						end="<%=pageIndex+rowsPerPage-1%>">
						<tr>
							<td>${adminEmpVO.admID}</td>
							<td>${adminEmpVO.admUsername}</td>
							<td>${adminEmpVO.admPassword}</td>
							<td>${adminEmpVO.admStatus}</td>

							<!-- 				<td> -->
							<%-- 				<c:forEach var="adminPrivVO" items="${adminEmpVO.authlist}"> --%>
							<%-- 						<br>${adminFunSvc.getoneAdminFunc(adminPrivVO.funID).funName} --%>
							<%-- 					</c:forEach> --%>
							<!-- 				</td> -->
							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/admin_priv/AdminPrivServlet.do"
								style="margin-bottom: 0px;">
								<td><c:forEach var="funElment" items="${funList}">
										<%-- 					<input type=hidden name="${funElment.funName}" value="${funElment.funID}" checked> --%>
										<br>

										<c:set var="check" value="0" />
										<c:forEach var="adminPrivVO" items="${adminEmpVO.authlist}">
											<c:if test="${adminPrivVO.funID == funElment.funID }">
												<c:set var="check" value="1" />
											</c:if>
										</c:forEach>

										<c:if test="${ check == 1 }">
											<input type="checkbox" name="funID"
												value="${funElment.funID}" checked> ${funElment.funName}
					</c:if>
										<c:if test="${ check != 1 }">
											<input type="checkbox" name="funID"
												value="${funElment.funID}"> ${funElment.funName}
					</c:if>
									</c:forEach></td>




								<td><input type="submit" value="修改權限"> <input
									type="hidden" name="admID" value="${adminEmpVO.admID}">
									<input type="hidden" name="action" value="update"></td>
							</FORM>
							<td>
								<FORM METHOD="post"
									ACTION="<%=request.getContextPath()%>/admin_priv/AdminPrivServlet.do"
									style="margin-bottom: 0px;">
									<input type="submit" value="刪除"> <input type="hidden"
										name="admID" value="${adminEmpVO.admID}"> <input
										type="hidden" name="action" value="delete">
								</FORM>
							</td>
						</tr>
					</c:forEach>
				</table>
				<%@ include file="page2.file"%>
				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<p style="color: red">${message}</p>
						</c:forEach>
					</ul>
				</c:if>
				<ul>
					<li><a
						href='<%=request.getContextPath()%>/backend/adminEmp/addNewAdmin.jsp'>Add</a>
						a new Emp</li>
				</ul>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; EASY SPACE 2021</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>

</body>
</html>