<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ren_landlord.model.*"%>
<%@ page import="ezs.member.model.*"%>
<%@ page import="java.util.*"%>


<%
MemberService memberSvc = new MemberService();
List<MemberVO> list2 = memberSvc.getAll();
pageContext.setAttribute("list2", list2);
%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
RenLandlordVO renLandlordVO = (RenLandlordVO) request.getAttribute("renLandlordVO");
%>

<html>

<head>
<title>房東資料 - listOneLandlord.jsp</title>
</head>

<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>員工資料 - ListOneLandlord.jsp</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/backend/ren/select.jsp"><img
						src="<%=request.getContextPath()%>/images/ren/back_icon.png"
						width="60" height="60" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>房東編號</th>
			<th>會員編號</th>
			<th>會員名稱</th>
			<th>審核狀態</th>
		</tr>
		<tr>
			<td><%=renLandlordVO.getLddId()%></td>
			<td><%=renLandlordVO.getLddMemId()%></td>
					<td>
		<c:forEach var="memberVO" items="${list2}">
		<c:if test="${renLandlordVO.lddMemId == memberVO.memID}">${memberVO.memName}</c:if>
		</c:forEach>
		</td>	
			<td><c:if test="${renLandlordVO.lddApproval == 0}"><c:out value="審核中"/></c:if>
			<c:if test="${renLandlordVO.lddApproval == 1}"><c:out value="審核未過"/></c:if>
			<c:if test="${renLandlordVO.lddApproval == 2}"><c:out value="審核已過"/></c:if>
			</td>

	</table>

</body>
</html>