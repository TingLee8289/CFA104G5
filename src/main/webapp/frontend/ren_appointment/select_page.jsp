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
<body bgcolor='white'>


<table id="table-1">
   <tr><td><h3>RenAppointment : Home</h3></td></tr>
</table>

<p>This is the Home page for RenAppointment : Home</p>

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
  
  <jsp:useBean id="renAppSvc" scope="page" class="ezs.ren_appointment.model.RenAppointmentService" />
 

<!--   <li> -->
<!--      <FORM METHOD="post"  -->
<%--      	ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" > --%>
<!--        <b>選擇預約訂單編號:</b> -->
<!--        <select size="1" name="aptId"> -->
<%--          <c:forEach var="renAppointmentVO" items="${renAppSvc.all}" >  --%>
<%--           <option value="${renAppointmentVO.aptId}">${renAppointmentVO.aptId} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--        <input type="submit" value="送出"> -->
<!--     </FORM> -->
<!--   </li> -->
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" >
       <b>查詢</b>
       <select size="1" name="aptMemId">
         <c:forEach var="renAppointmentVO" items="${renAppSvc.all}" > 
          <option value="${renAppointmentVO.aptMemId}">${renAppointmentVO.aptMemId}
         </c:forEach>   
       </select>
       <b>號會員預約單</b>
       <input type="hidden" name="action" value="listRenAppByMEM">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" 
     	ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" >
       <b>查詢</b>
       <select size="1" name="apt_ldd_id">
         <c:forEach var="renAppointmentVO" items="${renAppSvc.all}" > 
          <option value="${renAppointmentVO.aptLddId}">${renAppointmentVO.aptLddId}
         </c:forEach>   
       </select>
       <b>號房東預約單</b>
       <input type="hidden" name="action" value="listRenAppByLDD">
       <input type="submit" value="送出">
    </FORM>
  </li>


</ul>

<a href='<%=request.getContextPath()%>/frontend/ren_appointment/addRenAppointment.jsp'>Add</a> a new RenAppointment.

<!-- <ul>   -->
<!--   <li>    -->
<%--     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" name="form1"> --%>
<!--         <b>輸入預約會員編號:</b> -->
<!--         <input type="text" name="aptMemId" value=""><br>      -->
<!--         <input type="submit" value="送出"> -->
<!--         <input type="hidden" name="action" value="listEmps_ByCompositeQuery"> -->
<!--      </FORM> -->
<!--   </li> -->
<!-- </ul> -->


<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>
</body>
</html>