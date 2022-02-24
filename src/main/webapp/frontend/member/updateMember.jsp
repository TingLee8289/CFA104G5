<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.member.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<title>EASY SPACE</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" integrity="sha256-46qynGAkLSFpVbEBog43gvNhfrOj+BmwXdxFgVK/Kvc=" crossorigin="anonymous" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>   
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
#test{
 color: white;
    background-color: #212529;
    border-color: #32383e;
    text-align: center;
    vertical-align: middle;
}

table td {
text-align: center;
}
</style>
</head>
<body bgcolor='white'>

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
	
<div class="container">
	    <div class="row">
		    <table class="table table-hover table-striped">

		<tr>
			<th id="test">會員編號:</th>
			<td><%=memberVO.getMemID()%></td>
		</tr>
		<tr>
			<th id="test">帳號:</th>
			<td><%=memberVO.getMemUsername()%></td>
		</tr>
		<tr>
			<th id="test">密碼:</th>
			<td><input type="TEXT" name="memPassword" size="20" value="<%=memberVO.getMemPassword()%>" /></td>
		</tr>
		<tr>
			<th id="test">姓名:</th>
			<td><input type="TEXT" name="memName" size="20" value="<%=memberVO.getMemName()%>" /></td>
		</tr>
		<tr>
			<th id="test">電話:</th>
			<td><input type="TEXT" name="memPhone" size="10" value="<%=memberVO.getMemPhone()%>" /></td>
		</tr>
		<tr>
			<th id="test">地址:</th>
			<td><input type="TEXT" name="memAddress" size="100" value="<%=memberVO.getMemAddress()%>" /></td>
		</tr>
		<tr>
			<th id="test">email:</th>
			<td><input type="TEXT" name="memEmail" size="50" value="<%=memberVO.getMemEmail()%>" /></td>
		</tr>
		
		<c:if test="${memberVO.memSupplier == 1}">
		<tr>
			<th id="test">統一編號:</th>
			<td><input type="TEXT" name="memVatno" size="8" value="<%=memberVO.getMemVatno()%>" /></td>
		</tr>
		</c:if>

		<tr>
			<th id="test">個人頭像:</th>
			<td>
			
			
			
<!-- 				<p>圖片預覽</p>			  -->
			<input type="file" id="upfiles" name="mempic">
			 <div id="previews">
			 <br>
			 	<img src="<%=request.getContextPath()%>/DBGifReader?mem_ID=${memberVO.memID}" width=150px>
			 </div></td>

		</tr>
	</table>

</div>
    </div>


<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="memID" value="<%=memberVO.getMemID()%>">
<input type="hidden" name="memUsername" value="<%=memberVO.getMemUsername()%>">
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