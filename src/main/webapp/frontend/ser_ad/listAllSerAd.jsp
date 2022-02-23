<%@page import="ezs.ser_cla.model.SerClaVO"%>
<%@page import="ezs.ser_cla.model.SerClaService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_ad.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>
<%session.setAttribute("memID", 2);%>
<%
SerAdService serAdSvc = new SerAdService();
List<SerAdVO> list = serAdSvc.getAll();
SerClaService serClaSvc = new SerClaService();
List<SerClaVO> serClaVO = serClaSvc.getAll();

pageContext.setAttribute("list", list);
pageContext.setAttribute("serClaVO", serClaVO);
%>


<html>
<head>
<title>所有刊登服務</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">



</head>
<body>
	

	<table>
		<tr>
			<td>
			
				<h4>
					<a href="serAdHome.jsp">回首頁</a>
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

	<div class="container-fluid m-3 mx-auto">
		<main>
			<div id="data-panel" class="table-responsive ">
				<table
					class="table table-striped table-hover align-middle text-center caption-top">
					<caption>
						<h2>所有刊登服務</h2>
						<%@ include file="page1.file"%>
					</caption>
					<thead class="table-success">


						<tr class="text-nowrap">
							<th>廠商編號</th>
							<th>刊登狀態</th>
							<th>服務類別編號</th>
							<th>服務地區</th>
							<th>服務內容</th>
							<th>服務案例圖片</th>
							<th></th>
							<th></th>

						</tr>
					</thead>
					<tbody id="show-list">
						 
						<c:forEach var="serAdVO" items="${list}">
							<c:if test="${serAdVO.adVdrID == memID}">
								
							<tr>
								<td>${serAdVO.adVdrID}</td>
								<td>
									<c:if test="${serAdVO.adStatus == 0}">下架</c:if> 
									<c:if test="${serAdVO.adStatus == 1}">上架</c:if>
								</td>
								<td>${serAdVO.adSerClaID}</td>
								<td>${serAdVO.adDist}</td>
								<td>${serAdVO.adTxt}</td>
								<td><img
									src="<%=request.getContextPath()%>/ser_ad/DBGifReader4.do?ad_vdr_id=${serAdVO.adVdrID}&ad_ser_cla_id=${serAdVO.adSerClaID}"
									width=200px></td>
								<%--  ad_cla_id=${serAdVO.adClaID}--%>

								<td>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/frontend/ser_ad/GetOneForUpdateSerAdServlet.do"
										style="margin-bottom: 0px;">
										<input type="submit" value="修改"> <input type="hidden"
											name="adVdrID" value="${serAdVO.adVdrID}"> <input
											type="hidden" name="adSerClaID" value="${serAdVO.adSerClaID}">
										<input type="hidden" name="action" value="getOne_For_Update">
									</FORM>
								</td>
								<td>
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/frontend/ser_ad/DeleteSerAdServlet.do"
										style="margin-bottom: 0px;">
										<input type="submit" value="刪除"> <input type="hidden"
											name="adVdrID" value="${serAdVO.adVdrID}"> <input
											type="hidden" name="adSerClaID" value="${serAdVO.adSerClaID}">
										<input type="hidden" name="action" value="delete">
									</FORM>
								</td>
							</tr>
								</c:if>
							
						</c:forEach>
					</tbody>
				</table>
			</div>
		</main>
	</div>
	  <%@ include file="page2.file"%>
	

</body>
</html>