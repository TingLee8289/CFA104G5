<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="ezs.ren_landlord.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
RenLandlordVO renLandlordVO = (RenLandlordVO) request.getAttribute("renLandlordVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>

<html>

<head>
<title>�ЪF��� - listOneLandlord.jsp</title>
</head>

<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>���u��� - ListOneLandlord.jsp</h3>
		 <h4><a href="select.jsp"><img src="<%=request.getContextPath() %>/images/ren/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�ЪF�s��</th>
		<th>�|���s��</th>
		<th>�f�֪��A</th>
	</tr>
	<tr>
		<td><%=renLandlordVO.getLddId()%></td>
		<td><%=renLandlordVO.getLddMemId()%></td>
		<td><%=renLandlordVO.getLddApproval()%></td>
</table>

</body>
</html>