<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>EASY SPACE後台管理系統</title>
<link href="<%=request.getContextPath()%>/css/backendLogin.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="bg-primary">





	

	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">後台登入</h3>
								</div>
								<div class="card-body">

									<form METHOD="post"
										ACTION="<%=request.getContextPath()%>/admin_emp/AdminEmpServlet.do">

										<input type="hidden" name="action" value="getOne_For_Display">
										<div class="form-floating mb-3">

											<input class="form-control" id="inputEmail" type="text"
												placeholder="name@example.com" name="admUsername" /> <label
												for="inputEmail">管理員帳號</label>

										</div>
										<div class="form-floating mb-3">

											<input class="form-control" id="inputPassword"
												type="password" placeholder="Password" name="admPassword" />
											<label for="inputPassword">密碼</label>

										</div>
										<div class="form-check mb-3" style='padding-left:0'>
											
											<%-- 錯誤表列 --%>
											<c:if test="${not empty errorMsgs}">
													<c:forEach var="message" items="${errorMsgs}">
														<p style='text-align:center;color: red'>${message}</p>
													</c:forEach>
											</c:if>
										</div>

										<div
											class="d-flex align-items-center justify-content-between mt-4 mb-0">
											<%-- <a class="btn btn-primary" href="<%=request.getContextPath() %>/backend/ind.jsp">Login</a> --%>
											<input type="submit" value="登入" align="center"class="btn btn-primary" >
										</div>

									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="layoutAuthentication_footer">
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2021</div>
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





</body>
</html>