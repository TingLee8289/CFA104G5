
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@page import="ezs.ser_quo.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>
<%-- 為了提供給分頁的變數 --%>
<%
SerQuoService serQuoSvc = new SerQuoService();
List<SerQuoVO> serQuolist = serQuoSvc.getAll();
pageContext.setAttribute("serQuolist", serQuolist);
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
						href="<%=request.getContextPath()%>/backend/ser/serQuo/quoBackend.jsp">回首頁</a>
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
	\
	<div class="container-fluid m-3 mx-auto">
		<main>
			<div id="data-panel" class="table-responsive ">
				<table
					class="table table-striped table-hover align-middle text-center caption-top">
					<caption>

						<h2>所有估價單</h2>
						<%@ include file="page1.file"%>
					</caption>
					<thead class="table-success">


						<tr class="text-nowrap">
							<th>估價單ID</th>
							<th>估價單狀態</th>
							<th>需求單ID</th>
							<th>廠商ID</th>
							<th>估價日期</th>
							<th>有效限期</th>
							<th>估價項目</th>
							<th>估價總價</th>
							<th>修改</th>
							<th>刪除</th>
						</tr>
					</thead>
					<tbody id="show-list">

						<c:forEach var="serQuoVO" items="${serQuolist}"
							begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
							<%-- <c:forEach var="serQuoVO" items="${serQuolist}"> --%>
							<!-- 變數名稱要注意 -->
							<tr>
								<td>${serQuoVO.quoID}</td>
								<td>${serQuoVO.quoStatus}</td>
								<td>${serQuoVO.quoDmdID}</td>
								<td>${serQuoVO.quoVdrID}</td>
								<td>${serQuoVO.quoDate}</td>
								<td>${serQuoVO.quoExpiryDate}</td>
								<td>${serQuoVO.quoItem}</td>
								<td>${serQuoVO.quoTotalPrice}</td>

								<td>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/ser_quo/UpdateQuoServlet.do"
										style="margin-bottom: 0px;">
										<input type="submit" value="修改"> <input type="hidden"
											name="quoID" value="${serQuoVO.quoID}"> <input
											type="hidden" name="action" value="updateOneQuo">
									</FORM>
								</td>
								<td>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/ser_quo/DeleteQuoServlet.do"
										style="margin-bottom: 0px;">
										<input type="submit" value="刪除"> <input type="hidden"
											name="quoID" value="${serQuoVO.quoID}"> <input
											type="hidden" name="action" value="delete">
									</FORM>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</main>
	</div>

	<%@ include file="page2.file"%>

</body>
</html>