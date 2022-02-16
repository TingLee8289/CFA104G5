<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_ord.model.*"%>

<%
SerOrdVO serOrdVO = (SerOrdVO) request.getAttribute("serOrdVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>新增服務服務訂單 - addOrder.jsp</title>

<style>
table#table-1 {
	width: 450px;
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
				<h3>新增服務訂單 - addSerOrd.jsp</h3>
			</td>
			<td style="text-align: center">
				<h4>
					<a
						href="<%=request.getContextPath()%>/frontend/ser_ord/serOrdHome.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>新增服務訂單:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" 
		ACTION="<%=request.getContextPath()%>/ser_ord/AddOrdServlet.do"
		name="form1">
		<table>
			<tr>
				<td>服務訂單狀態:</td>
				<td><input type="TEXT" name="ordStatus" size="8" value=0 /></td>
			</tr>
			<tr>
				<td>付款狀態:</td>
				<td><input type="TEXT" name="ordPayStatus" size="8" value=0 /></td>
			</tr>
			<tr>
				<td>需求單ID:</td>
				<td><input type="TEXT" name="ordDmdID" size="50"
					value="<%=(serOrdVO == null) ? "4" : serOrdVO.getOrdDmdID()%>" /></td>
			</tr>
			<tr>
				<td>估價單ID:</td>
				<td><input type="TEXT" name="ordQuoID" size="50"
					value="<%=(serOrdVO == null) ? "4" : serOrdVO.getOrdQuoID()%>" /></td>
			</tr>
			<tr>
				<td>會員ID:</td>
				<td><input type="TEXT" name="ordMemID" size="50"
					value="<%=(serOrdVO == null) ? "2" : serOrdVO.getOrdMemID()%>" /></td>
			</tr>
			<tr>
				<td>廠商ID:</td>
				<td><input type="TEXT" name="ordVdrID" size="50"
					value="<%=(serOrdVO == null) ? "3" : serOrdVO.getOrdVdrID()%>" /></td>
			</tr>
			<tr>
				<td>服務類別ID:</td>
				<td><input type="TEXT" name="ordSerClaID" size="50"
					value="<%=(serOrdVO == null) ? "2" : serOrdVO.getOrdSerClaID()%>" /></td>
			</tr>
			<tr>
				<td>會員統一編號:</td>
				<td><input type="TEXT" name="ordMemVatno" size="50"
					value="<%=(serOrdVO == null) ? "87654321" : serOrdVO.getOrdMemVatno()%>" /></td>
			</tr>
			<tr>
				<td>廠商統一編號:</td>
				<td><input type="TEXT" name="ordVdrVatno" size="50"
					value="<%=(serOrdVO == null) ? "43218765" : serOrdVO.getOrdVdrVatno()%>" /></td>
			</tr>
			<tr>
				<td>業主姓名:</td>
				<td><input type="TEXT" name="ordClnName" size="50"
					value="<%=(serOrdVO == null) ? "劉冠鳴" : serOrdVO.getOrdClnName()%>" /></td>
			</tr>
			<tr>
				<td>業主電話:</td>
				<td><input type="TEXT" name="ordClnTel" size="50"
					value="<%=(serOrdVO == null) ? "0988654321" : serOrdVO.getOrdClnTel()%>" /></td>
			</tr>
			<tr>
				<td>施作日期:</td>
				<td><input name="ordWorkDate" id="ordWorkDate1" type="text" ></td>
			</tr>
			<tr>
				<td>案場縣市:</td>
				<td><input type="TEXT" name="ordCounty" size="50"
					value="<%=(serOrdVO == null) ? "台北市" : serOrdVO.getOrdCounty()%>" /></td>
			</tr>
			<tr>
				<td>案場地區:</td>
				<td><input type="TEXT" name="ordDist" size="50"
					value="<%=(serOrdVO == null) ? "狼港區" : serOrdVO.getOrdDist()%>" /></td>
			</tr>
			<tr>
				<td>案場詳細地址:</td>
				<td><input type="TEXT" name="ordAddr" size="50"
					value="<%=(serOrdVO == null) ? "研究院路二段128號" : serOrdVO.getOrdAddr()%>" /></td>
			</tr>
			<tr>
				<td>施工項目:</td>
				<td><input type="TEXT" name="ordItem" size="50"
					value="<%=(serOrdVO == null) ? "青仔600" : serOrdVO.getOrdItem()%>" /></td>
			</tr>
			<tr>
				<td>總金額:</td>
				<td><input type="TEXT" name="ordTotalPrice"
					value="<%=(serOrdVO == null) ? "600" : serOrdVO.getOrdTotalPrice()%>" /></td>
			</tr>
			<tr>
				<td>訂金:</td>
				<td><input type="TEXT" name="ordPrePay"
					value="<%=(serOrdVO == null) ? "100" : serOrdVO.getOrdPrePay()%>" /></td>
			</tr>
			<tr>
				<td>訂金付款方式:</td>
				<td><input type="TEXT" name="ordPayType" size="8" value=0 /></td>
			</tr>
			<tr>
				<td>訂金付款日期:</td>
				<td><input name="ordPayDate" id="ordPayDate1" type="text"></td>
			</tr>
			<tr>
				<td>尾款:</td>
				<td><input type="TEXT" name="ordFpay"
					value="<%=(serOrdVO == null) ? "100" : serOrdVO.getOrdPrePay()%>" /></td>
			</tr>
			<tr>
				<td>尾款付款方式:</td>
				<td><input type="TEXT" name="ordFpayType" size="8" value=0 /></td>
			</tr>
			<tr>
				<td>尾款付款日期:</td>
				<td><input name="ordFpayDate" id="ordFpayDate1" type="text"></td>
			</tr>

			<tr>
				<td>廠商評價客戶星數:</td>
				<td><input type="TEXT" name="ordBuyerScore"
					value="<%=(serOrdVO == null) ? "4" : serOrdVO.getOrdBuyerScore() %>" /></td>
			</tr>
			<tr>
				<td>廠商評價客戶留言:</td>
				<td><input type="TEXT" name="ordBuyerTxt"
					value="<%=(serOrdVO == null) ? "4" : serOrdVO.getOrdBuyerTxt() %>" /></td>
			</tr>
			<tr>
				<td>客戶評價廠商星數:</td>
				<td><input type="TEXT" name="ordVdrScore"
					value="<%=(serOrdVO == null) ? "4" : serOrdVO.getOrdVdrScore() %>" /></td>
			</tr>
			<tr>
				<td>廠商評價客戶留言:</td>
				<td><input type="TEXT" name="ordVdrTxt"
					value="<%=(serOrdVO == null) ? "4" : serOrdVO.getOrdVdrTxt() %>" /></td>
			</tr>
			<tr>
				<td>備註:</td>
				<td><input type="TEXT" name="ordNote"
					value="<%=(serOrdVO == null) ? "4" : serOrdVO.getOrdNote() %>" /></td>
			</tr>




		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->


<% 
  java.sql.Date ordWorkDate = null;
  try {
	  ordWorkDate = serOrdVO.getOrdWorkDate();
   } catch (Exception e) {
	   ordWorkDate = new java.sql.Date(System.currentTimeMillis());
   }
%>
<% 
  java.sql.Date  ordPayDate= null;
  try {
	  ordPayDate = serOrdVO.getOrdPayDate();
   } catch (Exception e) {
	   ordPayDate = new java.sql.Date(System.currentTimeMillis());
   }
%>
<% 
  java.sql.Date  ordFpayDate= null;
  try {
	  ordFpayDate = serOrdVO.getOrdFpayDate();
   } catch (Exception e) {
	   ordFpayDate = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#ordWorkDate1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=ordWorkDate%>' //,  value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        $.datetimepicker.setLocale('zh');
        $('#ordPayDate1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=ordPayDate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        $.datetimepicker.setLocale('zh');
        $('#ordFpayDate1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=ordFpayDate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
   
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
</html>