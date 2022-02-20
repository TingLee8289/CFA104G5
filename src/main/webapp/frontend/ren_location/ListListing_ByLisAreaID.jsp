<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ren_listing.model.*"%>

<jsp:useBean id="listLocations_BylisAreaID" scope="request" type="java.util.Set<RenListingVO>" /> <!-- 於EL此行可省略 -->
<jsp:useBean id="renLocationSvc" scope="page" class="ezs.ren_location.model.RenLocationService" />
<%
	RenListingService renListingSvc = new RenListingService();
	List<RenListingVO> list = renListingSvc.getAll();
	pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>本區域房源</title>
<style>
  table#table-2 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-2 h4 {
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

</head>
<body bgcolor='white'>

<table id="table-2">
	<tr><td>
		 <h3>此區房源 - listListing_ByLisAreaID.jsp</h3>
			<h4><a href="listing_select_page.jsp">回首頁</a></h4>	</td></tr>
</table>

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
		<th>物件編號</th>
		<th>房東編號</th>
		<th>房型</th>
		<th>廣告標題</th>
		<th>租金</th>
		<th>坪數</th>
		<th>樓層</th>
		<th>房(室)</th>
		<th>廳</th>
		<th>衛</th>
		<th>詳情</th>
		<th>加入收藏</th>
	</tr>
	<%@ include file="page1.file"%>
	<c:forEach var="renListingVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	
		<tr>
			<td>${renListingVO.lisID}</td>			
			<td>${renListingVO.lisLddID}</td>
			<td><c:forEach var="renRoomtypeVO" items="${renRoomtypeSvc.all}">
                    <c:if test="${renListingVO.lisRtID==renRoomtypeVO.rtID}">
	                    ${renRoomtypeVO.rtID}${renRoomtypeVO.rtType}
                    </c:if>
                </c:forEach>
			</td>	
			<td>${renListingVO.lisTitle}</td>
			<td>${renListingVO.lisRent}</td>
			<td>${renListingVO.lisSqft}</td>
			<td>${renListingVO.lisFlr}</td>
			<td>${renListingVO.lisRmNo}</td>
			<td>${renListingVO.lisCmnArea}</td>
			<td>${renListingVO.lisBrNo}</td>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/ren_listing/RenListingServlet.do" style="margin-bottom: 0px;">
					<input type="submit" value="詳情">
					<input type="hidden" name="lisID" value="${renListingVO.lisID}">
					<input type="hidden" name="action" value="getOne_For_Display">
				</FORM>
			</td>	
	</c:forEach>

</table>
<%@ include file="page2.file" %>

</body>
</html>