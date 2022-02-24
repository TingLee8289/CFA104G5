<%@page import="ezs.ren_favorites.model.RenFavoritesService"%>
<%@page import="ezs.ren_favorites.model.RenFavoritesVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ezs.ren_listing.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%
 RenListingVO renListingVO = (RenListingVO) request.getAttribute("renListingVO");
%>
<%
 RenFavoritesVO renFavoritesVO = (RenFavoritesVO) request.getAttribute("renFavoritesVO");

%>

<%
	RenFavoritesService renFavSvc = new RenFavoritesService();
    List<RenFavoritesVO> list = renFavSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<jsp:useBean id="renRoomtypeSvc" scope="page" class="ezs.ren_roomtype.model.RenRoomtypeService" />
<jsp:useBean id="renLocationSvc" scope="page" class="ezs.ren_location.model.RenLocationService" />
<jsp:useBean id="renLandlordSvc" scope="page" class="ezs.ren_landlord.model.RenLandlordService" />
<jsp:useBean id="memberSvc" scope="page" class="ezs.member.model.MemberService" />
<!DOCTYPE html>
<html>
<head>

<title>EASY SPACE</title>

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

<body  bgcolor='white'>

<table id="table-1">
	<tr><td>
		<h3>房屋詳情 - ListOneListing.jsp</h3>
		<h4><a href="listing_select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>
<table>
	<tr>
		<th>房源ID</th>
		<th>房東</th>
		<th>房型ID</th>
		<th>區域ID</th>
		<th>房源標題</th>
		<th>房源介紹</th>
		<th>詳細地址</th>
		<th>租金</th>
		<th>管理費</th>
		<th>停車費</th>
		<th>坪數</th>
		<th>樓層</th>
		<th>房間數量</th>
		<th>廳堂數量</th>
		<th>衛浴數量</th>
		<th>有線網路</th>
		<th>WIFI</th>
		<th>熱水器</th>
		<th>乾溼分離</th>
		<th>冷氣</th>
		<th>冰箱</th>
		<th>電視</th>
		<th>洗衣機</th>
		<th>烘衣機</th>
		<th>桌椅</th>
		<th>床</th>
		<th>櫃子</th>
		<th>沙發</th>
		<th>車位</th>
		<th>可以開伙</th>
		<th>可以養寵物</th>
		<th>可以吸菸</th>
		<th>限男性</th>
		<th>限女性</th>
		<th>限學生</th>
		<th>房屋照片</th>		
