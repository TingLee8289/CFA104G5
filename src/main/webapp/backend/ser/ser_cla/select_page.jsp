<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%--JSTL標籤宣告 --%>

<html>
<head>
<title>EASY SPACE</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">


</head>
<body>


<h3>後台</h3>
<br>


	


<ul>
  <li><a href='<%=request.getContextPath()%>/backend/ser/ser_cla/viewSerCla.jsp'>檢視服務類別</a><br></li>
  </ul>
  
  <ul>
  <li><a href='<%=request.getContextPath()%>/backend/ser/ser_cla/readSerCla.jsp'>查詢服務類別(依條件)</a><br></li>
  </ul>
  

<ul>
  <li><a href='<%=request.getContextPath()%>/backend/ser/ser_cla/addSerCla.jsp'>新增服務類別</a></li>
</ul>

<ul>
  <li><a href='<%=request.getContextPath()%>/backend/ser/ser_cla/listAllSerCla.jsp'>修改服務類別</a></li>
</ul>



</body>
</html>