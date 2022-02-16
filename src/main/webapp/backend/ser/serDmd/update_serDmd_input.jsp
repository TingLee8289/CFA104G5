<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ser_dmd.model.*"%>

<%
SerDmdVO serDmdVO = (SerDmdVO) request.getAttribute("serDmdVO"); 
//SerDmdServlet.java (Concroller) 存入req的serDmdVO物件 (包括幫忙取出的serDmdVO, 也包括輸入資料錯誤時的serDmdVO物件)
%>
<%= serDmdVO==null %> --${serDmdVO.dmdID}--
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>需求單資料修改 - update_serDmd_input.jsp</title>

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
		 <h3>需求單資料修改 - update_serDmd_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/ser/serDmd/select_page.jsp">回首頁</a></h4>
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

<FORM METHOD="post" enctype="multipart/form-data" ACTION="<%=request.getContextPath()%>/ser_dmd/SerDmdServlet.do" name="form1">
<table>
	<tr>
		<td>需求單ID:</td>
		<td><input type="TEXT" name="dmdID" size="8"
			 value="<%= serDmdVO.getDmdID() %>" /></td>
	</tr>
	<tr>
		<td>需求單狀態:</td>
		<td><input type="TEXT" name="dmdStatus" size="8"
			 value="<%= serDmdVO.getDmdStatus() %>" /></td>
	</tr>
	<tr>
		<td>會員ID:</td>
		<td><input type="TEXT" name="dmdMemID" size="50"
			 value="<%= serDmdVO.getDmdMemID() %>"/></td>
	</tr>
	
	<tr>
		<td>服務類別ID:</td>
		<td><input type="TEXT" name="dmdSerClaID" size="8"
			 value="<%= serDmdVO.getDmdSerClaID() %>"/></td>
	</tr>
	<tr>
		<td>需求人姓名:</td>
		<td><input type="TEXT" name="dmdName" 
			 value="<%= serDmdVO.getDmdName() %>"/></td>
	</tr>
	<tr>
		<td>需求人電話:</td>
		<td><input type="TEXT" name="dmdTel" 
			 value="<%=  serDmdVO.getDmdTel() %>"/></td>
	</tr>
	<tr>
		<td>需求人信箱:</td>
		<td><input type="EMAIL" name="dmdMail" 
			 value="<%=  serDmdVO.getDmdMail() %>"/></td>
	</tr>
	<tr>
		<td>案場縣市:</td>
		<td><input type="TEXT" name="dmdCounty" size="20"
			 value="<%= serDmdVO.getDmdCounty() %>"/></td>
	</tr>
	<tr>
		<td>案場地區:</td>
		<td><input type="TEXT" name="dmdRegion" size="20"
			 value="<%= serDmdVO.getDmdRegion() %>"/></td>
	</tr>
	<tr>
		<td>案場詳細地址:</td>
		<td><input type="TEXT" name="dmdAddress" size="50"
			 value="<%= serDmdVO.getDmdAddress() %>"/></td>
	</tr>
	<tr>
		<td>空間類別:</td>
		<td><input type="TEXT" name="dmdSpaceClass" size="20"
			 value="<%= serDmdVO.getDmdSpaceClass() %>"/></td>
	</tr>
	<tr>
		<td>坪數:</td>
		<td><input type="TEXT" name="dmdSquare" 
			 value="<%= serDmdVO.getDmdSquare() %>"/></td>
	</tr>
	<tr>
		<td>預算:</td>
		<td><input type="TEXT" name="dmdBudget" 
			 value="<%= serDmdVO.getDmdBudget() %>"/></td>
	</tr>
	<tr>
		<td>需求簡介:</td>
		<td><input type="TEXT" name="dmdIntro" size= "100"
			 value="<%= serDmdVO.getDmdIntro() %>"/></td>
	</tr>
	<tr>
		<td>照片:</td>
		<td><input type="file" name="dmdPic" 
			 value="<%= serDmdVO.getDmdPic() %>"/></td>
			 <td><img src="<%=request.getContextPath()%>/ser_dmd/DBGifReader4?dmd_id=${serDmdVO.dmdID}" width = 200px></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="dmdID" value="<%=serDmdVO.getDmdID()%>">
<input type="submit" value="送出修改"></FORM>
</body>



</html>