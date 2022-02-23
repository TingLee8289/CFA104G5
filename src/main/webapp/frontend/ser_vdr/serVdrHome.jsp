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
	
<%-- <jsp:include page="/frontend/member/memberCenter/sellerMemberCenter.jsp" /> --%>



	<h2>廠商</h2>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
		<li><a href='update_SerVdr_input.jsp'>新增廠商資料</a> </li>
	</ul>
	
	
	<ul>
		<li><a href='listOneSerVdr.jsp'>檢視廠商基本資料</a>  <br></li>
		
	</ul>
	<ul>
		<li><a href='<%=request.getContextPath()%>/frontend/ser_ad/addSerAd.jsp'>刊登服務</a>  <br></li>
		
	</ul>
	<ul>
		<li><a href='<%=request.getContextPath()%>/frontend/ser_ad/listAllSerAd.jsp'>檢視服務內容</a>  <br></li>
		
	</ul>
	
	<ul>
		<li>
		<a href="<%=request.getContextPath()%>/frontend/ser_quo/getQuoByVdrID.jsp">廠商檢視估價單</a>
		</li>
	</ul>
	
	
	<ul>
		<li>
		<a href="<%=request.getContextPath()%>/frontend/ser_ord/findQuoBeforeByVdrID.jsp">廠商新增訂單</a>
		</li>
	</ul>
	<ul>
		<li>
		<a href="<%=request.getContextPath()%>/frontend/ser_ord/getOrdByVdrID.jsp">廠商檢視訂單</a>
		</li>
	</ul>
	
	
	
	
	
	
	
	
<!-- 	<ul> -->
<!-- 		<li><a href='listAllSerVdr.jsp'>廠商修改資料</a>  <br></li> -->
<!-- 	</ul> -->
<!-- 	<ul> -->
<!-- 		<li><a href='viewSerVdr.jsp'>會員檢視廠商資料</a> </li> -->
<!-- 	</ul> -->
	
<!-- 	<ul> -->
<!-- 		<li><a href='readSerVdr.jsp'>會員檢視廠商資料(依條件)</a> </li> -->
<!-- 	</ul> -->
	
	




	


</body>
</html>