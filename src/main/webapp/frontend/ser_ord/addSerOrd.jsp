<%@page import="ezs.ser_dmd.model.SerDmdService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_ord.model.*"%>
<%@ page import="ezs.ser_quo.model.*"%>
<%@ page import="ezs.ser_dmd.model.*"%>

<%
SerOrdVO serOrdVO = (SerOrdVO) request.getAttribute("serOrdVO");
Integer quoID = Integer.valueOf(request.getParameter("quoID")) ;
SerQuoService serQuoSvc = new SerQuoService();
SerQuoVO oneQuoVO = serQuoSvc.getOneSerQuo(quoID);
pageContext.setAttribute("oneQuoVO", oneQuoVO);
SerDmdService serDmdSvc = new SerDmdService();
SerDmdVO oneDmdVO = serDmdSvc.getOneSerDmd(oneQuoVO.getQuoDmdID());
pageContext.setAttribute("oneDmdVO", oneDmdVO);
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>EASY SPACE</title>

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
<div style="width:500; margin:auto;">
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
<div style= "width:500px; margin:auto; border:solid 1px red;">
		<FORM METHOD="post" 
		ACTION="<%=request.getContextPath()%>/ser_ord/AddOrdServlet.do"
		name="form1">
		<table>
			<tr>
				
				<td><input type="hidden" name="ordStatus" size="8" value=0 /></td>
			</tr>
			<tr>
				
				<td><input type="hidden" name="ordPayStatus" size="8" value=0 /></td>
			</tr>
			<tr>
				<td >需求單ID:</td>
				<td><input type="TEXT" name="ordDmdID" size="50" value="${oneQuoVO.quoDmdID}" disabled/></td>
			</tr>
			<tr>
				<td>估價單ID:</td>
				<td><input type="TEXT" name="ordQuoID" size="50" value="${oneQuoVO.quoID}" disabled/></td>
			</tr>
			<tr>
				<td>會員ID:</td>
				<td><input type="TEXT" name="ordMemID" size="50" value="${oneDmdVO.dmdMemID}" disabled/></td>
			</tr>
			<tr>
				<td>廠商ID:</td>
				<td><input type="TEXT" name="ordVdrID" size="50" value="${oneQuoVO.quoVdrID}" disabled/></td>
			</tr>
			<tr>
				<td>服務類別ID:</td>
				<td><input type="TEXT" name="ordSerClaID" size="50" value="${oneDmdVO.dmdSerClaID}" disabled/></td>
			</tr>
			<tr>
				<td>業主姓名:</td>
				<td><input type="TEXT" name="ordClnName" size="50" value="${oneDmdVO.dmdName}" disabled/></td>
			</tr>
			<tr>
				<td>業主電話:</td>
				<td><input type="TEXT" name="ordClnTel" size="50" value="${oneDmdVO.dmdTel}" disabled/></td>
			</tr>
			<tr>
				<td>案場縣市:</td>
				<td><input type="TEXT" name="ordCounty" size="50" value="${oneDmdVO.dmdCounty}" disabled/></td>
			</tr>
			<tr>
				<td>案場地區:</td>
				<td><input type="TEXT" name="ordDist" size="50" value="${oneDmdVO.dmdRegion}" disabled /></td>
			</tr>
			<tr>
				<td>案場詳細地址:</td>
				<td><input type="TEXT" name="ordAddr" size="50" value="${oneDmdVO.dmdAddress}" disabled/></td>
			</tr>
			<tr>
				<td>業主統一編號:</td>
				<td><input type="TEXT" name="ordMemVatno" size="50"
					value="" /></td>
			</tr>
			<tr>
				<td>廠商統一編號:</td>
				<td><input type="TEXT" name="ordVdrVatno" size="50"
					value="${oneQuoVO.quoID}" /></td>
			</tr>
			<tr>
				<td>施作日期:</td>
				<td><input name="ordWorkDate" id="ordWorkDate1" type="text" ></td>
			</tr>
			<tr>
				<td>施工項目:</td>
				<td>
					<textarea name="ordItem"rows="4" cols="50" >${oneQuoVO.quoItem}</textarea>
				</td>
			</tr>
			<tr>
				<td>總金額:</td>
				<td><input type="TEXT" name="ordTotalPrice"
					value="${oneQuoVO.quoTotalPrice}" /></td>
			</tr>
			<tr>
				<td>備註:</td>
				<td>
				<textarea name="ordNote"rows="4" cols="50" ></textarea>
				</td>
			</tr>
			
			

		</table>
		<br> 
		<input type="hidden" name="ordDmdID" size="50" value="${oneQuoVO.quoDmdID}" />
		<input type="hidden" name="ordQuoID" size="50" value="${oneQuoVO.quoID}" />
		<input type="hidden" name="ordMemID" size="50" value="${oneDmdVO.dmdMemID}" />
		<input type="hidden" name="ordVdrID" size="50" value="${oneQuoVO.quoVdrID}" />
		<input type="hidden" name="ordSerClaID" size="50" value="${oneDmdVO.dmdSerClaID}" />
		<input type="hidden" name="ordClnName" size="50" value="${oneDmdVO.dmdName}" />
		<input type="hidden" name="ordClnTel" size="50" value="${oneDmdVO.dmdTel}" />
		<input type="hidden" name="ordCounty" size="50" value="${oneDmdVO.dmdCounty}" />
		<input type="hidden" name="ordDist" size="50" value="${oneDmdVO.dmdRegion}" />
		<input type="hidden" name="ordAddr" size="50" value="${oneDmdVO.dmdAddress}" />
		<input type="hidden" name="ordPrePay" value="10" />
		<input type="hidden" name="ordPayType" size="8" value=0 />
		<input name="ordPayDate" id="ordPayDate1" type="hidden">
		<input type="hidden" name="ordFpay" value="10" />
		<input type="hidden" name="ordFpayType" size="8" value=0 />
		<input name="ordFpayDate" id="ordFpayDate1" type="hidden">
		<input type="hidden" name="ordBuyerScore" value="<%=(serOrdVO == null) ? "0" : serOrdVO.getOrdBuyerScore() %>" />
		<input type="hidden" name="ordBuyerTxt" value="<%=(serOrdVO == null) ? "" : serOrdVO.getOrdBuyerTxt() %>" />
		<input type="hidden" name="ordVdrScore" value="<%=(serOrdVO == null) ? "0" : serOrdVO.getOrdVdrScore() %>" />
		<input type="hidden" name="ordVdrTxt" value="<%=(serOrdVO == null) ? "" : serOrdVO.getOrdVdrTxt() %>" />
		<input type="hidden" name="action" value="insert"> 
		<input type="submit" value="送出新增">
	</FORM>
	</div>
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