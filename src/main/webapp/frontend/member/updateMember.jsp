<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.member.model.*"%>

<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
<script>
  var loadFile = function(event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function() {
      URL.revokeObjectURL(output.src) // free memory
    }
  };
</script>
<meta charset="UTF-8">
<title>會員資料修改</title>
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
	width: 450px;
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
	<tr><td>
		 <h3>會員資料修改</h3>
		 <h4><a href="<%=request.getContextPath() %>/frontend/EZ_home.jsp">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<body>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/MemberServletUpdate.do" name="form1" enctype="multipart/form-data" >
	<table>
		<tr>
			<td>會員編號:</td>
			<td><%=memberVO.getMemID()%></td>
		</tr>
		<tr>
			<td>帳號:</td>
			<td><%=memberVO.getMemUsername()%></td>
		</tr>
		<tr>
			<td>密碼:</td>
			<td><input type="TEXT" name="memPassword" size="20" value="<%=memberVO.getMemPassword()%>" /></td>
		</tr>
		<tr>
			<td>名稱:</td>
			<td><input type="TEXT" name="memName" size="20" value="<%=memberVO.getMemName()%>" /></td>
		</tr>
		<tr>
			<td>電話:</td>
			<td><input type="TEXT" name="memPhone" size="10" value="<%=memberVO.getMemPhone()%>" /></td>
		</tr>
		<tr>
			<td>地址:</td>
			<td><input type="TEXT" name="memAddress" size="200" value="<%=memberVO.getMemAddress()%>" /></td>
		</tr>
		<tr>
			<td>email帳號:</td>
			<td><input type="TEXT" name="memEmail" size="50" value="<%=memberVO.getMemEmail()%>" /></td>
		</tr>
		
		<c:if test="${memberVO.memSupplier == 1}">
		<tr>
			<td>統一編號:</td>
			<td><input type="TEXT" name="memVatno" size="8" value="<%=memberVO.getMemVatno()%>" /></td>
		</tr>
		</c:if>
		
		<tr>
			<td>個人頭像:</td>
			<td>
			
<!-- 			可以預覽圖片但無法上傳圖片至資料庫 -->
<!-- 			<input type="file" accept="image/*" onchange="loadFile(event)" -->
<%-- 			value="<%= (memberVO==null)? "" : memberVO.getMemHeadshot()%>"> --%>
<!-- 				<img id="output"  -->
<%-- 				src="<%=request.getContextPath()%>/DBGifReader?mem_ID=<%=memberVO.getMemID()%>" width=200px/> --%>
			
			
			
<!-- 				<p>圖片預覽</p>			  -->
			<input type="file" id="upfiles" name="mempic"
			>
			 <div id="previews">
			 	<img src="<%=request.getContextPath()%>/DBGifReader?mem_ID=${memberVO.memID}" width=150px>
			 </div></td>
			 
<!-- 			<input type="file" id="upfiles" name="mempic" -->
<%-- 			 value="<%= (memberVO==null)? "" : memberVO.getMemHeadshot()%>" --%>
<!-- 			 onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])"/> -->
<%-- 			 <img src="<%=request.getContextPath()%>/DBGifReader?mem_ID=<%=memberVO.getMemID()%>" width=200px> --%>
<!-- 	 </td> -->
		</tr>
	</table>



<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="memID" value="<%=memberVO.getMemID()%>">
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
					var img = $("<img width='150' height='150'>").attr('src',
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