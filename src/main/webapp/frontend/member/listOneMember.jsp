<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.member.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	Integer memID = (Integer)session.getAttribute("memID");
	String memUsername = (String)session.getAttribute("memUsername");
// 	MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
	MemberService memSvc = new MemberService();
    MemberVO memberVO = memSvc.getOneMember(memID);
//     pageContext.setAttribute("list",list);
 
%>

<html>
<head>
<title>EASY SPACE</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" integrity="sha256-46qynGAkLSFpVbEBog43gvNhfrOj+BmwXdxFgVK/Kvc=" crossorigin="anonymous" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>   
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>
#test{
 color: white;
    background-color: #212529;
    border-color: #32383e;
    text-align: center;
    vertical-align: middle;
}

table td {
text-align: center;
}
</style>

</head>
<body bgcolor='white'>



<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<div class="container">
	    <div class="row">
		    <table class="table table-hover table-striped">

	<tr>
		<th id="test">會員頭像</th>
		<td><img src="<%=request.getContextPath()%>/DBGifReader?mem_ID=${memberVO.memID}" height=200px width=200px></td>
	</tr>
	<tr>			
		<th id="test">會員編號:</th>
		<td>${memberVO.memID}</td>
	</tr>
	<tr>
		<th id="test">帳號:</th>
		<td>${memberVO.memUsername}</td>
	</tr>
	<tr>
		<th id="test">密碼:</th>
		<td>${memberVO.memPassword}</td>
	</tr>
	<tr>
		<th id="test">姓名:</th>
		<td>${memberVO.memName}</td>
	</tr>
	<tr>
		<th id="test">電話:</th>
		<td>${memberVO.memPhone}</td>
	</tr>
	<tr>
		<th id="test">地址:</th>
		<td>${memberVO.memAddress}</td>
	</tr>
	<tr>
		<th id="test">email:</th>
		<td>${memberVO.memEmail}</td>
	</tr>
	<c:if test="${memberVO.memSupplier == 1}">
	<tr>
		<th id="test">統一編號:</th>
		<td>${memberVO.memVatno}</td>
	</tr>
	</c:if>

	<tr>
		<th id="test">評價均分:</th>
		<td>
					<c:choose>
						<c:when test="${(memberVO.memRedCount) == 0}">尚無評分</c:when>
						<c:otherwise>
							<fmt:formatNumber type="number" maxFractionDigits="1" 
								value="${(memberVO.memRedScore/memberVO.memRedCount)}"/>
						</c:otherwise>
					</c:choose></td>
	</tr>
	<tr>
	<td><form method="post" action="<%= request.getContextPath() %>/member/MemberServletUpdate.do">
						<input type="submit" value="修改"> 
						<input type="hidden" name="memID" value="${memberVO.memID}"> 
						<input type="hidden" name="action" value="getOne_For_Update">
					</form></td>
	</tr>


</table>
</div>
    </div>

</body>

</html>

