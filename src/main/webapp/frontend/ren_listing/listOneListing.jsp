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
		<h3>員工資料 - ListOneListing.jsp</h3>
		<h4><a href="listing_select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>
<table>
	<tr>
		<th>房源ID</th>
		<th>房東ID</th>
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
		<th>房源上架狀態</th>
		<th>房源申請審核狀態</th>
	</tr>
	<tr>
		<td><%=renListingVO.getLisID()%></td>
		<td><%=renListingVO.getLisLddID()%></td>
		<td><%=renListingVO.getLisRtID()%></td>
		<td><%=renListingVO.getLisAreaID()%></td>
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
		<td><%=renListingVO.getLisEthernet()%></td>
		<td><%=renListingVO.getLisWifi()%></td>
		<td><%=renListingVO.getLisWh()%></td>
		<td><%=renListingVO.getLisShenc()%></td>
		<td><%=renListingVO.getLisAc()%></td>
		<td><%=renListingVO.getLisFridge()%></td>
		<td><%=renListingVO.getLisTv()%></td>
		<td><%=renListingVO.getLisWasher()%></td>
		<td><%=renListingVO.getLisDryer()%></td>
		<td><%=renListingVO.getLisTc()%></td>
		<td><%=renListingVO.getLisBed()%></td>
		<td><%=renListingVO.getLisCabinet()%></td>
		<td><%=renListingVO.getLisSofa()%></td>
		<td><%=renListingVO.getLisParking()%></td>
		<td><%=renListingVO.getLisCook()%></td>
		<td><%=renListingVO.getLisPet()%></td>
		<td><%=renListingVO.getLisSmoking()%></td>
		<td><%=renListingVO.getLisMonly()%></td>
		<td><%=renListingVO.getLisFonly()%></td>
		<td><%=renListingVO.getLisSonly()%></td>
		<td><%=renListingVO.getLisStatus()%></td>
		<td><%=renListingVO.getLisApproval()%></td>
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
		
		























