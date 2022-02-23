<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.sec_ord.model.*"%>



<html>
<head>
<title>EASY SPACE</title>

<style>
table#table-1 {
	width: 450px;
	background-color: LightSkyBlue;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
	text-align: center;
}

table#table-1 h4 {
	color: blue;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: SkyBlue;
	display: inline;
}
</style>

</head>
<body bgcolor='Linen'>

	<table id="table-1">
		<tr>
			<td><h3>Easy House</h3>
				<h4>( MVC )</h4></td>
		</tr>
	</table>

	<p>This is the SecItems page for Easy House</p>

	<h3>��a�q��d��:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>









	<jsp:useBean id="secOrdSvc" scope="page"
		class="ezs.sec_ord.model.SecOrdService" />
		
		

<li>
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sec_ord/GetSecOrdBySellerServlet.do">
			<b><font color=orange>��ܭq��s��:</font></b> 
			<select size="1" name="shOrdID">
			<c:forEach var="secOrdVO" items="${secOrdSvc.all}">
				<option value="${secOrdVO.shOrdID}">${secOrdVO.shOrdID}
			</c:forEach>
			</select> <input type="submit" value="�e�X"> <input type="hidden"
				name="action" value="getOne_For_Display">
		</FORM>

	</li>



	<h3>
		<font color=orange>��a�q��d��</font>
	</h3>

	<ul>
		<li><a
			href='<%=request.getContextPath()%>/frontend/sec_ord/listAllSecOrd.jsp'>�d��</a>
			��a�q��</li>
	</ul>
</body>
</html>
