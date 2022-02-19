<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.sql.*"%>
<%@ page import="ezs.sec_items.model.*"%>
<%@ page import="ezs.sec_pics.model.*"%>
<%@ page import="ezs.sec_category.model.*"%>

<%
	SecPicsService secPicsSvc = new SecPicsService();
	List<SecPicsVO> secPicslist = secPicsSvc.getEachFirst();
	pageContext.setAttribute("secPicslist", secPicslist);
	
	SecCategoryService secCategorySvc = new SecCategoryService();
	List<SecCategoryVO> secCategorylist = secCategorySvc.getAll();
	pageContext.setAttribute("secCategorylist", secCategorylist);
	
	SecItemsService secItemsSvc = new SecItemsService();
	List<SecItemsVO> secItemslist = secItemsSvc.getAll();
	pageContext.setAttribute("secItemslist", secItemslist);
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	String URL = "jdbc:mysql://localhost:3306/CFA104G5";
	Connection con = DriverManager.getConnection(URL, "CFA104G5", "CFA104G5");

	String SQL = "SELECT * FROM `CFA104G5`.`SEC_ITEMS` WHERE sh_cate_id = ?";
	PreparedStatement pstmt = con.prepareStatement(SQL);
	Integer shCateID = Integer.valueOf(request.getParameter("shCateID"));
	pstmt.setInt(1, shCateID);
	ResultSet rs = pstmt.executeQuery();
	
	String str = "";
	while(rs.next()){
		str += "<li>";
		str += "<a href=\"/CFA104G5/sec_items/GetSecItemsServlet.do?shID=";
		str += rs.getInt("sh_id");
		str += "&action=getOne_For_Display\">";
		str += "<div class=\"img_block\">";
		str += "<img src =\"/CFA104G5/sec_pics/SecPicsReader.do?sh_id=";
		str += rs.getInt("sh_id")+"\">";
		str += "</div>";
		str += "<span class='item_text'>";
		str += rs.getString("sh_name");
		str += "</span>";
		str += "<span class='item_price'>";
		str += rs.getInt("sh_price");
		str += "</span>";
		str += "</a><a class='btn btn-buy' href=\"/CFA104G5/sec_items/ShoppingServlet.do?shID=";
		str += rs.getInt("sh_id");
		str += "&shName=";
		str += rs.getString("sh_name");
		str += "&shPrice=";
		str += rs.getInt("sh_price");
		str += "&shQTY=1&action=ADD\"";
		str += ">加入購物車</a>";
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