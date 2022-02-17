<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.sec_ord.model.*"%>
<%@ page import="ezs.sec_category.model.*"%>
<%
SecOrdVO secOrdVO = (SecOrdVO) request.getAttribute("secOrdVO");
%>
<%
SecCategoryVO secCategoryVO = (SecCategoryVO) request.getAttribute("secCategoryVO");
%>

<html>
<head>
<title>Easy House</title>

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

	<h3>商品查詢:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<%-- 查詢賣家訂單  --%>
	<ul>
		<li><a href='listSecOrdsByShSellerID.jsp'>搜尋</a> 查詢賣家訂單 <br> <br></li>


		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sec_ord/GetSecOrdBySellerServlet.do">
				<b>輸入訂單編號:</b> <input type="text" name="shOrdID"> 
				<input
					type="hidden" name="action" value="getOne_For_Display"> <input
					type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="secItemsSvc" scope="page"
			class="ezs.sec_items.model.SecItemsService" />

		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sec_items/GetSecItemsServlet.do">
				<b>選擇商品編號:</b> <select size="1" name="shID">
					<c:forEach var="secItemsVO" items="${secItemsSvc.all}">
						<option value="${secItemsVO.shID}">${secItemsVO.shID}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="secCategorySvc" scope="page"
			class="ezs.sec_category.model.SecCategoryService" />
<!-- 			未對應到商品ID -->
		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sec_items/GetSecItemsServlet.do">
				<b>選擇商品類別:</b> <select size="1" name="shID">
					<c:forEach var="secCategoryVO" items="${secCategorySvc.all}">
						<option value="${secCategoryVO.shCateID}">${secCategoryVO.shCateName}</option>
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>


		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sec_items/GetSecItemsServlet.do">
				<b>選擇商品名稱:</b> <select size="1" name="shID">
					<c:forEach var="secItemsVO" items="${secItemsSvc.all}">
						<option value="${secItemsVO.shID}">${secItemsVO.shName}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		

		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/sec_items/GetSecItemsStatusServlet.do">
				<b>選擇商品狀態:</b> 
				<select size="1" name="shStatus">
				<option value="0">已出售</option>
				<option value="1">上架</option>
				<option value="2">違規下架</option>

				</select> <input type="hidden" name="action" value="getOneStatus_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
	</ul>


	<h3>商品管理</h3>

	<ul>
		<li><a href="<%=request.getContextPath()%>/frontend/sec_items/addSecItems.jsp">新增</a> 新增商品</li>
	</ul>

</body>
</html>
