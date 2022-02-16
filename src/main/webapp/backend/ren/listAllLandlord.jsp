<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ren_landlord.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
RenLandlordService renlandlordSvc = new RenLandlordService();
List<RenLandlordVO> list = renlandlordSvc.getAll();
pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>�Ҧ��ӽЩЪF��� - listAllLandlord.jsp</title>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>�Ҧ��ЪF��� - listAllLandlord.jsp</h3>
				<h4>
					<a href="select.jsp"><img
						src="<%=request.getContextPath()%>/images/ren/back1.gif"
						width="100" height="32" border="0">�^����</a>
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
			<th>�ЪF�s��</th>
			<th>�|���s��</th>
			<th>�|���W��</th>
			<th>�f�֪��A</th>
			<th>�ק�</th>
			<th>�R��</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="renLandlordVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td>${renLandlordVO.lddId}</td>
				<td>${renLandlordVO.lddMemId}</td>
				<td></td>
				<%-- 	�ޥΨ�L�i��檺���e
<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" />
	<tr>
		<td>����:<font color=red><b>*</b></font></td>
		<td><select size="1" name="deptno">
			<c:forEach var="deptVO" items="${deptSvc.all}">
				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)?'selected':'' } >${deptVO.dname}
			</c:forEach>
		</select></td>
	</tr> --%>
				<td>${renLandlordVO.lddApproval}</td>
<%-- 				<select data-v-2449cb06="" tabindex="0"
					class="shopee-selector shopee-selector--normal shopee-select__options"
					name="acc_state"
					style="background: #eff9ec 0px 0px; color: #ffffff; font-size: 14px; padding: 0; width: 88px; height: 32px; color: rgb(128, 140, 153);">
					<!-- �W�r�b�o -->
					<option class="shopee-option" value="0">������</option>
					<option class="shopee-option" value="1"
						<c:if test="${memVO.acc_state == 1}">selected</c:if>>�w����</option>
					<option class="shopee-option" value="2"
						<c:if test="${memVO.acc_state == 2}">selected</c:if>>���v</option>
				</select> --%>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/backend/ren/renlandlord.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="lddId" value="${renLandlordVO.lddId}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/backend/ren/renlandlord.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="�R��"> <input type="hidden"
							name="lddId" value="${renLandlordVO.lddId}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>

</body>
</html>