<%@page import="ezs.ren_roomtype.model.RenRoomtypeVO"%>
<%@page import="ezs.ren_roomtype.model.RenRoomtypeService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ren_listing.model.*"%>
<%@ page import="ezs.ren_roomtype.model.*"%>

<%
	RenListingService renListingSvc = new RenListingService();
	List<RenListingVO> list = renListingSvc.getAll();
	pageContext.setAttribute("list",list);
%>

<jsp:useBean id="renRoomtypeSvc" scope="page" class="ezs.ren_roomtype.model.RenRoomtypeService" />

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
		<h4><a href="<%=request.getContextPath()%>/listing_select_page.jsp">回首頁</a></h4>
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
	    <td>房源ID</td>
		<td>房東ID</td>
		<td>房型ID</td>
		<td>區域ID</td>
		<td>房源標題</td>
		<td>房源介紹</td>
		<td>詳細地址</td>
		<td>租金</td>
		<td>管理費</td>
		<td>停車費</td>
		<td>坪數</td>
		<td>樓層</td>
		<td>房間數量</td>
		<td>廳堂數量</td>
		<td>衛浴數量</td>
		<td>有線網路</td>
		<td>WIFI</td>
		<td>熱水器</td>
		<td>乾溼分離</td>
		<td>>冷氣</td>
		<td>冰箱</td>
		<td>電視</td>
		<td>洗衣機</td>
		<td>烘衣機</td>
		<td>桌椅</td>
		<td>床</td>
		<td>櫃子</td>
		<td>沙發</td>
		<td>車位</td>
		<td>可以開伙</td>
		<td>可以養寵物</td>
		<td>可以吸菸</td>
		<td>限男性</td>
		<td>限女性</td>
		<td>限學生</td>
		<td>房源圖片</td>
		<td>房源上架狀態</td>
		<td>房源申請審核狀態</td>
		<td>修改</td>
		<td>刪除</td>
	</tr>
	<%@ include file="page1.file" %>
	<c:forEach var="renListingVO" items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
	
		<tr>
			<td>${renListingVO.lisID}</td>
			<td>${renListingVO.lisLddID}</td>
			<td><c:forEach var="renRoomtypeVO" items="${renRoomtypeSvc.all}">
                    <c:if test="${renListingVO.lisRtID==renRoomtypeVO.rtID}">
	                    ${renRoomtypeVO.rtID}${renRoomtypeVO.rtType}
                    </c:if>
                </c:forEach>
			</td>
			<td>${renListingVO.lisAreaID}</td>
			<td>${renListingVO.lisTitle}</td>
			<td>${renListingVO.lisAbt}</td>
			<td>${renListingVO.lisAddress}</td>
			<td>${renListingVO.lisRent}</td>
			<td>${renListingVO.lisMngFee}</td>
			<td>${renListingVO.lisPfee}</td>
			<td>${renListingVO.lisSqft}</td>
			<td>${renListingVO.lisFlr}</td>
			<td>${renListingVO.lisRmNo}</td>
			<td>${renListingVO.lisCmnArea}</td>
			<td>${renListingVO.lisBrNo}</td>
			<td>${renListingVO.lisEthernet}</td>
			<td>${renListingVO.lisWifi}</td>
			<td>${renListingVO.lisWh}</td>
			<td>${renListingVO.lisShenc}</td>
			<td>${renListingVO.lisAc}</td>
			<td>${renListingVO.lisFridge}</td>
			<td>${renListingVO.lisTv}</td>
			<td>${renListingVO.lisWasher}</td>
			<td>${renListingVO.lisDryer}</td>
			<td>${renListingVO.lisTc}</td>
			<td>${renListingVO.lisBed}</td>
			<td>${renListingVO.lisCabinet}</td>
			<td>${renListingVO.lisSofa}</td>
			<td>${renListingVO.lisParking}</td>
			<td>${renListingVO.lisCook}</td>
			<td>${renListingVO.lisPet}</td>
			<td>${renListingVO.lisSmoking}</td>
			<td>${renListingVO.lisMonly}</td>
			<td>${renListingVO.lisFonly}</td>
			<td>${renListingVO.lisSonly}</td>
			<td><img src="<%=request.getContextPath()%>/ren_listing/RenListing_pic_ReaderServlet.do?lspLisID=
				 ${renListingVO.lisID}" width = 200px></td>
			<td>${renListingVO.lisStatus}</td>
			<td>${renListingVO.lisApproval}</td>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/ren_listing/RenListingServlet.do" style="margin-bottom: 0px;">
					<input type="submit" value="修改">
					<input type="hidden" name="lisID" value="${renListingVO.lisID}">
					<input type="hidden" name="action" value="getOne_For_Update">
				</FORM>
			</td>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/ren_listing/RenListingServlet.do" style="margin-bottom: 0px;">
			     	<input type="submit" value="刪除">
			     	<input type="hidden" name="lisID"  value="${renListingVO.lisID}">
			     	<input type="hidden" name="action" value="delete">
			    </FORM>
			 </td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>