<%@page import="ezs.ren_roomtype.model.RenRoomtypeVO"%>
<%@page import="ezs.ren_roomtype.model.RenRoomtypeService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ren_listing.model.*"%>
<%@ page import="ezs.ren_roomtype.model.*"%>
<%@ page import="ezs.ren_location.model.*"%>
<%@ page import="ezs.ren_location.model.RenLocationVO"%>
<%@ page import="ezs.ren_location.model.RenLocationService"%>


<%
	RenListingService renListingSvc = new RenListingService();
	List<RenListingVO> list = renListingSvc.getAll();
	pageContext.setAttribute("list",list);
%>

<jsp:useBean id="renRoomtypeSvc" scope="page" class="ezs.ren_roomtype.model.RenRoomtypeService" />
<jsp:useBean id="renLocationSvc" scope="page" class="ezs.ren_location.model.RenLocationService" />
<jsp:useBean id="renLandlordSvc" scope="page" class="ezs.ren_landlord.model.RenLandlordService" />
<jsp:useBean id="memberSvc" scope="page" class="ezs.member.model.MemberService" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有房源資料 - listingAllListing.jsp</title>
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

</head>
<body bgcolor="white">
<table id="table-1">
	<tr><td>
		<h3>所有房源資料 - listingAllListing.jsp</h3>
		<h4><a href="listing_select_page.jsp">回首頁</a></h4>
	</td></tr>

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
	    <th>房源ID</th>
		<th>房東</th>
		<th>房型ID</th>
		<th>區域ID</th>
		<th>房源標題</th>
<!-- 		<th>房源介紹</th> -->
		<th>詳細地址</th>
		<th>租金</th>
<!-- 		<th>管理費</th> -->
<!-- 		<th>停車費</th> -->
		<th>坪數</th>
		<th>樓層</th>
		<th>房間數量</th>
		<th>廳堂數量</th>
		<th>衛浴數量</th>
<!-- 		<th>有線網路</th> -->
<!-- 		<th>WIFI</th> -->
<!-- 		<th>熱水器</th> -->
<!-- 		<th>乾溼分離</th> -->
<!-- 		<th>>冷氣</th> -->
<!-- 		<th>冰箱</th> -->
<!-- 		<th>電視</th> -->
<!-- 		<th>洗衣機</th> -->
<!-- 		<th>烘衣機</th> -->
<!-- 		<th>桌椅</th> -->
<!-- 		<th>床</th> -->
<!-- 		<th>櫃子</th> -->
<!-- 		<th>沙發</th> -->
<!-- 		<th>車位</th> -->
<!-- 		<th>可以開伙</th> -->
<!-- 		<th>可以養寵物</th> -->
<!-- 		<th>可以吸菸</th> -->
<!-- 		<th>限男性</th> -->
<!-- 		<th>限女性</th> -->
<!-- 		<th>限學生</th> -->
		<th>房源圖片</th>
<!-- 		<th>房源上架狀態</th> -->
<!-- 		<th>房源申請審核狀態</th> -->
		<th>詳情</th>
<!-- 		<th>收藏</th> -->
	</tr>

	<%@ include file="page3.file" %>
	<c:forEach var="renListingVO" items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">

	
		<tr>
			<td>${renListingVO.lisID}</td>
<%-- 			<td>${renListingVO.lisLddID}</td> --%>
<%-- 			<td>${renListingVO.lisLddID}</td> --%>
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
			<td><c:forEach var="renLocationVO" items="${renLocationSvc.all}">
                    <c:if test="${renListingVO.lisAreaID==renLocationVO.locID}">
	                    ${renLocationVO.locID}${renLocationVO.locCity}${renLocationVO.locDist}
                    </c:if>
                </c:forEach>
			</td>			
			<td>${renListingVO.lisTitle}</td>
<%-- 			<td>${renListingVO.lisAbt}</td> --%>
			<td>${renListingVO.lisAddress}</td>
			<td>${renListingVO.lisRent}</td>
<%-- 			<td>${renListingVO.lisMngFee}</td> --%>
<%-- 			<td>${renListingVO.lisPfee}</td> --%>
			<td>${renListingVO.lisSqft}</td>
			<td>${renListingVO.lisFlr}</td>
			<td>${renListingVO.lisRmNo}</td>
			<td>${renListingVO.lisCmnArea}</td>
			<td>${renListingVO.lisBrNo}</td>
<%-- 			<td>${renListingVO.lisEthernet}</td> --%>
<%-- 			<td>${renListingVO.lisWifi}</td> --%>
<%-- 			<td>${renListingVO.lisWh}</td> --%>
<%-- 			<td>${renListingVO.lisShenc}</td> --%>
<%-- 			<td>${renListingVO.lisAc}</td> --%>
<%-- 			<td>${renListingVO.lisFridge}</td> --%>
<%-- 			<td>${renListingVO.lisTv}</td> --%>
<%-- 			<td>${renListingVO.lisWasher}</td> --%>
<%-- 			<td>${renListingVO.lisDryer}</td> --%>
<%-- 			<td>${renListingVO.lisTc}</td> --%>
<%-- 			<td>${renListingVO.lisBed}</td> --%>
<%-- 			<td>${renListingVO.lisCabinet}</td> --%>
<%-- 			<td>${renListingVO.lisSofa}</td> --%>
<%-- 			<td>${renListingVO.lisParking}</td> --%>
<%-- 			<td>${renListingVO.lisCook}</td> --%>
<%-- 			<td>${renListingVO.lisPet}</td> --%>
<%-- 			<td>${renListingVO.lisSmoking}</td> --%>
<%-- 			<td>${renListingVO.lisMonly}</td> --%>
<%-- 			<td>${renListingVO.lisFonly}</td> --%>
<%-- 			<td>${renListingVO.lisSonly}</td> --%>
			<td><img src="<%=request.getContextPath()%>/ren_listing/RenListing_pic_ReaderServlet.do?LIS_ID=
				 ${renListingVO.lisID}" width = 200px></td>
<%-- 			<td>${renListingVO.lisStatus}</td> --%>
<%-- 			<td>${renListingVO.lisApproval}</td> --%>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/ren_listing/GetOneRenListingServlet.do" style="margin-bottom: 0px;">
					<input type="submit" value="詳情">
					<input type="hidden" name="lisID" value="${renListingVO.lisID}">
					<input type="hidden" name="action" value="getOne_For_Display_A">
				</FORM>
			</td>
<!-- 			<td> -->
<%-- 				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/ren_listing/RenListingServlet.do" style="margin-bottom: 0px;"> --%>
<!-- 			     	<input type="submit" value="收藏"> -->
<%-- 			     	<input type="hidden" name="lisID"  value="${renListingVO.lisID}"> --%>
<!-- 			     	<input type="hidden" name="action" value="delete"> -->
<!-- 			    </FORM> -->
<!-- 			 </td> -->
		</tr>
 	</c:forEach> 
</table>
<%@ include file="page2.file" %>

</body>
</html>
