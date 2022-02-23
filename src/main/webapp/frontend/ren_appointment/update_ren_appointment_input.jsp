<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ren_appointment.model.*"%>

<%
	RenAppointmentVO renAppointmentVO = (RenAppointmentVO) request.getAttribute("renAppointmentVO");
%>


<jsp:useBean id="memSvc" scope="page" class="ezs.member.model.MemberService" />
<jsp:useBean id="renLDDSvc" scope="page" class="ezs.ren_landlord.model.RenLandlordService" />
<jsp:useBean id="renLisSvc" scope="page" class="ezs.ren_listing.model.RenListingService" />

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}
table, th, td {
	border: 0px solid #CCCCFF;
}
th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>
	<jsp:include page="/frontend/EZ_header.jsp"></jsp:include>

	<table id="table-1">
		<tr> <td>
				<h3>預約訂單資料修改</h3>
				<h4> <a href="<%=request.getContextPath()%>/frontend/ren_appointment/select_page.jsp">回首頁</a></h4>
			</td>
		</tr>
	</table>

	<h3>資料修改:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/RenAppointmentServlet.do" name="form1">
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
                    </c:if>
					</c:forEach></td>
			</tr>
			<tr>
				<td>房東:</td>
				<td><c:forEach var="renLDDVO" items="${renLDDSvc.all}">
						<c:if test="${renAppointmentVO.aptLddId==renLDDVO.lddId}">
							<c:forEach var="memVO" items="${memSvc.all}">
								<c:if test="${memVO.memID==renLDDVO.lddMemId}">
	                    【${memVO.memID}】 - ${memVO.memUsername}
	                    </c:if>
							</c:forEach>
						</c:if>
					</c:forEach></td>
			</tr>
			<tr>
				<td>房源:</td>
				<td><c:forEach var="renLisVO" items="${renLisSvc.all}">
						<c:if test="${renAppointmentVO.aptLisId==renLisVO.lisID}">
	                    【${renLisVO.lisID}】 - ${renLisVO.lisTitle}
                    </c:if>
					</c:forEach></td>
			<tr>
				<td>預約單狀態:</td>
				<td>
					<c:if test="${renAppointmentVO.aptStatus == 0}">預約確認中</c:if> 
					<c:if test="${renAppointmentVO.aptStatus == 1}">已確認預約</c:if> 
					<c:if test="${renAppointmentVO.aptStatus == 2}">已取消</c:if>
					<c:if test="${renAppointmentVO.aptStatus == 3}">預約時間已變更</c:if></td>
			</tr>
			<tr>
				<td>預約時間:</td>
				<td><input name="aptTime" id="f_date1" type="text" ></td>
			</tr>
		</table>

		<br> 
		<input type="hidden" name="action" value="update"> 
		<input type="hidden" name="aptId" value="<%=renAppointmentVO.getAptId()%>">
		<input type="hidden" name="aptMemId" value="<%=renAppointmentVO.getAptMemId()%>">
		<input type="hidden" name="aptLddId" value="<%=renAppointmentVO.getAptLddId()%>">
		<input type="hidden" name="aptLisId" value="<%=renAppointmentVO.getAptLisId()%>">
		<input type="hidden" name="aptTime" value="<%=renAppointmentVO.getAptTime()%>">
		<input type="submit" value="送出修改">
		
	</FORM>
	
	<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>

</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}
.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:true,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
 		   value: '<%=renAppointmentVO.getAptTime()%>', //value:new Date(),
	});
</script>
</html>