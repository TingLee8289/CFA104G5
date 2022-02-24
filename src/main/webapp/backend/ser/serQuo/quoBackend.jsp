<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>EASY SPACE</title>



</head>
<body>

	


	<h3>後台估價單管理</h3>

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
		<li><a href='<%=request.getContextPath()%>/backend/ser/serQuo/listAllSerQuo.jsp'>檢視所有估價單</a>
			all Quotation. <br> <br></li>

		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/ser_quo/GetOneQuoServlet.do">
				<b>輸入估價單編號 (如1):</b> 
				<input type="text" name="serQuoID">
				<input type="hidden" name="action" value="getOneQuo"> 
				<input type="submit" value="送出">
			</FORM>
		</li>
		
	</ul>

	


</body>
</html>