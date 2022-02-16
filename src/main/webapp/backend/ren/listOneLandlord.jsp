<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="ezs.ren_landlord.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
RenLandlordVO renLandlordVO = (RenLandlordVO) request.getAttribute("renLandlordVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>

<head>
<title>房東資料 - listOneLandlord.jsp</title>
</head>

<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>員工資料 - ListOneLandlord.jsp</h3>
		 <h4><a href="select.jsp"><img src="<%=request.getContextPath() %>/images/ren/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>房東編號</th>
		<th>會員編號</th>
		<th>審核狀態</th>
	</tr>
	<tr>
		<td><%=renLandlordVO.getLddId()%></td>
		<td><%=renLandlordVO.getLddMemId()%></td>
		<td><%=renLandlordVO.getLddApproval()%></td>
</table>

</body>
</html>