<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_quo.model.*"%>

<%
SerQuoVO serQuoVO = (SerQuoVO) request.getAttribute("serQuoVO"); 
// UpdateSerQuoServlet.java (Concroller) 存入req的serQuoVO物件 (包括幫忙取出的serDmdVO, 也包括輸入資料錯誤時的serDmdVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
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
  h3{
  
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
    display:inline-block;
/*    文字要加此行 */
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>資料修改 - updateSerQuo.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/ser/serQuo/quoBackend.jsp">回首頁</a></h4>
	</td></tr>
</table>
<div style="text-align: center">
<h3>資料修改</h3>
</div>


<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ser_quo/UpdateQuoServlet.do" name="form1">
<table>
<tr>
		<td>估價單ID:</td>
		<td><input type="TEXT" name="quoID" size="8"
			 value="<%= serQuoVO.getQuoID() %>" /></td>
	</tr>
			<tr>
				<td>估價單狀態:</td>
				<td><input type="TEXT" name="quoStatus" size="8" 
				value="<%= serQuoVO.getQuoStatus() %>" /></td>
			</tr>
			<tr>
				<td>需求單編號:</td>
				<td><input type="TEXT" name="quoDmdID" size="50"
					value="<%= serQuoVO.getQuoDmdID()%>" /></td>
			</tr>
			<tr>
				<td>廠商編號:</td>
				<td><input type="TEXT" name="quoVdrID" size="50"
					value="<%= serQuoVO.getQuoVdrID()%>" /></td>
			</tr>
			<tr>
				<td>估價單日期:</td>
				<td><input name="quoDate" id="quoDate1" type="text" ></td>
			</tr>
			<tr>
				<td>估價單到期日:</td>
				<td><input name="quoExpiryDate" id="quoExpiryDate1" type="text"></td>
			</tr>
			<tr>
				<td>估價項目:</td>
				<td><input type="TEXT" name="quoItem" size="8"
					value="<%=serQuoVO.getQuoItem()%>" /></td>
			</tr>
			<tr>
				<td>估價總金額:</td>
				<td><input type="TEXT" name="quoTotalPrice"
					value="<%=serQuoVO.getQuoTotalPrice()%>" /></td>
			</tr>




		</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="quoID" value="<%=serQuoVO.getQuoID()%>">
<input type="submit" value="送出修改"></FORM>
</body>
<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->


<% 
  java.sql.Date quoDate = null;
  try {
	  quoDate = serQuoVO.getQuoDate();
   } catch (Exception e) {
	   quoDate = new java.sql.Date(System.currentTimeMillis());
   }
%>
<% 
  java.sql.Date  quoExpiryDate= null;
  try {
	  quoExpiryDate = serQuoVO.getQuoExpiryDate();
   } catch (Exception e) {
	   quoExpiryDate = new java.sql.Date(System.currentTimeMillis());
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
        $('#quoDate1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=quoDate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        $.datetimepicker.setLocale('zh');
        $('#quoExpiryDate1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=quoExpiryDate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });


</script>
</html>