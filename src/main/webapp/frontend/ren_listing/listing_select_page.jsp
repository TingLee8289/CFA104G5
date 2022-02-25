<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>找租屋</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #c27f29;
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
<body bgcolor='white'>

<table id="table-1">
	<tr><td><h3>找租屋</h3></td></tr>
</table>
<h3>收尋房源</h3>

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
<!-- 	<li>瀏覽房源<a href='listAllListing.jsp'>List</a> </li> -->

<!--     <li> -->
<!--       <FORM METHOD="post" ACTION="RenListingServlet.do"> -->
<!--       	<b>輸入房源ID:</b> -->
<!--       	<input type="text" name="lisID"> -->
<!--       	<input type="hidden" name="action" value="getOne_For_Display"> -->
<!--         <input type="submit" name="送出">       -->
<!--       </FORM> -->
<!--      </li> -->
     
<%--      <jsp:useBean id="renListingSvc" scope="page" class="ezs.ren_listing.model.RenListingService"/> --%>
     
<!--      <li> -->
<!--      	<FORM METHOD="post" ACTION="RenListingServlet.do"> -->
<!--      	  <b>選擇房源ID:</b> -->
<!--      	  <select size="1" name="lisID"> -->
<%--      		<c:forEach var="renListingVO" items="${renListingSvc.all}"> --%>
<%--      		  <option value="${renListingVO.lisID}">${renListingVO.lisID} --%>
<%--      		</c:forEach> --%>
<!--      	  </select> -->
<!--      	  <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--      	  <input type="submit" value="送出"> -->
<!--        </FORM> -->
<!-- 	</li>      -->
     <li>
     	<FORM METHOD="post" ACTION="RenListingServlet.do">
     	  <b>房東管理選擇房東ID:</b>
     	 <input type="text" name="lisLddID">
      	<input type="hidden" name="action" value="listRenListing_ByLisLddID">
        <input type="submit" name="送出">      
       </FORM>
	</li>
	<jsp:useBean id= "renLocationSvc" scope="page" class="ezs.ren_location.model.RenLocationService"/>
	<li>
     	<FORM METHOD="post" ACTION="RenLocationServlet.do">     	
     	  <b>選擇區域:</b>
     	  <select size="1" name="lisAreaID">
     		<c:forEach var="renLocationVO" items="${renLocationSvc.all}">
     		  <option value="${renLocationVO.locID}"${(renListingVO.lisAreaID == renLocationVO.locID)? 'selected':'' } >${renLocationVO.locCity}${renLocationVO.locDist}
     		</c:forEach>
     	  </select>
     	  <input type="hidden" name="action" value="listLocations_BylisAreaID">
     	  <input type="submit" value="送出">
       </FORM>
	</li>
</ul>

<h3>我要刊登</h3>
<ul>
	<li><a href='addListing.jsp'>我要刊登</a>新房源</li>

</ul>


</body>
</html>