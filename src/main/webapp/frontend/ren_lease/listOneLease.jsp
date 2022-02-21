<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ezs.ren_lease.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
RenLeaseVO renLeaseVO = (RenLeaseVO) request.getAttribute("renLeaseVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>租賃單資料 - listOnelease.jsp</title>



</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>租賃單資料 - listOnelease.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/frontend/ren_lease/select_page.jsp"><img src="<%=request.getContextPath()%>/images/ren/back_icon.png" width="60" height="60" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>租賃訂單編號</th>
		<th>會員編號</th>
		<th>房東編號</th>
		<th>房源編號</th>
		<th>租金</th>
		<th>租賃訂單狀態</th>
		<th>租賃開始時間</th>
		<th>租賃結束時間</th>
		<th>房客評價房東星數</th>
		<th>房客評價房東內容</th>
		<th>房東評價房客星數</th>
		<th>房東評價房客內容</th>
		<th>租賃訂單成立時間</th>
	</tr>
	<tr>
		<td><%=renLeaseVO.getLseId()%></td>
		<td><%=renLeaseVO.getLseMemId()%></td>
		<td><%=renLeaseVO.getLseLisId()%></td>
		<td><%=renLeaseVO.getLseLddId()%></td>
		<td><%=renLeaseVO.getLsePrice()%></td>
		<td><%=renLeaseVO.getLseStatus()%></td>
		<td><%=renLeaseVO.getLseStart()%></td>
		<td><%=renLeaseVO.getLseEnd()%></td>
		<td><%=renLeaseVO.getLseLddScore()%></td>
		<td><%=renLeaseVO.getLseLddTxt()%></td>
		<td><%=renLeaseVO.getLseTntScore()%></td>
		<td><%=renLeaseVO.getLseTntTxt()%></td>
		<td><%=renLeaseVO.getLseTimestamp()%></td>
	</tr>
</table>

</body>
</html>