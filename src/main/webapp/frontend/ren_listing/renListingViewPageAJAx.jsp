<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.sql.*"%>
<%@ page import="ezs.ren_listing.model.*"%>
<%@ page import="ezs.ren_listing_pic.model.*"%>
<%@ page import="ezs.ren_location.model.*"%>
<%@ page import="ezs.ren_roomtype.model.*"%>

<%
	RenListingPicService renListingPicSvc = new RenListingPicService();
	List<RenListingPicVO> renListingPiclist = renListingPicSvc.getEachListingFirstPic();
	pageContext.setAttribute("renListingPiclist", renListingPiclist);
	
	RenListingService renListingSvc = new RenListingService();
	List<RenListingVO> renListinglist = renListingSvc.getAll();
	pageContext.setAttribute("renListinglist", renListinglist);

	RenRoomtypeService renRoomtypeSvc = new RenRoomtypeService();
	List<RenRoomtypeVO> renRoomtypelist = renRoomtypeSvc.getAll();
	pageContext.setAttribute("renRoomtypelist", renRoomtypelist);

	RenLocationService renLocationSvc = new RenLocationService();
	List<RenLocationVO> renLocationlist = renLocationSvc.getAll();
	pageContext.setAttribute("renLocationlist", renLocationlist);
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	String URL = "jdbc:mysql://localhost:3306/CFA104G5";
	Connection con = DriverManager.getConnection(URL, "CFA104G5", "CFA104G5");

	String SQL = "SELECT * FROM `CFA104G5`.`REN_LISTING` WHERE LIS_ID = ?";
	PreparedStatement pstmt = con.prepareStatement(SQL);
	Integer shCateID = Integer.valueOf(request.getParameter("LisID"));
	pstmt.setInt(1, shCateID);
	ResultSet rs = pstmt.executeQuery();
	
	String str = "";
	while(rs.next()){
		str += "<li>";
		str += "<a href=\"/CFA104G5/frontend/ren_listing/RenListingServlet.do?lisID=";
		str += rs.getInt("LIS_ID");
		str += "&action=getOne_For_Display\">";
		str += "<div class=\"img_block\">";
		str += "<img src =\"/CFA104G5/ren_listing/RenListing_pic_ReaderServlet.do?lisID=";
		str += rs.getInt("LIS_ID")+"\">";
		str += "</div>";
		str += "<span class='item_text'>";
		str += rs.getString("LIS_TITLE");
		str += "</span>";
		str += "<span class='item_text'>";
		str += rs.getString("LIS_AREA_ID");
		str += "</span>";
		str += "<span class='item_text'>";
		str += rs.getString("LIS_ADDRESS");
		str += "</span>";
		str += "<span class='item_text'>";
		str += rs.getString("LIS_SQFT");
		str += "</span>";
		str += "<span class='item_text'>";
		str += rs.getString("LIS_FLR");
		str += "</span>";
		str += "<span class='item_text'>";
		str += rs.getString("LIS_RM_NO");
		str += "</span>";
		str += "<span class='item_text'>";
		str += rs.getString("LIS_CMN_AREA");
		str += "</span>";
		str += "<span class='item_text'>";
		str += rs.getString("LIS_BR_NO");
		str += "</span>";
		str += "<span class='item_price'>";
		str += rs.getInt("LIS_RENT");
		str += "</span>";
		str += "</a><a class='btn btn-buy' href=\"/CFA104G5/sec_items/ShoppingServlet.do?shID=";
		str += rs.getInt("sh_id");
		str += "&shName=";
		str += rs.getString("sh_name");
		str += "&shPrice=";
		str += rs.getInt("sh_price");
		str += "&shQTY=1&action=ADD\"";
		str += ">詳情</a>";
		str += "</li>";
	}
	
// 	<li>
// 		<a href="/CFA104G5/sec_items/GetSecItemsServlet.do?shID=1&action=getOne_For_Display">
// 	   	 	<div class="img_block">
// 	    	    <img src="/CFA104G5/sec_pics/SecPicsReader.do?sh_id=1">
// 	    	</div>
// 	   	 <span class="item_text">三菱16L高效節能清淨除濕機 MJ-E160HN-TW</span>
// 	   	 <span class="item_price">$9000</span>
// 			 </a>
// 		<a class="btn btn-buy" href="/CFA104G5/sec_items/ShoppingServlet.do?shID=1&shName=三菱16L高效節能清淨除濕機 MJ-E160HN-TW&shPrice=9000&shQTY=1&action=ADD">加入購物車</a>
// 	</li>	
	
	
	out.print(str);
	
	rs.close();
	pstmt.close();
	con.close();
%>