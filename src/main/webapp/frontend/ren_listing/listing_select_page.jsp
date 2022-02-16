<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�䯲��</title>

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
	<tr><td><h3>�䯲��</h3></td></tr>
</table>

<p>This is the Home page for CFA104G5_20220129 Listing: Home</p>

<h3>���M�з�</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
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
      	<b>��J�з�ID:</b>
      	<input type="text" name="lisID">
      	<input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" name="�e�X">      
      </FORM>
     </li>
     
     <jsp:useBean id="renListingSvc" scope="page" class="ezs.ren_listing.model.RenListingService"/>
     
     <li>
     	<FORM METHOD="post" ACTION="listing.do">
     	  <b>��ܩз�ID:</b>
     	  <select size="1" name="lisID">
     		<c:forEach var="renListingVO" items="${renListingSvc.all}">
     		  <option value="${renListingVO.lisID}">${renListingVO.lisID}
     		</c:forEach>
     	  </select>
     	  <input type="hidden" name="action" value="getOne_For_Display">
     	  <input type="submit" value="�e�X">
       </FORM>
	</li>
</ul>

<h3>�ڭn�Z�n</h3>
<ul>
	<li><a href='addListing.jsp'>�ڭn�Z�n</a>�s�з�</li>
</ul>


</body>
</html>