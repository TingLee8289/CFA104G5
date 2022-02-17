<%@ page language="java"  contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
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

	String SQL = "SELECT sh_id FROM `CFA104G5`.`SEC_ITEMS` WHERE sh_cate_id = ?";
	PreparedStatement pstmt = con.prepareStatement(SQL);
// 	Integer shCateID = Integer.valueOf(request.getParameter("shCateID"));
// 	pstmt.setInt(1, shCateID);
	pstmt.setInt(1, 1);
	ResultSet rs = pstmt.executeQuery();
	
	String str = "";
	while(rs.next()){
		str += (str == "") ? rs.getString("sh_id") : "," + rs.getString("sh_id");
	}
	
	out.print(str);
	
	rs.close();
	pstmt.close();
	con.close();


// 	SecPicsService secPicsSvc = new SecPicsService();
// 	List<SecPicsVO> secPicslist = secPicsSvc.getEachFirst();
// 	pageContext.setAttribute("secPicslist", secPicslist);
	
// 	SecCategoryService secCategorySvc = new SecCategoryService();
// 	List<SecCategoryVO> secCategorylist = secCategorySvc.getAll();
// 	pageContext.setAttribute("secCategorylist", secCategorylist);
	
// 	SecItemsService secItemsSvc = new SecItemsService();
// 	List<SecItemsVO> secItemslist = secItemsSvc.getAll();
// 	pageContext.setAttribute("secItemslist", secItemslist);

%>