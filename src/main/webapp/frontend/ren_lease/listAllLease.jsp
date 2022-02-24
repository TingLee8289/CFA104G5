<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ren_lease.model.*"%>
<%@ page import="ezs.member.model.*"%>

<% request.setAttribute("memID", 7); 
%>
<%
MemberService memberSvc = new MemberService();
Integer memID = (Integer)(request.getAttribute("memID"));
MemberVO memberVO = memberSvc.getOneMember(memID);
pageContext.setAttribute("memberVO", memberVO);
List<MemberVO> list2= memberSvc.getAll(); 
pageContext.setAttribute("list2", list2);

RenLeaseVO renLeaseVO =new RenLeaseVO();
Integer lse_mem_id = (Integer)(request.getAttribute("lseMemId"));
lse_mem_id = memID;
RenLeaseService renLeaseSrv =new RenLeaseService();
List<RenLeaseVO> list1= renLeaseSrv.getAllLease(lse_mem_id);
pageContext.setAttribute("list", list1);
System.out.println(list1.size());

%>

<html>
<head>
<title>EASY SPACE</title>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>所有租賃單資料</h3>
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
		<th>刪除</th>
	</tr>
<%-- 	<%@ include file="page1.file" %>  --%>
 	
<%-- 	<c:forEach var="renLeaseVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"> --%>
		<c:forEach var="renLeaseVO" items="${list}">
		<tr>
			<td>${renLeaseVO.lseId}</td>
			<td>${renLeaseVO.lseLeaseMemId}</td>
			<td>
			<c:forEach var="memberVO" items="${list2}">			
			<c:if test="${renLeaseVO.lseLeaseMemId == memberVO.memID}">${memberVO.memName}</c:if>
			</c:forEach>
			</td>
			<td>${renLeaseVO.lseLisId}</td>
			<td>${renLeaseVO.lseLddId}</td>
			<td>${renLeaseVO.lsePrice}</td>
			<td>${renLeaseVO.lseStatus}</td>
			<td>${renLeaseVO.lseStart}</td>
			<td>${renLeaseVO.lseEnd}</td>
			<td><img src="<%= request.getContextPath() %>/ren_lease/LeasePicReader.do?lseId=${renLeaseVO.lseId}" width="130" height="150" class="item-images" style=" margin: auto;"></td>
			<td>${renLeaseVO.lseTimestamp}</td> 
			
<%-- 			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ren_lease/RenLeaseServlet.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="lseId"  value="${renLeaseVO.lseId}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td> --%>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ren_lease/RenLeaseServlet.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="lseId"  value="${renLeaseVO.lseId}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%-- <%@ include file="page2.file" %> --%>

</body>
</html>