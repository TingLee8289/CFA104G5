<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ezs.ren_appointment.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
RenAppointmentVO renAppointmentVO = (RenAppointmentVO) request.getAttribute("renAppointmentVO");
%>

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
			<th>預約訂單編號</th>
			<th>會員編號</th>
			<th>房東編號</th>
			<th>房源編號</th>
			<th>預約單狀態</th>
			<th>預約時間</th>
			<th>修改</th>
			<th>刪除</th>
			<!-- 		<th>預約訂單成立時間</th> -->
		</tr>
		<tr>
			<td>${renAppointmentVO.aptId}</td>
			<td><c:forEach var="renLisVO" items="${renLisSvc.all}">
                    <c:if test="${renFavoritesVO.favLisId==renLisVO.lisID}">
	                    ${renLisVO.lisTitle}
                    </c:if>
                </c:forEach>
			</td>
			<td>${renAppointmentVO.aptMemId}</td>
			<td>${renAppointmentVO.aptLddId}</td>
			<td>${renAppointmentVO.aptLisId}</td>
			<td>
				<c:if test="${renAppointmentVO.aptStatus == 0}">待確認預約</c:if>
				<c:if test="${renAppointmentVO.aptStatus == 1}">已確認預約</c:if>
				<c:if test="${renAppointmentVO.aptStatus == 2}">已取消</c:if>
			</td>
			<td>${renAppointmentVO.aptTime}</td>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" style="margin-bottom: 0px;">
					<input type="submit" value="修改"> 
					<input type="hidden" name="aptId" value="${renAppointmentVO.aptId}"> 
					<input type="hidden" name="action" value="getOne_For_Update">
				</FORM>
			</td>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" style="margin-bottom: 0px;">
					<input type="submit" value="刪除"> 
					<input type="hidden" name="aptId" value="${renAppointmentVO.aptId}"> 
					<input type="hidden" name="action" value="delete">
				</FORM>
			</td>
			<%-- 		<td>${renAppointmentVO.aptTimestamp}</td> --%>
		</tr>
	</table>
<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>
</body>
</html>