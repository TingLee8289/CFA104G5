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
		str += "<li style='list-style: none;'>";
		str += "<a href='/CFA104G5/sec_items/GetSecItemsServlet.do?shID=";
		str += rs.getInt("sh_id");
		str += "&action=getOneItem_For_Display'>";
		str += "<div class='img_block'>";
		str += "<img style='margin: 0px auto;' src ='/CFA104G5/sec_pics/SecPicsReader.do?sh_id=";
		str += rs.getInt("sh_id")+"'>";
		str += "</div>";
		str += "<span class='item_text'>";
		str += rs.getString("sh_name");
		str += "</span>";
		str += "<span class='item_price'>";
		str += rs.getInt("sh_price");
		str += "</span>";
		str += "</a>";
		str += "<form method='post' action='/CFA104G5/sec_items/ShoppingServlet.do'>";
		str += "<input type='submit' value='加入購物車' class='btn btn-outline-success text-nowrap'>";
		str += "<input type='hidden' name='shID' value='";
		str += rs.getInt("sh_id");;
		str += "'>";
		str += "<input type='hidden' name='shName' value='";
		str += rs.getString("sh_name");
		str += "'>";
		str += "<input type='hidden' name='shPrice' value='";
		str += rs.getInt("sh_price");
		str += "'>";
		str += "<input type='hidden' name='shQTY' value='1'>";
		str += "<input type='hidden' name='action' value='ADD'>";
		str += "</form>";
		str += "</li>";
		
		
	}
	
// 	<li style="list-style: none;">
//     <a href="/CFA104G5/sec_items/GetSecItemsServlet.do?shID=1&action=getOneItem_For_Display">
//         <div class="img_block">
//             <img style="margin: 0px auto;" src="/CFA104G5/sec_pics/SecPicsReader.do?sh_id=1">
//         </div>
//         <span class="item_text">電暖器</span>
//         <span class="item_price">$1100</span>
//     </a>
//     <form method="post" action="/CFA104G5/sec_items/ShoppingServlet.do">
//         <input type="submit" value="加入購物車" class="btn btn-outline-success text-nowrap">
//         <input type="hidden" name="shID" value="1">
//         <input type="hidden" name="shName" value="電暖器">
//         <input type="hidden" name="shPrice" value="1100">
//         <input type="hidden" name="shQTY" value="1">
//         <input type="hidden" name="action" value="ADD">
//     </form>
// </li>
	
	out.print(str);
	
	rs.close();
	pstmt.close();
	con.close();
%>