<!-- 		<th>房源上架狀態</th> -->
<!-- 		<th>房源申請審核狀態</th> -->
	</tr>
	<tr>
		<td><%=renListingVO.getLisID()%></td>
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
                </c:forEach></td>
		<td><%=renListingVO.getLisTitle()%></td>
		<td><%=renListingVO.getLisAbt()%></td>
		<td><%=renListingVO.getLisAddress()%></td>
		<td><%=renListingVO.getLisRent()%></td>
		<td><%=renListingVO.getLisMngFee()%></td>
		<td><%=renListingVO.getLisPfee()%></td>
		<td><%=renListingVO.getLisSqft()%></td>
		<td><%=renListingVO.getLisFlr()%></td>
		<td><%=renListingVO.getLisRmNo()%></td>
		<td><%=renListingVO.getLisCmnArea()%></td>
		<td><%=renListingVO.getLisBrNo()%></td>
		<td><c:if test="${renListingVO.lisEthernet ==0}">沒有</c:if>
		 <c:if test="${renListingVO.lisEthernet==1}">有</c:if></td>			
			<td><c:if test="${renListingVO.lisWifi==0}">沒有</c:if>
		 <c:if test="${renListingVO.lisWifi==1}">有</c:if></td>
		 	<td><c:if test="${renListingVO.lisWh==0}">沒有</c:if>
		 <c:if test="${renListingVO.lisWh==1}">有</c:if></td> 
			<td><c:if test="${renListingVO.lisShenc==0}">沒有</c:if>
		 <c:if test="${renListingVO.lisShenc==1}">有</c:if></td>
			<td><c:if test="${renListingVO.lisAc==0}">沒有</c:if>
		 <c:if test="${renListingVO.lisAc==1}">有</c:if></td>
			<td><c:if test="${renListingVO.lisFridge==0}">沒有</c:if>
		 <c:if test="${renListingVO.lisFridge==1}">有</c:if></td>
			<td><c:if test="${renListingVO.lisTv==0}">沒有</c:if>
		 <c:if test="${renListingVO.lisTv==1}">有</c:if></td>
			<td><c:if test="${renListingVO.lisWasher==0}">沒有</c:if>
		 <c:if test="${renListingVO.lisWasher==1}">有</c:if></td>
			<td><c:if test="${renListingVO.lisDryer==0}">沒有</c:if>
		 <c:if test="${renListingVO.lisDryer==1}">有</c:if></td>
			<td><c:if test="${renListingVO.lisTc==0}">沒有</c:if>
		 <c:if test="${renListingVO.lisTc==1}">有</c:if></td>
			<td><c:if test="${renListingVO.lisBed==0}">沒有</c:if>
		 <c:if test="${renListingVO.lisBed==1}">有</c:if></td>
			<td><c:if test="${renListingVO.lisCabinet==0}">沒有</c:if>
		 <c:if test="${renListingVO.lisCabinet==1}">有</c:if></td>
			<td><c:if test="${renListingVO.lisSofa==0}">沒有</c:if>
		 <c:if test="${renListingVO.lisSofa==1}">有</c:if></td>
			<td><c:if test="${renListingVO.lisParking==0}">沒有</c:if>
		 <c:if test="${renListingVO.lisParking==1}">有</c:if></td>
			<td><c:if test="${renListingVO.lisCook==0}">不可以</c:if>
		 <c:if test="${renListingVO.lisCook==1}">可以</c:if></td>
			<td><c:if test="${renListingVO.lisPet==0}">不可以</c:if>
		 <c:if test="${renListingVO.lisPet==1}">可以</c:if></td>
			<td><c:if test="${renListingVO.lisSmoking==0}">不可以</c:if>
		 <c:if test="${renListingVO.lisSmoking==1}">可以</c:if></td>
			<td><c:if test="${renListingVO.lisMonly==0}">否</c:if>
		 <c:if test="${renListingVO.lisMonly==1}">是</c:if></td>
			<td><c:if test="${renListingVO.lisFonly==0}">否</c:if>
		 <c:if test="${renListingVO.lisFonly==1}">是</c:if></td>
			<td><c:if test="${renListingVO.lisSonly==0}">否</c:if>
		 <c:if test="${renListingVO.lisSonly==1}">是</c:if></td>
			<td><img src="<%=request.getContextPath()%>/ren_listing/RenListing_pic_ReaderServlet.do?LIS_ID=
				 ${renListingVO.lisID}" width = 200px></td>
<%-- 		<td><%=renListingVO.getLisStatus()%></td> --%>
<%-- 		<td><%=renListingVO.getLisApproval()%></td> --%>
	</tr>
</table>

<div>


<button id="addFav" class="float-left submit-button" >收藏房源</button>
<script type="text/javascript">
    document.getElementById("addFav").onclick = function () {
        location.href = "<%=request.getContextPath()%>/frontend/ren_favorites/addRenFavorites.jsp?favLisId=${renListingVO.lisID}";
    };
</script>

<button id="addApp" class="float-left submit-button" >預約看房</button>
<script type="text/javascript">
    document.getElementById("addApp").onclick = function () {
        location.href = "<%=request.getContextPath()%>/frontend/ren_appointment/addRenAppointment.jsp?aptLisId=${renListingVO.lisID}&aptLddId=${renListingVO.lisLddID}";
    };
</script>
</div>

</body>
</html>		
		
		























