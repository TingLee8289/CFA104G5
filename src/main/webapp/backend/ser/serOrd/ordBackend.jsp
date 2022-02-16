<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Ezs Service Order: Home</title>

<style>
table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
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

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td><h3>Ezs Service Order: Home</h3>
				<h4>( MVC )</h4></td>
		</tr>
	</table>

	<p>This is the Home page for Ezs Service Order: Home</p>

	<h3>後台訂單管理</h3>

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
		<li><a href='<%=request.getContextPath()%>/backend/ser/serOrd/listAllSerOrd.jsp'>檢視所有訂單</a>
			all Ord. <br> <br></li>

		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/ser_ord/GetOneOrdServlet.do">
				<b>輸入訂單編號 (如1):</b> 
				<input type="text" name="serOrdID">
				<input type="hidden" name="action" value="getOneOrd"> 
				<input type="submit" value="送出">
			</FORM>
		</li>
		
	</ul>

	


</body>
</html>