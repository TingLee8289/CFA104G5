<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.sec_items.model.*"%>
<%@ page import="ezs.sec_pics.model.*"%>

<!-- 待補上jquery套件  現在只是暫時使用cdn -->

<%
SecItemsVO secItemsVO = (SecItemsVO) request.getAttribute("secItemsVO");
SecPicsVO secPicsVO = (SecPicsVO) request.getAttribute("secPicsVO");
//SecItemsServlet.java (Concroller) 存入req的secItemsVO物件 (包括幫忙取出的secItemsVO, 也包括輸入資料錯誤時的SecItemsVO物件)
%>

<%-- <jsp:useBean id="secPicsSvc" scope="page" class="ezs.sec_items.model.SecPicsService" /> --%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>

<title>EASY SPACE</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>

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
	width: 1000px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>商品資料修改 - update_secItems_input.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/frontend/sec_items/select_page.jsp"><img
						src="<%=request.getContextPath()%>/images/cmn/index/EASYSPACE.png"
						width="100" height="60" border="0">回查詢首頁 </a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料修改:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" enctype="multipart/form-data"
		ACTION="<%=request.getContextPath()%>/sec_items/UpdateSecItemsServlet.do"
		name="form1">
		<table>
			<tr>
				<td>商品編號:<font color=red><b>*</b></font></td>

				<td><%=secItemsVO.getShID()%></td>

			</tr>

			<jsp:useBean id="secCategorySvc" scope="page"
				class="ezs.sec_category.model.SecCategoryService" />
			<tr>
				<td>商品類別:<font color=red><b>*</b></font></td>
				<td><select size="1" name="shCateID">
						<c:forEach var="secCategoryVO" items="${secCategorySvc.all}">
							<option value="${secCategoryVO.shCateID}">${secCategoryVO.shCateName}</option>

						</c:forEach>
				</select></td>
			<tr>
			<tr>
				<!-- 		<td>會員編號:</td> -->
				<!-- 		<td><input type="hidden" name="id" size="45" -->
				<%-- 			 value="<%=secItemsVO.getShSellerID()%>" /></td> --%>
				<td><input type="hidden" name="shSellerID"
					value="<%=secItemsVO.getShSellerID()%>" /></td>
			</tr>

			<tr>
				<td>商品名稱:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="shName" size="45"
					value="<%=secItemsVO.getShName()%>" /></td>
			</tr>
			<tr>
				<td>價格:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="shPrice" size="45"
					value="<%=secItemsVO.getShPrice()%>" /></td>
			</tr>
			<tr>
				<td>數量:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="shQTY" size="45"
					value="<%=secItemsVO.getShQTY()%>" /></td>
			</tr>
			<tr>
				<td>尺寸:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="shSize" size="45"
					value="<%=secItemsVO.getShSize()%>" /></td>
			</tr>
			<tr>
				<td>簡介:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="shDescription" size="45"
					value="<%=secItemsVO.getShDescription()%>" /></td>
			</tr>
			<tr>
				<td>新舊程度:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="shCondition" size="45"
					value="<%=secItemsVO.getShCondition()%>" /></td>
			</tr>
			<tr>
				<td>已使用時間:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="shTime" size="45"
					value="<%=secItemsVO.getShTime()%>" /></td>
			</tr>
			<tr>
				<td>保固:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="shGuarantee" size="45"
					value="<%=secItemsVO.getShGuarantee()%>" /></td>
			</tr>


			<tr>
				<!-- 		<td>狀態:</td> -->
				<!-- 		<td><input type="hidden" name="comm" size="45" -->
				<%-- 			 value="<%=secItemsVO.getShStatus()%>" /></td> --%>

				<td><input type="hidden" name="shStatus"
					value="<%=secItemsVO.getShStatus()%>" /></td>
			</tr>
			<tr>
				<td>所在縣市:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="shCounty" size="45"
					value="<%=secItemsVO.getShCounty()%>" /></td>
			</tr>
			<tr>
				<td>所在鄉鎮區:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="shDist" size="45"
					value="<%=secItemsVO.getShDist()%>" /></td>
			</tr>

			<tr>
				<td>照片:</td>
				<td><input type="file" id="upfiles" name="shPic"
					accept="image/gif, image/jpeg, image/png" multiple="multiple" />
					<div id="previews">
						<p>圖片預覽</p>
						<img
							src="<%=request.getContextPath()%>/sec_items/SecItemsPicReaderServlet.do?sh_id=${secItemsVO.shID}"
							width=200px>
					</div> <%-- 				<c:forEach --%> <%-- 						var="secPicsVO" items="${secPicsSvc.all}"> --%>
					<%-- 						<option value="${secPicsVO.getOneShID(secItemsVO.shID)}"> --%>
					<%-- 					</c:forEach>  --%> <!-- 					查詢到舊的 --></td>


				<%-- 					<td><img src="<%=request.getContextPath()%>/sec_items/SecItemsPicReaderServlet.do?sh_id= --%>
				<%-- 				 ${secItemsVO.shID}" width = 200px></td> --%>

			</tr>

		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="shID" value="<%=secItemsVO.getShID()%>">
		<input type="submit" value="送出修改">
	</FORM>
</body>

<script>
	// 	// // change這個event有只代表改變，並不代表有檔案。
	// 	// 	如果要FileReader去讀檔案，必須給他一個檔案Object。
	// 	// 	它拿到檔案Object後會驅動onload事件
	// 	// 	藉由 FileReader 物件，Web 應用程式能以非同步（asynchronously）方式讀取儲存在用戶端的檔案（或原始資料暫存）內容
	// 	// 裡面的input 就是我們丟進去的this，也就是<input type="file">，
	// 	// 當<input type="file">被DOM變成Object的時候，如果他有選擇到檔案，
	// 	// 會被放在input.files裡面，而且是一個Array(因為input如果寫成 <input type="file" multiple> 的時候是可以複選的)
	$("#upfiles").change(function() {
		$("#previews").html(""); // 清除預覽
		readURL(this);
	});

	function readURL(input) {
		if (input.files && input.files.length >= 0) {
			for (var i = 0; i < input.files.length; i++) {
				var reader = new FileReader();
				reader.onload = function(e) {
					var img = $("<img width='300' height='200'>").attr('src',
							e.target.result);
					$("#previews").append(img);
				}
				reader.readAsDataURL(input.files[i]);
			}
		} else {
			var noPictures = $("<p>目前沒有圖片</p>");
			$("#previews").append(noPictures);
		}
	}
</script>

</html>