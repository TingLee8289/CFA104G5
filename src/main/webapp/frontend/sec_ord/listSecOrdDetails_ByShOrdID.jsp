<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.sec_ord.model.*"%>
<%@ page import="ezs.sec_ord_details.model.*"%>

<jsp:useBean id="listSecOrdDetails_ByShOrdID" scope="request"
	type="java.util.List<SecOrdDetailsVO>" />
<!-- ��EL����i�ٲ� -->
<jsp:useBean id="secOrdSvc" scope="page"
	class="ezs.sec_ord.model.SecOrdService" />


<html>
<head>
<title>�q����� - listSecOrdDetails_ByShOrdID.jsp</title>

<style>
table#table-2 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-2 h4 {
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
	padding: 10px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>

	<h4>�����m�߱ĥ� EL ���g�k����:</h4>
	<table id="table-2">
		<tr>
			<td>
				<h3>�q����� - listSecOrdDetails_ByShOrd.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/frontend/sec_ord/secOrdHomeSeller.jsp"><img
						src="images/back1.gif" width="100" height="32" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<table>
		<tr>
			<th>�q��s��</th>
			<th>�ӫ~�s��</th>
			<th>�ӫ~�W��</th>
			<th>�q����B</th>
			<th>�ӫ~�ƶq</th>

		</tr>


		<c:forEach var="secOrdDetailsVO"
			items="${listSecOrdDetails_ByShOrdID}">
			<tr>
				<td>${secOrdDetailsVO.shOrdID}</td>
				<td>${secOrdDetailsVO.shID}</td>
				<td>${secOrdDetailsVO.shName}</td>
				<td>${secOrdDetailsVO.shPrice}</td>
				<td>${secOrdDetailsVO.shQty}</td>
			</tr>
		</c:forEach>

	</table>

</body>
</html>