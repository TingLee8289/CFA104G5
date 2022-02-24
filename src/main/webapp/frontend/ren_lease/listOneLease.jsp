<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ezs.ren_lease.model.*"%>
<%@ page import="ezs.member.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<%
RenLeaseVO renLeaseVO = (RenLeaseVO) request.getAttribute("renLeaseVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
RenLeaseService renLeaseSvc = new RenLeaseService();
List<RenLeaseVO> list = renLeaseSvc.getAll();
pageContext.setAttribute("list",list);
%>
 <%
 	MemberVO memberVO =(MemberVO) request.getAttribute("memberVO");
	MemberService memberSvc = new MemberService();
	List<MemberVO> list2= memberSvc.getAll(); 
	pageContext.setAttribute("list2", list2);
%>

<html>
<head>
<title>EASY SPACE</title>



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
		<th>房客會員編號</th>
		<th>房客名稱</th>
		<th>房東編號</th>
		<th>房源編號</th>
		<th>租金</th>
		<th>租賃訂單狀態</th>
		<th>租賃開始時間</th>
		<th>租賃結束時間</th>
		<th>租約照片<th>
		<th>租賃訂單成立時間</th>
	</tr>
	<tr>
		<td><%=renLeaseVO.getLseId()%></td>
		<td><%=renLeaseVO.getLseLeaseMemId()%></td>
			<td>
			<c:forEach var="memberVO" items="${list2}">			
			<c:if test="${renLeaseVO.lseLeaseMemId == memberVO.memID}">${memberVO.memName}</c:if>
			</c:forEach>
			</td>
		<td><%=renLeaseVO.getLseLisId()%></td>
		<td><%=renLeaseVO.getLseLddId()%></td>
		<td><%=renLeaseVO.getLsePrice()%></td>
		<td><%=renLeaseVO.getLseStatus()%></td>
		<td><%=renLeaseVO.getLseStart()%></td>
		<td><%=renLeaseVO.getLseEnd()%></td>
		<td><%=renLeaseVO.getLseTimestamp()%></td>
	</tr>
</table>

</body>
</html>