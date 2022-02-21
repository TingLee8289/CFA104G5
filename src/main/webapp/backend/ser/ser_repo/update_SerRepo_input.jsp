<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_repo.model.*"%>

<%
SerRepVO serRepVO = (SerRepVO) request.getAttribute("serRepVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>檢舉單修改</title>

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
	width: 520px;
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
<body>
	<jsp:include page="/frontend/EZ_header.jsp"></jsp:include>
	<table id="table-1">
		<tr>
			<td>
				<h3>檢舉單審核</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/backend/ser/ser_repo/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3> </h3>
	<h4></h4>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post"
		ACTION="<%=request.getContextPath()%>/ser_repo/UpdateSerRepoServlet.do"
		name="form1">
		<table>
			<tr>
				<td>檢舉編號:<font color=red><b>*</b></font></td>
				<td><%=serRepVO.getRpID()%></td>

			</tr>
			<tr>
				<td>訂單編號:</td>
				<td><%=serRepVO.getRpOrdID()%></td>
			</tr>

			<tr>
				<td>會員編號:</td>
				<td><%=serRepVO.getRpMemID()%></td>

			</tr>


			<tr>
				<td>檢舉時間:</td>
				<td><%=serRepVO.getRpDate()%></td>

			</tr>


			<tr>
				<td>檢舉狀態:</td>
				<td>
				<input type="radio" name="rpStatus" value="0"<%=(serRepVO.getRpStatus() == 0) ? "checked" : ""%> />未通過 
				<input type="radio" name="rpStatus" value="1" <%=(serRepVO.getRpStatus() == 1) ? "checked" : ""%> />通過
				</td>

			</tr>
			<tr>
				<td>檢舉內容:</td>
				<td><%=serRepVO.getRpTxt()%></td>
			</tr>





		</table>
		<br> <input type="hidden" name="action" value="update"> 
		<input type="hidden" name="rpID" value="<%=serRepVO.getRpID()%>"> 
		<input	type="hidden" name="rpMemID" value="<%=serRepVO.getRpMemID()%>"> 
		<input	type="hidden" name="rpOrdID" value="<%=serRepVO.getRpOrdID()%>"> 
		<input	type="hidden" name="rpDate" value="<%=serRepVO.getRpDate()%>"> 
		<input	type="hidden" name="rpTxt" value="<%=serRepVO.getRpTxt()%>"> 
		<input type="submit" value="送出修改">
	</FORM>

	<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>
</body>




</html>