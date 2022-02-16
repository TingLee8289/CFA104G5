<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ren_landlord.model.*"%>

<%
RenLandlordVO renLandlordVO = (RenLandlordVO) request.getAttribute("renLandlordVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>房東資料修改 - update_landlord_input.jsp</title>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>員工資料修改 - update_landlord_input.jsp</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/backend/ren/select.jsp"><img
						src="<%=request.getContextPath()%>/images/ren/back_icon.png"
						width="60" height="60" border="0">回首頁</a>
				</h4>
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

	<FORM METHOD="post"
		ACTION="<%=request.getContextPath()%>/ren_landlord/RenLandlordServlet.do"
		name="form1">
		<table>
			<tr>
				<td>房東編號:<font color=red><b>*</b></font></td>
				<td><%=renLandlordVO.getLddId()%></td>
			</tr>
			<tr>
				<td>會員編號:</td>
				<td><input type="TEXT" name="lddMemId" size="45"
					value="<%=renLandlordVO.getLddMemId()%>" /></td>
			</tr>
 			<tr>
				<td>審核狀態:</td>
				<td><select name="lddApproval">
						<option value="0"
							<c:if test="${renLandlordVO.lddApproval == 0}">selected</c:if>>審核中</option>
						<option value="1"
							<c:if test="${renLandlordVO.lddApproval == 1}">selected</c:if>>審核未過</option>
						<option value="2"
							<c:if test="${renLandlordVO.lddApproval == 2}">selected</c:if>>審核已過</option>
				</select></td>
			</tr> 
		</table>

		<br> 
		<input type="hidden" name="action" value="update"> 
		<input type="hidden" name="lddId" value="<%=renLandlordVO.getLddId()%>">
		<input type="submit" value="送出修改">
	</FORM>
</body>
</html>