<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ren_landlord.model.*"%>

<%
RenLandlordVO renLandlordVO = (RenLandlordVO) request.getAttribute("renLandlordVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�ЪF��ƭק� - update_landlord_input.jsp</title>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>���u��ƭק� - update_landlord_input.jsp</h3>
				<h4>
					<a href="select.jsp"><img
						src="<%=request.getContextPath()%>/images/ren/back1.gif" width="100"
						height="32" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>��ƭק�:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post"
		ACTION="<%=request.getContextPath()%>/backend/ren/renlandlord.do"
		name="form1">
		<table>
			<tr>
				<td>�ЪF�s��:<font color=red><b>*</b></font></td>
				<td><%=renLandlordVO.getLddId()%></td>
			</tr>
			<tr>
				<td>�|���s��:</td>
				<td><input type="TEXT" name="lddMemId" size="45"
					value="<%=renLandlordVO.getLddMemId()%>" /></td>
			</tr>
			<tr>
				<td>�f�֪��A:</td>
				<td><input type="TEXT" name="lddApproval" size="45"
					value="<%=renLandlordVO.getLddApproval()%>" /></td>
			</tr>
		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="lddId" value="<%=renLandlordVO.getLddId()%>">
		<input type="submit" value="�e�X�ק�">
	</FORM>
</body>
</html>