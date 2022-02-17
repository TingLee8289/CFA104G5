<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ren_landlord.model.*"%>

<%
RenLandlordService renlandlordSvc = new RenLandlordService();
List<RenLandlordVO> list = renlandlordSvc.getAll();
pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>所有申請房東資料 - listAllLandlord.jsp</title>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>所有房東資料 - listAllLandlord.jsp</h3>
				<h4>
					<a href="select.jsp"><img
						src="<%=request.getContextPath()%>/images/ren/back_icon.png"
						width="60" height="60" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<table>
		<tr>
			<th>房東編號</th>
			<th>會員編號</th>
			<th>會員名稱</th>
			<th>審核狀態</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="renLandlordVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td>${renLandlordVO.lddId}</td>
				<td>${renLandlordVO.lddMemId}</td>
				<td></td>
				<td>
					<c:if test="${renLandlordVO.lddApproval == 0}">審核中</c:if>
					<c:if test="${renLandlordVO.lddApproval == 1}">審核未過</c:if> 
					<c:if test="${renLandlordVO.lddApproval == 2}">審核已過</c:if>
				</td>

				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/ren_landlord/RenLandlordServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="lddId" value="${renLandlordVO.lddId}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/ren_landlord/RenLandlordServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="lddId" value="${renLandlordVO.lddId}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>

</body>
</html>