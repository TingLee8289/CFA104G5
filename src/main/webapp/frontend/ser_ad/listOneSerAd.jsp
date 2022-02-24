<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_ad.model.*"%>
<%session.setAttribute("memID", 2);%>
<%
Integer memID = (Integer) session.getAttribute("memID");
SerAdService serAdSvc= new SerAdService();
// serAdSvc.getOneSerAd(adVdrID, adSerClaID);

SerAdVO serAdVO = (SerAdVO) request.getAttribute("serAdVO"); 
%>

<html>
<head>
<title>EASY SPACE</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
	
	<div class="container-fluid m-3 mx-auto">
		<main>
			<div id="data-panel" class="table-responsive ">
				<table
					class="table table-striped table-hover align-middle text-center caption-top">
					<caption>
						<h2>刊登服務</h2>
						
					</caption>
					<thead class="table-success">
	
	
	

	
		<tr class="text-nowrap">
			<th>廠商編號</th>
			<th>刊登狀態</th>
			<th>服務類別編號</th>
			<th>服務地區</th>
			<th>服務內容</th>
			<th>服務案例圖片</th>

		</tr>
		</thead>
		<tbody id="show-list">
		<tr>
			<td><%=serAdVO.getAdVdrID()%></td>
			<td><c:if test="${serAdVO.adStatus == 0}">下架</c:if> <c:if
					test="${serAdVO.adStatus == 1}">上架</c:if></td>
			<td><%=serAdVO.getAdSerClaID()%></td>
			<td><%=serAdVO.getAdDist()%></td>
			<td><%=serAdVO.getAdTxt()%></td>
			<td><img
				src="<%=request.getContextPath()%>/ser_ad/DBGifReader4.do?ad_vdr_id=${serAdVO.adVdrID}&ad_ser_cla_id=${serAdVO.adSerClaID}"
				width=200px></td>
			<%-- ad_cla_id=${serAdVO.adClaID} --%>
		</tr>
	</tbody>
	</table>
	</div>
	</main>
	</div>


</body>
</html>