<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_dmd.model.*"%>


<%
SerDmdVO serDmdVO = (SerDmdVO) request.getAttribute("serDmdVO"); //SerDmdServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>EASY SPACE</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">


</head>
<body>


	<table id="table-1">
		<tr>
			<td>

				<h4>
					<a
						href="<%=request.getContextPath()%>/backend/ser/serDmd/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>
	<div class="container-fluid m-3 mx-auto">
		<main>
			<div id="data-panel" class="table-responsive ">
				<table
					class="table table-striped table-hover align-middle text-center caption-top">
					<caption>
						<h2>所有需求</h2>

					</caption>
					<thead class="table-success">


						<tr class="text-nowrap">
							<th>需求單ID</th>
							<th>需求單狀態</th>
							<th>會員ID</th>
							<th>服務類別ID</th>
							<th>需求人姓名</th>
							<th>需求人電話</th>
							<th>需求人信箱</th>
							<th>案場縣市</th>
							<th>案場地區</th>
							<th>案場詳細地址</th>
							<th>空間類別</th>
							<th>坪數</th>
							<th>預算</th>
							<th>需求簡介</th>
							<th>照片</th>
							<th>修改</th>
							<th>刪除</th>
						</tr>
					</thead>
					<tbody id="show-list">
						<tr>
							<td>${serDmdVO.dmdID}</td>
							<td><c:if test="${serDmdVO.dmdStatus == 0}">未投遞</c:if> <c:if
									test="${serDmdVO.dmdStatus == 1}">投遞中</c:if> <c:if
									test="${serDmdVO.dmdStatus == 2}">訂單成立</c:if></td>
							<td>${serDmdVO.dmdMemID}</td>
							<td>${serDmdVO.dmdSerClaID}</td>
							<td>${serDmdVO.dmdName}</td>
							<td>${serDmdVO.dmdTel}</td>
							<td>${serDmdVO.dmdMail}</td>
							<td>${serDmdVO.dmdCounty}</td>
							<td>${serDmdVO.dmdRegion}</td>
							<td>${serDmdVO.dmdAddress}</td>
							<td>${serDmdVO.dmdSpaceClass}</td>
							<td>${serDmdVO.dmdSquare}</td>
							<td>${serDmdVO.dmdBudget}</td>
							<td>${serDmdVO.dmdIntro}</td>
							<td><img
									src="<%=request.getContextPath()%>/ser_dmd/DBGifReader4?dmdID=${serDmdVO.dmdID}"
									width=200px></td>

							<td>
								<FORM METHOD="post"
									ACTION="<%=request.getContextPath()%>/ser_dmd/SerDmdServlet.do"
									style="margin-bottom: 0px;">
									<input type="submit" value="修改"> <input type="hidden"
										name="dmdID" value="${serDmdVO.dmdID}"> <input
										type="hidden" name="action" value="getOne_For_Update">
								</FORM>
							</td>
							<td>
								<FORM METHOD="post"
									ACTION="<%=request.getContextPath()%>/ser_dmd/SerDmdServlet.do"
									style="margin-bottom: 0px;">
									<input type="submit" value="刪除"> <input type="hidden"
										name="dmdID" value="${serDmdVO.dmdID}"> <input
										type="hidden" name="action" value="delete">
								</FORM>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</main>
	</div>

</body>
</html>