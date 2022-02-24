<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_ord.model.*"%>

<%
SerOrdVO serOrdVO = (SerOrdVO) request.getAttribute("serOrdVO");
// UpdateSerQuoServlet.java (Concroller) 存入req的serOrdVO物件 (包括幫忙取出的serDmdVO, 也包括輸入資料錯誤時的serDmdVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>EASY SPACE</title>

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

h3 {
	
}
</style>

<style>
table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
	margin: 0 auto;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
	display: inline-block;
	/*    文字要加此行 */
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>訂單資料修改 - updateSerOrd.jsp</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/backend/ser/serOrd/ordBackend.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>
	<div style="text-align: center">
		<h3>訂單修改</h3>
	</div>


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
		ACTION="<%=request.getContextPath()%>/ser_ord/UpdateOrdByVdrServlet.do"
		name="form1">
		<table>
			<tr>
				<td>訂單ID:</td>
				<td><input type="TEXT" name="ordID" size="8" value="<%=serOrdVO.getOrdID()%>" disabled/></td>
			</tr>
			<tr>
				<td>服務訂單狀態:</td>
				<td><input type="TEXT" name="" size="8" value="未成立" disabled/></td>
			</tr>
			
			
			<tr>
				<td>會員ID:</td>
				<td><input type="TEXT" name="ordMemID" size="50" value="<%=serOrdVO.getOrdMemID()%>" disabled/></td>
			</tr>
			
			<tr>
				<td>服務類別ID:</td>
				<td><input type="TEXT" name="ordSerClaID" size="40" value="<%=serOrdVO.getOrdSerClaID()%>" disabled /></td>
			</tr>
			
			<tr>
				<td>業主姓名:</td>
				<td><input type="TEXT" name="ordClnName" size="50" value="<%=serOrdVO.getOrdClnName()%>" disabled/></td>
			</tr>
			<tr>
				<td>業主電話:</td>
				<td><input type="TEXT" name="ordClnTel" size="50" value="<%=serOrdVO.getOrdClnTel()%>" disabled/></td>
			</tr>
			<tr>
				<td>施作日期:</td>
				<td><input name="ordWorkDate" id="ordWorkDate1" type="text" disabled></td>
			</tr>
			<tr>
				<td>案場縣市:</td>
				<td><input type="TEXT" name="ordCounty" size="50" value="<%=serOrdVO.getOrdCounty()%>" disabled/></td>
			</tr>
			<tr>
				<td>案場地區:</td>
				<td><input type="TEXT" name="ordDist" size="50" value="<%=serOrdVO.getOrdDist()%>" disabled/></td>
			</tr>
			<tr>
				<td>案場詳細地址:</td>
				<td><input type="TEXT" name="ordAddr" size="40" value="<%=serOrdVO.getOrdAddr()%>" disabled/></td>
			</tr>
			<tr>
				<td>施工項目:</td>
				<td><input type="TEXT" name="ordItem" size="50" value="<%=serOrdVO.getOrdItem()%>" disabled/></td>
			</tr>
			<tr>
				<td>總金額:</td>
				<td><input type="TEXT" name="ordTotalPrice" value="<%=serOrdVO.getOrdTotalPrice()%>" disabled/></td>
			</tr>
			<tr>
				<td>會員統一編號:</td>
				<td><input type="TEXT" name="ordMemVatno" size="40" value="<%=serOrdVO.getOrdMemVatno()%>" /></td>
			</tr>
			<tr>
				<td>廠商統一編號:</td>
				<td><input type="TEXT" name="ordVdrVatno" size="40" value="<%=serOrdVO.getOrdVdrVatno()%>" /></td>
			</tr>
			<tr>
				<td>付款狀態:</td>
				<td><input type="TEXT" name="ordPayStatus" size="8" value="確認收款" disabled/></td>
			</tr>
			<tr>
				<td>付款方式:</td>
				<td>
					
					<input type="radio" name="ordPayType" value="1"  />現金付款
					<input type="radio" name="ordPayType" value="2"  />信用卡
					<input type="radio" name="ordPayType" value="3"  />ATM轉帳
				
				</td>
			</tr>
		
			<tr>
				<td>備註:</td>
				<td><input type="TEXT" name="ordNote" value="<%=serOrdVO.getOrdNote()%>" /></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="送出修改">
				</td>
			</tr>
			

		</table>
		<br>
		<input type="hidden" name="action" value="update"> 
		<input type="hidden" name="ordID" value="<%=serOrdVO.getOrdID()%>"> 
		<input type="hidden" name="ordID" size="8" value="<%=serOrdVO.getOrdID()%>" />
		<input type="hidden" name="ordMemID" size="50" value="<%=serOrdVO.getOrdMemID()%>" />
		<input type="hidden" name="ordStatus" size="8" value="1" />
		<input type="hidden" name="ordDmdID" size="50" value="<%=serOrdVO.getOrdDmdID()%>" />
		<input type="hidden" name="ordVdrID" size="50" value="<%=serOrdVO.getOrdVdrID()%>" />
		<input type="hidden" name="ordQuoID" size="50" value="<%=serOrdVO.getOrdQuoID()%>" />
		<input type="hidden" name="ordSerClaID" size="40" value="<%=serOrdVO.getOrdSerClaID()%>" />
		<input type="hidden" name="ordClnName" size="50" value="<%=serOrdVO.getOrdClnName()%>" />
		<input type="hidden" name="ordClnTel" size="50" value="<%=serOrdVO.getOrdClnTel()%>" />
		<input name="ordWorkDate" id="ordWorkDate1" type="hidden"value="<%=serOrdVO.getOrdWorkDate()%>">
		<input type="hidden" name="ordCounty" size="50" value="<%=serOrdVO.getOrdCounty()%>" />
		<input type="hidden" name="ordDist" size="50" value="<%=serOrdVO.getOrdDist()%>" />
		<input type="hidden" name="ordAddr" size="40" value="<%=serOrdVO.getOrdAddr()%>" />
		<input type="hidden" name="ordItem" size="50" value="<%=serOrdVO.getOrdItem()%>" />
		<input type="hidden" name="ordTotalPrice" value="<%=serOrdVO.getOrdTotalPrice()%>" />
		<input type="hidden" name="ordPayStatus" size="8" value="2" />
		<input type="hidden" name="ordPrePay" value="<%=serOrdVO.getOrdPrePay()%>" />
		<input name="ordPayDate" id="ordPayDate1" type="hidden"value="<%=serOrdVO.getOrdPayDate()%>">
		<input type="hidden" name="ordFpay" value="<%=serOrdVO.getOrdPrePay()%>" />
		<input type="hidden" name="ordFpayType" size="8" value="<%=serOrdVO.getOrdFpayType()%>" />
		<input name="ordFpayDate" id="ordFpayDate1" type="hidden" value="<%=serOrdVO.getOrdFpayDate()%>">
		<input type="hidden" name="ordBuyerScore" value="<%=serOrdVO.getOrdBuyerScore()%>" />
		<input type="hidden" name="ordBuyerTxt" value="<%=serOrdVO.getOrdBuyerTxt()%>" />
		<input type="hidden" name="ordVdrScore" value="<%=serOrdVO.getOrdVdrScore()%>" />
		<input type="hidden" name="ordVdrTxt" value="<%=serOrdVO.getOrdVdrTxt()%>" />
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