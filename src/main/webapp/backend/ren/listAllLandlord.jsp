<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ren_landlord.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
RenLandlordService renlandlordSvc = new RenLandlordService();
List<RenLandlordVO> list = renlandlordSvc.getAll();
pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>所有申請房東資料 - listAllLandlord.jsp</title>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>所有房東資料 - listAllLandlord.jsp</h3>
				<h4>
					<a href="select.jsp"><img
						src="<%=request.getContextPath()%>/images/ren/back1.gif"
						width="100" height="32" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<table>
		<tr>
			<th>房東編號</th>
			<th>會員編號</th>
			<th>會員名稱</th>
			<th>審核狀態</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="renLandlordVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td>${renLandlordVO.lddId}</td>
				<td>${renLandlordVO.lddMemId}</td>
				<td></td>
				<%-- 	引用其他張表格的內容
<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" />
	<tr>
		<td>部門:<font color=red><b>*</b></font></td>
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
					<!-- 名字在這 -->
					<option class="shopee-option" value="0">未驗證</option>
					<option class="shopee-option" value="1"
						<c:if test="${memVO.acc_state == 1}">selected</c:if>>已驗證</option>
					<option class="shopee-option" value="2"
						<c:if test="${memVO.acc_state == 2}">selected</c:if>>停權</option>
				</select> --%>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/backend/ren/renlandlord.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="lddId" value="${renLandlordVO.lddId}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/backend/ren/renlandlord.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
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