<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.sec_ord_details.model.*"%>

<jsp:useBean id="secOrdSvc" scope="page"
	class="ezs.sec_ord.model.SecOrdService" />

<html>
<head>
<title>�Ҧ��q�� - listAllSecOrd.jsp</title>

<style>
table#table-1 {
	background-color: orange;
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
<body bgcolor='white'>

	<h4>�����m�߱ĥ� EL ���g�k����:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>�Ҧ��q�� - listAllSecOrd.jsp</h3>
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
			<th>�ӫ~�q��s��</th>
			<th>�R�a�s��</th>
			<th>��a�s��</th>
			<th>����a�}�l���ϸ�</th>
			<th>���󿤥�</th>
			<th>����m���</th>
			<th>����a�}</th>
			<th>�I�ڤ覡</th>
			<th>�q�檬�A</th>
			<th>�ӫ~����</th>
			<th>�q����</th>
			<th>�R�a������a�P��</th>
			<th>�R�a������a���e</th>
			<th>��a�����R�a�P��</th>
			<th>��a�����R�a���e</th>
			<th>���ڤ��</th>
			<th>�R�a�Ƶ�</th>
			<th>�ק�</th>
			<th>�����q��<font color=red>(���p���ջP���-�p��)</font></th>
			<th>�d�߭q�����</th>
		</tr>

		<c:forEach var="secOrdVO" items="${secOrdSvc.all}">
			<tr>
				<td>${secOrdVO.shOrdID}</td>
				<td>${secOrdVO.shBuyerID}</td>
				<td>${secOrdVO.shSellerID}</td>
				<td>${secOrdVO.shPostcode}</td>
				<td>${secOrdVO.shCounty}</td>
				<td>${secOrdVO.shDist}</td>
				<td>${secOrdVO.shRoad}</td>
				<td>${secOrdVO.shPayment}</td>

				<td><c:if test="${secOrdVO.shOrdStatus == 8}">�����q��</c:if> <c:if
						test="${secOrdVO.shOrdStatus == 2}">�ݥX�f</c:if> <c:if
						test="${secOrdVO.shOrdStatus == 3}">�w�X�f</c:if> <c:if
						test="${secOrdVO.shOrdStatus == 6}">�h�ڼf�֤�</c:if> <c:if
						test="${secOrdVO.shOrdStatus == 7}">�q�槹��</c:if></td>


				<td>${secOrdVO.shPrice}</td>
				<td>${secOrdVO.shDate}</td>
				<td>${secOrdVO.shBuyerScore}</td>
				<td>${secOrdVO.shBuyerTXT}</td>
				<td>${secOrdVO.shSellerScore}</td>
				<td>${secOrdVO.shSellerTXT}</td>
				<td>${secOrdVO.shAPPDate}</td>
				<td>${secOrdVO.shNotes}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/sec_ord/UpdateSecOrdBySellerServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="shOrdID" value="${secOrdVO.shOrdID}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/sec_ord/GetSecOrdDetailsBySellerServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="�����q��"> <input type="hidden"
							name="shOrdID" value="${secOrdVO.shOrdID}"> <input
							type="hidden" name="action" value="delete_secord">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/sec_ord/GetSecOrdDetailsBySellerServlet.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="�e�X�d��"> <input type="hidden"
							name="shOrdID" value="${secOrdVO.shOrdID}"> <input
							type="hidden" name="action" value="listSecOrdDetails_BySecOrd_B">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>

	<%
	if (request.getAttribute("listSecOrdDetails_BySecOrd") != null) {
	%>
	<jsp:include page="listSecOrdDetails_BySecOrd.jsp" />
	<%
	}
	%>

</body>
</html>