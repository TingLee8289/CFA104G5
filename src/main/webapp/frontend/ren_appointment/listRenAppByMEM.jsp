<%@page import="ezs.ren_listing.model.RenListingService"%>
<%@page import="ezs.member.model.MemberService"%>
<%@page import="ezs.ren_landlord.model.RenLandlordService"%>
<%@page import="ezs.member.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ren_appointment.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	Integer aptMemId = (Integer)session.getAttribute("memID");
	RenAppointmentService renAppSvc = new RenAppointmentService();
    List<RenAppointmentVO> list = renAppSvc.getAllMEM(aptMemId);
    pageContext.setAttribute("list",list);
 
%>

<jsp:useBean id="memSvc" scope="page" class="ezs.member.model.MemberService" />
<jsp:useBean id="renLDDSvc" scope="page" class="ezs.ren_landlord.model.RenLandlordService" />
<jsp:useBean id="renLisSvc" scope="page" class="ezs.ren_listing.model.RenListingService" />


<html>
<head>
<script src="https://kit.fontawesome.com/1c2ccc4859.js" crossorigin="anonymous"></script>
<title>EASY SPACE</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
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

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>
<% %>
<table id="table-1">
	<tr><td>
		 <h3>房客預約訂單管理</h3>
		 <h4><a href="<%=request.getContextPath()%>/frontend/ren_appointment/select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>預約訂單編號</th>
		<th>房東</th>
		<th>房東評分</th>
		<th>房源</th>
		<th>預約單狀態</th>
		<th>預約時間</th>
		<th>確認</th>
		<th>修改</th>
		<th>取消預約</th>
		<th>刪除預約單</th>
	</tr>
	<c:forEach var="renAppointmentVO" items="${list}">
		<tr align='center' valign='middle'>
			<td>${renAppointmentVO.aptId}</td>		
			
			<td><c:forEach var="renLDDVO" items="${renLDDSvc.all}">
                    <c:if test="${renAppointmentVO.aptLddId==renLDDVO.lddId}">
                    	<c:forEach var="memVO" items="${memSvc.all}">
                    	 <c:if test="${memVO.memID==renLDDVO.lddMemId}">
	                    【${memVO.memID}】 - ${memVO.memUsername}
	                    </c:if> </c:forEach>
                    </c:if> </c:forEach>
			</td>
			<td><c:forEach var="renLDDVO" items="${renLDDSvc.all}">
					<c:if test="${renAppointmentVO.aptLddId==renLDDVO.lddId}">
                    	<c:forEach var="memVO" items="${memSvc.all}">
                    		<c:if test="${memVO.memID==renLDDVO.lddMemId}">
                    		<c:choose>
								<c:when test="${(memVO.memRedCount) == 0}">尚無評分</c:when>
							<c:otherwise>
								<fmt:formatNumber type="number" maxFractionDigits="1" 
									value="${(memVO.memRedScore/memVO.memRedCount)}"/>
							</c:otherwise></c:choose></c:if> </c:forEach> </c:if> </c:forEach></td>
			
			<td><c:forEach var="renLisVO" items="${renLisSvc.all}">
                    <c:if test="${renAppointmentVO.aptLisId==renLisVO.lisID}">
	                    【${renLisVO.lisID}】 - ${renLisVO.lisTitle}
                    </c:if>
                </c:forEach>
			</td>
			
			<td>
				<c:if test="${renAppointmentVO.aptStatus == 0}">預約確認中</c:if> 
				<c:if test="${renAppointmentVO.aptStatus == 1}">已確認預約</c:if>
				<c:if test="${renAppointmentVO.aptStatus == 2}">已取消</c:if>
				<c:if test="${renAppointmentVO.aptStatus == 3}">預約時間已變更</c:if>
			</td>
			
			<td>${renAppointmentVO.aptTime}</td>		
				
			<td>
			<c:if test="${renAppointmentVO.aptStatus != 2 and renAppointmentVO.aptStatus != 1}">
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" style="margin-bottom: 0px;">
<!-- 					<input type="submit" value="確認"> 			 -->
					<input type="hidden" name="aptId" value="${renAppointmentVO.aptId}"> 
					<input type="hidden" name="aptMemId" value="${renAppointmentVO.aptMemId}"> 
					<input type="hidden" name="aptLddId" value="${renAppointmentVO.aptLddId}"> 
					<input type="hidden" name="aptLisId" value="${renAppointmentVO.aptLisId}"> 
					<input type="hidden" name="aptStatus" value="${renAppointmentVO.aptStatus}"> 
					<input type="hidden" name="aptTime" value="${renAppointmentVO.aptTime}"> 
					<input type="hidden" name="action" value="MemConfirm">
					<button id ="submit" onclick="submit"><i class="fa-solid fa-check"></i></button> 
				</FORM></c:if>
			</td>
			<td>
			<c:if test="${renAppointmentVO.aptStatus != 2}">
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" style="margin-bottom: 0px;">
<!-- 					<input type="submit" value="修改">  -->
					<input type="hidden" name="aptId" value="${renAppointmentVO.aptId}"> 
					<input type="hidden" name="action" value="getOne_For_Update">
					<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
					<button id ="submit" onclick="submit"><i class="fa-solid fa-pen-to-square"></i></button> 
				</FORM></c:if>
			</td>
			<td><c:if test="${renAppointmentVO.aptStatus != 2}">
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" style="margin-bottom: 0px;">
<!-- 					<input type="submit" value="取消預約">  -->
					<input type="hidden" name="aptId" value="${renAppointmentVO.aptId}"> 
					<input type="hidden" name="aptMemId" value="${renAppointmentVO.aptMemId}"> 
					<input type="hidden" name="aptLddId" value="${renAppointmentVO.aptLddId}"> 
					<input type="hidden" name="aptLisId" value="${renAppointmentVO.aptLisId}"> 
					<input type="hidden" name="aptStatus" value="${renAppointmentVO.aptStatus}"> 
					<input type="hidden" name="aptTime" value="${renAppointmentVO.aptTime}"> 
					<input type="hidden" name="action" value="MemCancel">
					<button id ="submit" onclick="submit"><i class="fa-solid fa-xmark"></i></button> 
				</FORM></c:if>
			</td>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" style="margin-bottom: 0px;">
<!-- 					<input type="submit" value="刪除預約單">  -->
					<input type="hidden" name="aptId" value="${renAppointmentVO.aptId}"> 
					<input type="hidden" name="action" value="delete">
					<button id ="submit" onclick="submit"><i class="fa-solid fa-trash"></i></button> 
				
				</FORM>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>