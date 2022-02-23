<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_quo.model.*"%>
<%@ page import="ezs.ser_dmd.model.*"%>
<%-- <% session.setAttribute("memID", 2);%> --%>
<%
SerQuoVO serQuoVO = (SerQuoVO) request.getAttribute("serQuoVO");
%>
<%
    Integer memID = (Integer)session.getAttribute("memID");
    SerDmdService serDmdSvc = new SerDmdService();
    List<SerDmdVO> OneMemDmdList = serDmdSvc.findByMemID(memID);
     									//如何動態取值
    pageContext.setAttribute("OneMemDmdList",OneMemDmdList);
     									
    String quoVdrID = (String) request.getParameter("quoVdrID");
    pageContext.setAttribute("quoVdrID", quoVdrID);
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

	<table id="table-1">
		<tr>
			<td>
				<h3>新增估價單 - addSerDmd.jsp</h3>
			</td>
			<td style="text-align: center">
				<h4>
					<a
						href="<%=request.getContextPath()%>/frontend/ser_quo/serQuoHome.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>新增估價單(投遞需求單):</h3>

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
		ACTION="<%=request.getContextPath()%>/ser_quo/AddQuoServlet.do"
		name="form1">
		<table>
			<tr>
				<td><input type="hidden" type="TEXT" name="quoStatus" size="8"
					value=0 /></td>
			</tr>
			
			<tr>
				<td>需求單ID:<font color=red><b>*</b></font></td>
				<td>
					<select size="1" name="quoDmdID">
						<c:forEach var="serDmdVO" items="${OneMemDmdList}">
							<c:choose>
					 			<c:when test="${serDmdVO.dmdStatus!=2}">
									<option value="${serDmdVO.dmdID}">${serDmdVO.dmdID}</option>
								</c:when>
							</c:choose>
						</c:forEach>
					</select>	
				</td>
			</tr>



			<tr>
				<td>廠商編號:</td>
				<td><input type="TEXT" name="quoVdrID" size="50" value="${quoVdrID}" disabled/></td>
			</tr>
			<tr>

				<td><input type="hidden" name="quoDate" id="quoDate1"
					type="text"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="quoExpiryDate"
					id="quoExpiryDate1" type="text"></td>
			</tr>
			<tr>
				<td><input type="hidden" type="TEXT" name="quoItem" size="8"
					value="" /></td>
			</tr>
			<tr>
				<td><input type="hidden" type="TEXT" name="quoTotalPrice"
					value="0" /></td>
			</tr>




		</table>
		<br> 
		<input type="hidden" name="action" value="insert"> 
		<input type="hidden" name="quoVdrID" size="50" value="${quoVdrID}" />
		<input type="submit" value="送出新增">
	</FORM>
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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
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