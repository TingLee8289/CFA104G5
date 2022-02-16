<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<title>IBM Emp: Home</title>
</head>

<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>IBM Emp: Home</h3></td></tr>
</table>

<h3>資料查詢:</h3>
	
錯誤表列
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllLandlord.jsp'>List</a> all landlords  <br><br></li>
  
  <jsp:useBean id="renlandlordSvc" scope="page" class="ezs.ren_landlord.model.RenLandlordService" />
   
  <li>
     <FORM METHOD="post" ACTION="renlandlord.do" >
       <b>選擇房東編號:</b>
       <select size="1" name="lddId">
         <c:forEach var="renLandlordVO" items="${renlandlordSvc.all}" > 
          <option value="${renLandlordVO.lddId}">${renLandlordVO.lddId}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
</ul> 

</body>
</html>