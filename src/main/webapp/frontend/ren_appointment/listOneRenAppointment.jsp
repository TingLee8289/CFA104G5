<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ezs.ren_appointment.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
RenAppointmentVO renAppointmentVO = (RenAppointmentVO) request.getAttribute("renAppointmentVO");
%>
<jsp:useBean id="memSvc" scope="page" class="ezs.member.model.MemberService" />
<jsp:useBean id="renLDDSvc" scope="page" class="ezs.ren_landlord.model.RenLandlordService" />
<jsp:useBean id="renLisSvc" scope="page" class="ezs.ren_listing.model.RenListingService" />


<html>
<head>
<title>預約訂單資料 - listOneRenAppointment.jsp</title>

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
	width: 600px;
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
<jsp:include page="/frontend/EZ_header.jsp"></jsp:include>


	<table id="table-1">
		<tr><td>
			<h3>預約訂單資料 - listOneRenAppointment.jsp</h3>
			<h4><a href="frontend/ren_appointment/select_page.jsp">回首頁</a></h4>
		</td></tr>
	</table>

	<table>	
		<tr>
			<td>預約訂單編號:</td>
			<td><%=renAppointmentVO.getAptId()%></td>
		</tr>
		<tr>	
			<td>預約會員:</td>
			<td><c:forEach var="memVO" items="${memSvc.all}">
					<c:if test="${renAppointmentVO.aptMemId==memVO.memID}">
	                    【${memVO.memID}】 - ${memVO.memUsername}
                    </c:if></c:forEach></td>
		</tr>
		<tr>
			<td>房東:</td>
			<td><c:forEach var="renLDDVO" items="${renLDDSvc.all}">
					<c:if test="${renAppointmentVO.aptLddId==renLDDVO.lddId}">
						<c:forEach var="memVO" items="${memSvc.all}">
							<c:if test="${memVO.memID==renLDDVO.lddMemId}">
		                    【${memVO.memID}】 - ${memVO.memUsername}
	                    </c:if></c:forEach></c:if></c:forEach></td>
		</tr>
		<tr>
			<td>房源:</td>
			<td><c:forEach var="renLisVO" items="${renLisSvc.all}">
					<c:if test="${renAppointmentVO.aptLisId==renLisVO.lisID}">
	                    【${renLisVO.lisID}】 - ${renLisVO.lisTitle}
                    </c:if></c:forEach></td>
		</tr>
		<tr>
			<td>預約單狀態:</td>
			<td>
				<c:if test="${renAppointmentVO.aptStatus == 1}">已確認預約</c:if> 
				<c:if test="${renAppointmentVO.aptStatus == 2}">已取消</c:if>
				<c:if test="${renAppointmentVO.aptStatus == 3}">預約時間已變更</c:if></td>
		</tr>
		<tr>
			<td>預約時間:</td>
			<td>${renAppointmentVO.aptTime}</td>
		</tr>
		</table>
		
<!-- 		<br> -->
<%-- 			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" style="margin-bottom: 0px;"> --%>
<!-- 				<input type="submit" value="修改">  -->
<%-- 				<input type="hidden" name="aptId" value="${renAppointmentVO.aptId}">  --%>
<!-- 				<input type="hidden" name="action" value="getOne_For_Update"> -->
<!-- 			</FORM> -->
<!-- 		<br> -->
		
<%-- 			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" style="margin-bottom: 0px;"> --%>
<!-- 				<input type="submit" value="取消預約">  -->
<%-- 				<input type="hidden" name="aptId" value="${renAppointmentVO.aptId}">  --%>
<!-- 				<input type="hidden" name="action" value="cancel">				 -->
<!-- 			</FORM> -->
		
<!-- 		<br> -->
<%-- 			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" style="margin-bottom: 0px;"> --%>
<!-- 				<input type="submit" value="刪除預約單">  -->
<%-- 				<input type="hidden" name="aptId" value="${renAppointmentVO.aptId}">  --%>
<!-- 				<input type="hidden" name="action" value="delete"> -->
<!-- 			</FORM> -->
		
			
	
<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>
</body>
</html>