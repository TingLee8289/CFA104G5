<%@ page contentType="text/html; charset=Big5" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%
	Map<String, String> map = new LinkedHashMap<String, String>();
	map.put("1", "peter1@foo.com");
	map.put("2", "peter2@qoo.com");
	pageContext.setAttribute("map", map);
%>
<html>
<head><title>EL07B</title></head>
<body>
	
	<c:forEach var="message" items="${map}">
		<li>${message.key}</li>
	</c:forEach>
	
	<br>----------------------------------------
	
	<c:forEach var="message" items="${map}">
		<li>${message.value}</li>
	</c:forEach>

</body>
</html>
