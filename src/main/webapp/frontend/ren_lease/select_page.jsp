<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="ezs.ren_lease.model.*"%>
<%@ page import="ezs.member.model.*"%>

<% request.setAttribute("memID", 7); 
%> 

 <%	
 	
	RenLeaseVO renLeaseVO =new RenLeaseVO();
	 RenLeaseService renLeaseSvc2 = new RenLeaseService();
    List<RenLeaseVO> list = renLeaseSvc2.getAll();
    pageContext.setAttribute("list",list);
	
	MemberService memberSvc = new MemberService();
	Integer memID = (Integer)(request.getAttribute("memID"));
	MemberVO memberVO = memberSvc.getOneMember(memID);
	pageContext.setAttribute("memberVO", memberVO);

	for(RenLeaseVO renLeaseVO1 : list) {
	int lseMemId = (Integer) renLeaseVO1.getLseMemId();
	int lseId = (Integer) renLeaseVO1.getLseId();
		if(lseMemId == memID){
		renLeaseVO = renLeaseSvc2.getOneRenLease(lseId);
		pageContext.setAttribute("renLeaseVO", renLeaseVO);
	}
} 
%>
<td>我是會員 <%= memID%> 號</td>


<html>
<head>
<title>RenLease: Home</title>
</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td><h3>租賃單首頁</h3></td>
		</tr>
	</table>

	<p>This is the Home page for Lease: Home</p>

	<h3>資料查詢:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	

	<ul>
		<li>
		<form action="<%=request.getContextPath()%>/ren_lease/RenLeaseServlet.do">
			<b>查看所有的租賃單</b>
			<input type="hidden" name="lseMemId"  value="${renLeaseVO.lseMemId}">
				<input type="hidden" name="action" value="getAllLease">
				<input type="submit" value="送出">
			</form></li>
				

 		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ren_lease/RenLeaseServlet.do">
				<b>輸入租賃單編號 :</b>
				<input type="text" name="lseId">
				<input type=hidden name="lseMemId"  value="${renLeaseVO.lseMemId}">
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
				

		<jsp:useBean id="renLeaseSvc" scope="page"
			class="ezs.ren_lease.model.RenLeaseService" />

		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ren_lease/RenLeaseServlet.do">
				<b>選擇租賃單編號 :</b>
				<select size="1" name="lseId">
					<c:forEach var="renLeaseVO" items="${renLeaseSvc.all}">
 					<c:if test="${renLeaseVO.lseMemId == memberVO.memID}">
 						<option value="${renLeaseVO.lseId}">${renLeaseVO.lseId}</option>
 					</c:if>
 					</c:forEach>
				</select>
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		
		
		
<!-- 		***** 房客租賃單 *** -->
		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ren_lease/RenLeaseServletMEM.do">
				<b>輸入會員編號 :</b>
				<input type="text" name="lseMemId">
				<input type="hidden" name="action" value="MEMgetOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		
		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ren_lease/RenLeaseServletMEM.do">
				<b>選擇會員編號 :</b>
				<select size="1" name="lseMemId">
					<option value="">請選擇</option>
					<c:forEach var="renLeaseVO" items="${renLeaseSvc.all}">
					<option value="${renLeaseVO.lseMemId}">${renLeaseVO.lseMemId}
					</c:forEach>
				</select>
				<input type="hidden" name="action" value="MEMgetOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		

	
		</ul>
		
	<h3>租賃單管理</h3>
	<ul>
		<li><a href='<%=request.getContextPath()%>/frontend/ren_lease/addLease.jsp'>加入</a>租賃單</li>
	</ul>

</body>
</html>