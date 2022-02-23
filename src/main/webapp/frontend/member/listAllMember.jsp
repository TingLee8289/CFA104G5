<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="ezs.member.model.*"%>

<%
	MemberService memSvc = new MemberService();
    List<MemberVO> list = memSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>所有會員</title>
</head>


<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>

<body>
<jsp:include page="/frontend/EZ_header.jsp"></jsp:include>
<table id="table-1">
	<tr><td>
		 <h3>所有會員資料</h3>
	</td></tr>
</table>
	<table>
		<tr>
			<th>帳號</th>
			<th>名稱</th>
			<th>電話</th>
			<th>地址</th>
			<th>email帳號</th>
			<th>個人頭像</th>
			<th>評分</th>
			<th>修改</th>
		</tr>


		<c:forEach var="memberVO" items="${list}">
			<tr>
				<td>${memberVO.memUsername}</td>
				<td>${memberVO.memName}</td>
				<td>${memberVO.memPhone}</td>
				<td>${memberVO.memAddress}</td>
				<td>${memberVO.memEmail}</td>
				
				<td><img src="<%=request.getContextPath()%>/DBGifReader?mem_ID=${memberVO.memID}" height=150px width=150px></td>
				
				<td>
					<c:choose>
						<c:when test="${(memberVO.memRedCount) == 0}">尚無評分</c:when>
						<c:otherwise>
							<fmt:formatNumber type="number" maxFractionDigits="1" 
								value="${(memberVO.memRedScore/memberVO.memRedCount)}"/>
						</c:otherwise>
					</c:choose></td>
				<td><form method="post" action="<%= request.getContextPath() %>/member/MemberServletUpdate.do">
						<input type="submit" value="修改"> 
						<input type="hidden" name="memID" value="${memberVO.memID}"> 
						<input type="hidden" name="action" value="getOne_For_Update">
					</form></td>


			</tr>
		</c:forEach>
	</table>

<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>

</body>
</html>