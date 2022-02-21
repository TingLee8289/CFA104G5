<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ren_lease.model.*"%>


<%
	RenLeaseService renLeaseSvc = new RenLeaseService();
    List<RenLeaseVO> list = renLeaseSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有租賃單資料 - listAllLease.jsp</title>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>所有租賃單資料 - listAllLease.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/frontend/ren_lease/select_page.jsp"><img src="<%=request.getContextPath()%>/images/ren/back_icon.png" width="60" height="60" border="0">回首頁</a></h4>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

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
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="renLeaseVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${renLeaseVO.lseId}</td>
			<td>${renLeaseVO.lseMemId}</td>
			<td>${renLeaseVO.lseLisId}</td>
			<td>${renLeaseVO.lseLddId}</td>
			<td>${renLeaseVO.lsePrice}</td>
			<td>${renLeaseVO.lseStatus}</td>
			<td>${renLeaseVO.lseStart}</td>
			<td>${renLeaseVO.lseEnd}</td>
			<td>${renLeaseVO.lseLddScore}</td>
			<td>${renLeaseVO.lseLddTxt}</td> 
			<td>${renLeaseVO.lseTntScore}</td>
			<td>${renLeaseVO.lseTntTxt}</td> 
			<td>${renLeaseVO.lseTimestamp}</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ren_lease/RenLeaseServlet.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="lseId"  value="${renLeaseVO.lseId}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ren_lease/RenLeaseServlet.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="lseId"  value="${renLeaseVO.lseId}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>