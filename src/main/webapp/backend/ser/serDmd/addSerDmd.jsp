<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_dmd.model.*"%>

<%
SerDmdVO serDmdVO = (SerDmdVO) request.getAttribute("serDmdVO");
%>


<html>
<head>
 <script src="<%=request.getContextPath()%>/frontend/js/jquery-1.11.3.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>EASY SPACE</title>

<style>
table#table-1 {
	width: 500px;
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
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	width: 900px;
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
				<h3>新增需求單 - addSerDmd.jsp</h3>
			</td>
			<td style="text-align: center">
				<h4>
					<a
						href="<%=request.getContextPath()%>/backend/ser/serDmd/select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>

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
		ACTION="<%=request.getContextPath()%>/ser_dmd/SerDmdServlet.do"
		name="form1">
		<table>
			<tr>
				<!-- 		<td>需求單狀態:</td> -->
				<td><input type="hidden" name="dmdStatus" size="8" value=0 /></td>
			</tr>
			<tr>
				<td>會員ID:</td>
				<td><input type="TEXT" name="dmdMemID" size="20"
					value="<%=(serDmdVO == null) ? "2" : serDmdVO.getDmdMemID()%>" /></td>
			</tr>
			<jsp:useBean id="serCla" scope="page"
				class="ezs.ser_cla.model.SerClaService" />
<!-- 			<tr> -->
<!-- 				<td>服務類別:<font color=red><b>*</b></font></td> -->
<!-- 				<td><select size="1" name="serClaID"> -->
<%-- 						<c:forEach var="serClaVO" items="${serCla.all}"> --%>
<%-- 							<option value="${serClaVO.serClaID}" --%>
<%-- 								${(serDmdVO.dmdSerClaID==serClaVO.serClaID)? 'selected':'' }>${serClaVO.serClaName} --%>
<%-- 						</c:forEach> --%>
<!-- 				</select></td> -->
<!-- 			</tr> -->
<tr>
				<td>服務類別:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="dmdSerClaID"
					value="<%=(serDmdVO == null) ? "2" : serDmdVO.getDmdSerClaID()%>" /></td>
			</tr>
			<tr>
				<td>需求人姓名:</td>
				<td><input type="TEXT" name="dmdName"
					value="<%=(serDmdVO == null) ? "劉冠鳴" : serDmdVO.getDmdName()%>" /></td>
			</tr>
			<tr>
				<td>需求人電話:</td>
				<td><input type="TEXT" name="dmdTel"
					value="<%=(serDmdVO == null) ? "066220167" : serDmdVO.getDmdTel()%>" /></td>
			</tr>
			<tr>
				<td>需求人信箱:</td>
				<td><input type="EMAIL" name="dmdMail"
					value="<%=(serDmdVO == null) ? "jimmypc03@hotmail.com.tw" : serDmdVO.getDmdMail()%>" /></td>
			</tr>
			<tr>
				<td>案場縣市:</td>
				<td><input type="TEXT" name="dmdCounty" size="20"
					value="<%=(serDmdVO == null) ? "台南市" : serDmdVO.getDmdCounty()%>" /></td>
			</tr>
			<tr>
				<td>案場地區:</td>
				<td><input type="TEXT" name="dmdRegion" size="20"
					value="<%=(serDmdVO == null) ? "柳營區" : serDmdVO.getDmdRegion()%>" /></td>
			</tr>
			<tr>
				<td>案場詳細地址:</td>
				<td><input type="TEXT" name="dmdAddress" size="20"
					value="<%=(serDmdVO == null) ? "是鄰里123號" : serDmdVO.getDmdAddress()%>" /></td>
			</tr>
			<tr>
				<td>空間類別:</td>
				<td><input type="TEXT" name="dmdSpaceClass" size="20"
					value="<%=(serDmdVO == null) ? "豪窄" : serDmdVO.getDmdSpaceClass()%>" /></td>
			</tr>
			<tr>
				<td>坪數:</td>
				<td><input type="TEXT" name="dmdSquare"
					value="<%=(serDmdVO == null) ? "500" : serDmdVO.getDmdSquare()%>" /></td>
			</tr>
			<tr>
				<td>預算:</td>
				<td><input type="TEXT" name="dmdBudget"
					value="<%=(serDmdVO == null) ? "50" : serDmdVO.getDmdBudget()%>" /></td>
			</tr>
			<tr>
				<td>需求簡介:</td>
				<td><input type="TEXT" name="dmdIntro" size="100"
					value="<%=(serDmdVO == null) ? "搞裡頭" : serDmdVO.getDmdIntro()%>" /></td>
			</tr>
			<!-- 不會用 -->
			<!-- <tr> -->
			<!-- <td> -->
			<!-- 	<textarea id="story" name="story" -->
			<!--           rows="5" cols="33"> -->
			<!-- </textarea> -->
			<!-- </td> -->
			<!-- </tr> -->

			<tr>
				<td>照片:</td>
				<td><input type="file" id="upfiles" name="dmdPic"
					accept="image/gif, image/jpeg, image/png" multiple="multiple" />
					<div id="previews">
		
					</div> 
				
			</tr>



		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<%-- <% 
  java.sql.Date hiredate = null;
  try {
	    hiredate = java.sql.Date.valueOf(request.getParameter("hiredate").trim());
   } catch (Exception e) {
	    hiredate = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script> --%>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
       <%--  $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
 	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=hiredate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
       --%>  
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
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