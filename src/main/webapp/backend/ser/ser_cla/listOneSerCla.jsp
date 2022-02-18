<%@page import="ezs.ser_cla.model.SerClaVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ezs.ser_cla.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  SerClaVO serClaVO = (SerClaVO) request.getAttribute("serClaVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>服務類別資料</title>

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
	width: 500px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body>
<jsp:include page="/frontend/EZ_header.jsp"></jsp:include>


<table id="table-1">
	<tr><td>
		 <h3>服務類別資料</h3>
		 <h4><a href="<%=request.getContextPath()%>/backend/ser/ser_cla/select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>類別編號</th>
		<th>類別名稱</th>
		
	</tr>
	<tr>
		<td><%=serClaVO.getSerClaID()%></td>
		<td><%=serClaVO.getSerClaName()%></td>
		
	</tr>
</table>
<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>
</body>
</html>