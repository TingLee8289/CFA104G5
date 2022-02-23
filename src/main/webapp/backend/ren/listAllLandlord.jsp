<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ren_landlord.model.*"%>
<%@ page import="ezs.member.model.*"%>


<%
RenLandlordService renlandlordSvc = new RenLandlordService();
List<RenLandlordVO> list = renlandlordSvc.getAll();
pageContext.setAttribute("list", list);
%>
<%
MemberService memberSvc = new MemberService();
List<MemberVO> list2 = memberSvc.getAll();
pageContext.setAttribute("list2", list2);
%>


<html>
<head>
<title>所有申請房東資料 - listAllLandlord.jsp</title>
<style>
html {
    font-family: sans-serif;
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%;
}
 
body {
    margin: 10px;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}
 
td,th {
    padding: 0;
}
 
.pure-table {
    border-collapse: collapse;
    border-spacing: 0;
    empty-cells: show;
    border: 1px solid #cbcbcb;
}
 
.pure-table caption {
    color: #000;
    font: italic 85%/1 arial,sans-serif;
    padding: 1em 0;
    text-align: center;
}
 
.pure-table td,.pure-table th {
    border-left: 1px solid #cbcbcb;
    border-width: 0 0 0 1px;
    font-size: inherit;
    margin: 0;
    overflow: visible;
    padding: .5em 1em;
}
 
.pure-table thead {
    background-color: #e0e0e0;
    color: #000;
    text-align: left;
    vertical-align: bottom;
}
 
.pure-table td {
    background-color: transparent;
}
</style>
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

	<table class="pure-table"> 
		<thead>
		<tr>
			<th>房東編號</th>
			<th>會員編號</th>
			<th>會員名稱</th>
			<th>申請照片</th>
			<th>審核狀態</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
		</thead>
		<tbody>
		<%@ include file="page1.file"%>
		<c:forEach var="renLandlordVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td>${renLandlordVO.lddId}</td>
				<td>${renLandlordVO.lddMemId}</td>
				<td>
					<c:forEach var="memberVO" items="${list2}">
					<c:if test="${renLandlordVO.lddMemId == memberVO.memID}">${memberVO.memName}</c:if>
					</c:forEach>
				</td>	
				<td><img src="<%= request.getContextPath() %>/ren_landlord/LddPicReader?lddId=${renLandlordVO.lddId}" width="130" height="150" class="item-images" style=" margin: auto;" ></td>
				
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
							name="lddId" value="${renLandlordVO.lddId}">
							 <input	type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<%@ include file="page2.file"%>

</body>
</html>