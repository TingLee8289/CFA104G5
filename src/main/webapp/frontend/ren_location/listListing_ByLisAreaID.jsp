<%@page import="ezs.ren_location.model.RenLocationVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ren_listing.model.*"%>
<%@ page import="ezs.ren_roomtype.model.*"%>
<%@ page import="ezs.ren_roomtype.model.RenRoomtypeVO"%>
<%@ page import="ezs.ren_roomtype.model.RenRoomtypeService"%>
<%@ page import="ezs.ren_location.model.*"%>



<% 
	Set<RenListingVO> set1 = (Set<RenListingVO>)session.getAttribute("listRenListing_ByLisAreaID"); 
	pageContext.setAttribute("set1", set1);
%> 
<jsp:useBean id="renLocationSvc" scope="page" class="ezs.ren_location.model.RenLocationService" />
<jsp:useBean id="renRoomtypeSvc" scope="page" class="ezs.ren_roomtype.model.RenRoomtypeService" />
<jsp:useBean id="renLandlordSvc" scope="page" class="ezs.ren_landlord.model.RenLandlordService" />
<jsp:useBean id="memberSvc" scope="page" class="ezs.member.model.MemberService" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EASY SPACE</title>
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
		<th>房東</th>
		<th>房型</th>
		<th>廣告標題</th>
		<th>租金</th>
		<th>坪數</th>
		<th>樓層</th>
		<th>房(室)</th>
		<th>廳</th>
		<th>衛</th>
		<th>詳情</th>
<!-- 		<th>加入收藏</th> -->
	</tr>
	<%@ include file="page1.file"%>
	<c:forEach var="renListingVO" items="${set1}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	
		<tr>
			<td>${renListingVO.lisID}</td>			
			<td><c:forEach var="renLandlordVO" items="${renLandlordSvc.all}">
                    <c:if test="${renListingVO.lisLddID==renLandlordVO.lddId}">
			<c:forEach var="memberVO" items="${memberSvc.all}">
                    		<c:if test="${renLandlordVO.lddId==memberVO.memID}">
                    		 	${memberVO.memID}${memberVO.memName}
                      	 </c:if>
                       </c:forEach>
                   </c:if>
                </c:forEach></td>
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
			<td><img src="<%=request.getContextPath()%>/ren_listing/RenListing_pic_ReaderServlet.do?LIS_ID=
				 ${renListingVO.lisID}" width = 200px></td>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/ren_listing/RenListingServlet.do" style="margin-bottom: 0px;">
					<input type="submit" value="詳情">
					<input type="hidden" name="lisID" value="${renListingVO.lisID}">
					<input type="hidden" name="action" value="getOne_For_Display">
				</FORM>
			</td>	
	</c:forEach>
<%@ include file="page2.file" %>

</table>

</body>
</html>