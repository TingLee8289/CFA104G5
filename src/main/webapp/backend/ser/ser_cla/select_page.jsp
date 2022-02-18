<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%--JSTL標籤宣告 --%>

<html>
<head>
<title>Easy Space 服務類別</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body>
<jsp:include page="/frontend/EZ_header.jsp"></jsp:include>

<table id="table-1">
   <tr><td><h3>Easy Space 服務類別</h3></td></tr>
</table>

<p>This is the Home page for Easy Space 服務類別</p>

<h3>資料查詢:</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='<%=request.getContextPath()%>/backend/ser/ser_cla//listAllSerCla.jsp'>List</a> all SerCla  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ser_cla/GetSerClaServlet.do">
        <b>輸入服務類別編號 (例如:1):</b>
        <input type="text" name="serClaID">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="serClaSvc" scope="page" class="ezs.ser_cla.model.SerClaService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ser_cla/GetSerClaServlet.do" >
       <b>選擇服務類別編號:</b>
       <select size="1" name="serClaID">
         <c:forEach var="serClaVO" items="${serClaSvc.all}" > 
          <option value="${serClaVO.serClaID}">${serClaVO.serClaID}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ser_cla/GetSerClaServlet.do" >
       <b>選擇類別名稱:</b>
       <select size="1" name="serClaID">
         <c:forEach var="serClaVO" items="${serClaSvc.all}" > 
          <option value="${serClaVO.serClaID}">${serClaVO.serClaName}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
 
 
  
 
</ul>


<h3>服務類別管理</h3>

<ul>
  <li><a href='addSerCla.jsp'>Add</a> a new SerCla.</li>
</ul>

<jsp:include page="/frontend/EZ_footer.jsp"></jsp:include>
</body>
</html>