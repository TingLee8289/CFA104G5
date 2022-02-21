<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ren_favorites.model.*"%>
<%@ page import="ezs.ren_listing_pic.model.*"%>
<%@ page import="java.util.*"%>

<%
	RenFavoritesService renFavSvc = new RenFavoritesService();
    List<RenFavoritesVO> list = renFavSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<%
RenFavoritesVO renFavoritesVO = (RenFavoritesVO) request.getAttribute("renFavoritesVO");
%>

<%
RenListingPicVO renListingPicVO = (RenListingPicVO) request.getAttribute("renListingPicVO"); 
%>

<jsp:useBean id="listOneRenFavorites" scope="request" type="java.util.List<RenFavoritesVO>" />

<jsp:useBean id="renLisSvc" scope="page" class="ezs.ren_listing.model.RenListingService" />
<jsp:useBean id="renLisPicSvc" scope="page" class="ezs.ren_listing_pic.model.RenListingPicService" />


<html>
<head>
<!--   <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script> -->
  <script src="https://kit.fontawesome.com/1c2ccc4859.js" crossorigin="anonymous"></script>
<title>收藏房源</title>

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
	width: 600px;
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

</head>
<body>
<jsp:include page="/frontend/EZ_header.jsp"></jsp:include>

	<table id="table-1">
		<tr><td>
			<h3>收藏房源</h3>
			<h4><a href="<%=request.getContextPath()%>/frontend/ren_favorites/select_page.jsp">回首頁</a></h4>
		</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>房源編號</th>
			<th>房源照片</th>
			<th>房源標題</th>		
			<th>刪除</th>
		</tr>
		<c:forEach var="renFavoritesVO" items="${listOneRenFavorites}">
			<tr align='center' valign='middle'>
				<td>${renFavoritesVO.favLisId}</td>
				<td><img src="<%=request.getContextPath()%>/DBGifReader4?fav_lis_id=${renFavoritesVO.favLisId}"></td>
				
				
				<td><c:forEach var="renLisVO" items="${renLisSvc.all}">
                    <c:if test="${renFavoritesVO.favLisId==renLisVO.lisID}">
	                    ${renLisVO.lisTitle}
                    </c:if>
               		 </c:forEach>
				</td>

				<td>
<%-- 					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenFavoritesServlet.do" style="margin-bottom: 0px;"> --%>
<!-- 						<input type="submit" value="刪除">  -->
<%-- 						<input type="hidden" name="favLisId" value="${renFavoritesVO.favLisId}">  --%>
<%-- 						<input type="hidden" name="favMemId" value="${renFavoritesVO.favMemId}">  --%>
<!-- 						<input type="hidden" name="action" value="delete"> -->
<!-- 					</FORM> -->
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenFavoritesServlet.do" style="margin-bottom: 0px;">
						<button id ="submit" onclick="submit"><i class="fa-solid fa-trash"></i></button> 
						<input type="hidden" name="favLisId" value="${renFavoritesVO.favLisId}"> 
						<input type="hidden" name="favMemId" value="${renFavoritesVO.favMemId}"> 
						<input type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>

</body>
</html>