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
<head><title>EL07A</title></head>
<body>
	
	${map['1']}
    <br>
	${map["1"]}
    <br>
    ${map['2']}
    <br>
    ${map["2"]}

</body>
</html>
