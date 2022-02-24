<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>EASY SPACE</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body>
<jsp:include page="/frontend/EZ_header.jsp"></jsp:include>

<table id="table-1">
   <tr><td><h3>Ren_Favorites: Home</h3></td></tr>
</table>

<p>This is the Home page for Ren_Favorites: Home</p>

<h3>資料查詢:</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
<!--   <li><a href='listAllRenFavorites.jsp'>List</a> all RenFavorites.  <br><br></li> -->
  
  <jsp:useBean id="renFavSvc" scope="page" class="ezs.ren_favorites.model.RenFavoritesService" />
 
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenFavoritesServlet.do" >
     
       <b>輸入會員編號:</b>
       <select size="1" name="fav_mem_id" >
          <option value="">
         <c:forEach var="renFavoritesVO" items="${renFavSvc.all}" > 
          <option value="${renFavoritesVO.favMemId}">${renFavoritesVO.favMemId}
         </c:forEach>   
       </select>
        
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>
  

</ul>


<h3>收藏管理</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/frontend/ren_favorites/addRenFavorites.jsp'>Add</a> a new RenFavorites.</li>
</ul>
<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>

</body>
</html>