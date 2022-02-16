<<<<<<< HEAD
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>æ‰¾ç§Ÿå±‹</title>

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
	<tr><td><h3>æ‰¾ç§Ÿå±‹</h3></td></tr>
</table>

<p>This is the Home page for CFA104G5_20220129 Listing: Home</p>

<h3>æ”¶å°‹æˆ¿æº</h3>

<%-- éŒ¯èª¤è¡¨åˆ— --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">è«‹ä¿®æ­£ä»¥ä¸‹éŒ¯èª¤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
	<li><a href='listAllListing.jsp'>List</a> all Listing.  <br><br></li>

    <li>
      <FORM METHOD="post" ACTION="RenListingServlet.do">
      	<b>è¼¸å…¥æˆ¿æºID:</b>
      	<input type="text" name="lisID">
      	<input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" name="é€å‡º">      
      </FORM>
     </li>
     
     <jsp:useBean id="renListingSvc" scope="page" class="ezs.ren_listing.model.RenListingService"/>
     
     <li>
     	<FORM METHOD="post" ACTION="RenListingServlet.do">
     	  <b>é¸æ“‡æˆ¿æºID:</b>
     	  <select size="1" name="lisID">
     		<c:forEach var="renListingVO" items="${renListingSvc.all}">
     		  <option value="${renListingVO.lisID}">${renListingVO.lisID}
     		</c:forEach>
     	  </select>
     	  <input type="hidden" name="action" value="getOne_For_Display">
     	  <input type="submit" value="é€å‡º">
       </FORM>
	</li>
</ul>

<h3>æˆ‘è¦åˆŠç™»</h3>
<ul>
	<li><a href='addListing.jsp'>æˆ‘è¦åˆŠç™»</a>æ–°æˆ¿æº</li>
=======
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>§ä¯²«Î</title>

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
	<tr><td><h3>§ä¯²«Î</h3></td></tr>
</table>

<p>This is the Home page for CFA104G5_20220129 Listing: Home</p>

<h3>¦¬´M©Ğ·½</h3>

<%-- ¿ù»~ªí¦C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">½Ğ­×¥¿¥H¤U¿ù»~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
	<li><a href='listAllListing.jsp'>List</a> all Listing.  <br><br></li>

    <li>
      <FORM METHOD="post" ACTION="listing.do">
      	<b>¿é¤J©Ğ·½ID:</b>
      	<input type="text" name="lisID">
      	<input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" name="°e¥X">      
      </FORM>
     </li>
     
     <jsp:useBean id="renListingSvc" scope="page" class="ezs.ren_listing.model.RenListingService"/>
     
     <li>
     	<FORM METHOD="post" ACTION="listing.do">
     	  <b>¿ï¾Ü©Ğ·½ID:</b>
     	  <select size="1" name="lisID">
     		<c:forEach var="renListingVO" items="${renListingSvc.all}">
     		  <option value="${renListingVO.lisID}">${renListingVO.lisID}
     		</c:forEach>
     	  </select>
     	  <input type="hidden" name="action" value="getOne_For_Display">
     	  <input type="submit" value="°e¥X">
       </FORM>
	</li>
</ul>

<h3>§Ú­n¥Zµn</h3>
<ul>
	<li><a href='addListing.jsp'>§Ú­n¥Zµn</a>·s©Ğ·½</li>
>>>>>>> refs/heads/master
</ul>


</body>
</html>