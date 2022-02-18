<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
<title>RenLease: Home</title>
</head>
<body bgcolor='white'>



	<table id="table-1">
		<tr>
			<td><h3>租賃單首頁</h3></td>
		</tr>
	</table>

	<p>This is the Home page for Lease: Home</p>

	<h3>資料查詢:</h3>

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
		<li><a href='<%=request.getContextPath()%>/frontend/ren_lease/listAllLease.jsp'>List</a> 查看所有的租賃單 <br> <br></li>


 		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ren_lease/RenLeaseServlet.do">
				<b>輸入租賃單編號 :</b>
				<input type="text" name="lseId">
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="renLeaseSvc" scope="page"
			class="ezs.ren_lease.model.RenLeaseService" />

		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ren_lease/RenLeaseServlet.do">
				<b>選擇租賃單編號 :</b>
				<select size="1" name="lseId">
					<option value="">請選擇</option>
					<c:forEach var="renLeaseVO" items="${renLeaseSvc.all}">
					<option value="${renLeaseVO.lseId}">${renLeaseVO.lseId}
					</c:forEach>
				</select>
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>

	<%-- 	<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ren_lease/RenLeaseServlet.do">
				<b>選擇會員編號 :</b>
				<select size="1" name="lseMemId">
					<option value="">請選擇</option>
					<c:forEach var="renLeaseVO" items="${renLeaseSvc.all}">
					<option value="${renLeaseVO.lseMemId}">${renLeaseVO.lseMemId}
					</c:forEach>
				</select>
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>

		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ren_lease/RenLeaseServlet.do">
				<b>選擇房源編號 :</b>
				<select size="1" name="lseLisId">
					<option value="">請選擇</option>
					<c:forEach var="renLeaseVO" items="${renLeaseSvc.all}">
					<option value="${renLeaseVO.lseLisId}">${renLeaseVO.lseLisId}
					</c:forEach>
				</select>
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
	想做“選擇房東名稱”和”選擇會員名稱“做查詢
		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ren_lease/RenLeaseServlet.do">
				<b>選擇房東編號 :</b>
				<select size="1" name="lseLddId">
					<option value="">請選擇</option>
					<c:forEach var="renLeaseVO" items="${renLeaseSvc.all}">
					<option value="${renLeaseVO.lseLddId}">${renLeaseVO.lseLddId}
					</c:forEach>
				</select>
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ren_lease/RenLeaseServlet.do">
				<b>選擇租賃訂單成立時間 :</b>
				<select size="1" name="lseTimestamp">
					<option value="">請選擇</option>
					<c:forEach var="renLeaseVO" items="${renLeaseSvc.all}">
					<option value="${renLeaseVO.lseTimestamp}">${renLeaseVO.lseTimestamp}
					</c:forEach>
					
					
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li> --%>
		</ul>
		
	<h3>租賃單管理</h3>
	<ul>
		<li><a href='<%=request.getContextPath()%>/frontend/ren_lease/addLease.jsp'>加入</a>租賃單</li>
	</ul>

</body>
</html>