<%@page import="org.eclipse.jdt.internal.compiler.ast.IfStatement"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ren_lease.model.*"%>
<%@ page import="ezs.member.model.*"%>
<%@ page import="java.util.*"%>

<% request.setAttribute("memID", 7); 
//測試用，之後get方法要改成session.get...
%>

 <%	RenLeaseService renLeaseSvc = new RenLeaseService();
     List<RenLeaseVO> list = renLeaseSvc.getAll();
     pageContext.setAttribute("list",list); %> 

<% RenLeaseVO renLeaseVO =new RenLeaseVO(); %> 
<%-- <%= renLeaseVO==null %> --%>
<%
MemberService memberSvc = new MemberService();
Integer memID = (Integer)(request.getAttribute("memID"));
MemberVO memberVO= memberSvc.getOneMember(memID);
pageContext.setAttribute("memberVO", memberVO);
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>新增租賃單 - addLease.jsp</title>
</head>

<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>新增租賃單 - addLease.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/frontend/ren_lease/select_page.jsp"><img src="<%=request.getContextPath()%>/images/ren/back_icon.png" width="60" height="60" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ren_lease/RenLeaseServlet.do" name="form1">
<table>
	 <tr>
		<td>租客的會員編號</td>
		<td><input type="TEXT" name="lseId" size="45"></td>
	</tr>
	<tr>
		<td>房東編號</td>
		<td><input type="TEXT" name="lseId" size="45"></td> 
		
 	</tr>
	<tr>
		<td>房源編號</td>
		<td>
		<select size="1" name="lseLisId">
		<option value="">請選擇</option>
 		<c:forEach var="renLeaseVO" items="${list}"> 
 		<option value ="<c:if test="${memberVO.memID == renLeaseVO.lseMemId}">">${renLeaseVO.lseLisId}</c:if>
 		</c:forEach>
 		</select>
		</td>
				
	</tr>
		<tr>
		<td>租賃開始時間</td>
		<td><input name="lseStart" id="f_date1" type="text"></td>
	</tr>
		<tr>
		<td>租賃開始時間:</td>
		<td><input name="lseEnd" id="f_date2" type="text"></td>
	</tr>
				
	


</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</body>
<% 
  java.sql.Date lseStart = null;
  try {
	  lseStart = renLeaseVO.getLseStart();
   } catch (Exception e) {
	   lseStart = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=lseStart%>', // value:   new Date(),
        });</script>
<% 
  java.sql.Date lseEnd = null;
  try {
	  lseEnd = renLeaseVO.getLseEnd();
   } catch (Exception e) {
	   lseEnd = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date2').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=lseEnd%>', // value:   new Date(),
           minDate:               '-1970-01-01', // 去除今日(不含)之前
        });</script>

</html>