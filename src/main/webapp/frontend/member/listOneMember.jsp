<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.member.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
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
</style>

<style>
  table {
	width: 800px;
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
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>${memberVO.memID}- ${memberVO.memUsername} 會員資料</h3>
	</td></tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<td>會員頭像</td>
		<td><img src="<%=request.getContextPath()%>/DBGifReader?mem_ID=${memberVO.memID}" height=200px width=200px></td>
	</tr>
	<tr>			
		<td>會員編號:</td>
		<td>${memberVO.memID}</td>
	</tr>
	<tr>
		<td>帳號:</td>
		<td>${memberVO.memUsername}</td>
	</tr>
	<tr>
		<td>姓名:</td>
		<td>${memberVO.memName}</td>
	</tr>
	<tr>
		<td>電話:</td>
		<td>${memberVO.memPhone}</td>
	</tr>
	<tr>
		<td>地址:</td>
		<td>${memberVO.memAddress}</td>
	</tr>
	<tr>
		<td>email:</td>
		<td>${memberVO.memEmail}</td>
	</tr>
	<c:if test="${memberVO.memSupplier == 1}">
	<tr>
		<td>會員統一編號:</td>
		<td>${memberVO.memVatno}</td>
	</tr>
	</c:if>
<!-- 	<tr> -->
<!-- 		<td>評價總數:</td> -->
<%-- 		<td>${memberVO.memRevCount}</td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>評價總分:</td> -->
<%-- 		<td>${memberVO.memRevScore}</td> --%>
<!-- 	</tr> -->
	<tr>
		<td>被評價總數:</td>
		<td>${memberVO.memRedCount}</td>
	</tr>
	<tr>
		<td>被評價總分:</td>
		<td>${memberVO.memRedScore}</td>
	</tr>
	<tr>
		<td>被評價均分:</td>
		<td>
					<c:choose>
						<c:when test="${(memberVO.memRedCount) == 0}">尚無評分</c:when>
						<c:otherwise>
							<fmt:formatNumber type="number" maxFractionDigits="1" 
								value="${(memberVO.memRedScore/memberVO.memRedCount)}"/>
						</c:otherwise>
					</c:choose></td>
	</tr>
	<tr>
	<td><form method="post" action="<%= request.getContextPath() %>/member/MemberServletUpdate.do">
						<input type="submit" value="修改"> 
						<input type="hidden" name="memID" value="${memberVO.memID}"> 
						<input type="hidden" name="action" value="getOne_For_Update">
					</form></td>
	</tr>


</table>

</body>




<footer>
    <section class="ccc website-map pt-5">
      <div class="container">
        <div class="row">
          <div class="footer-company-address col-xs-6 col-sm-3">
            <address class="color-light-20">
              1600 Amphitheatre Parkway
              <br> Mountain View, CA 94043
            </address>
          </div>
          <div class="footer-about-us col-xs-6 col-sm-3">
            <h4 class="my-2">關於我們</h4>
            <ul class="list-unstyled list-light text-light">
              <li>
                <a href="#">品牌故事</a>
              </li>
              <li>
                <a href="#">最新消息</a>
              </li>
              <li>
                <a href="#">連絡我們</a>
              </li>
            </ul>
          </div>
          <br style="clear:both" class="hidden-sm-up">
          <div class="footer-service col-xs-6 col-sm-3">
            <h4 class="my-2">功能服務</h4>
            <ul class="list-unstyled list-light">
              <li>
                <a href="#">空間租賃</a>
              </li>
              <li>
                <a href="#">空間服務</a>
              </li>
              <li>
                <a href="#">二手交易商城</a>
              </li>

            </ul>
          </div>
          <div class="footer-center col-xs-6 col-sm-3">
            <h4 class="my-2">會員中心</h4>
            <ul class="list-unstyled list-light">
              <li>
                <a href="#">會員註冊</a>
              </li>
              <li>
                <a href="#">忘記密碼</a>
              </li>
            </ul>
          </div>
        </div>
        <hr>
        <div class="footer-copyright row f-flex justify-content-between">
          <div class="col-md-8 text-xs-center text-left my-1">
            <p class="mt-1 text-muted"> © Copyright 2021 • All Rights
              Reserved |
              <a class=" " href="#">Disclaimer</a> |
              <a class=" " href="#">Contact</a>
            </p>
          </div>
        </div>
      </div>
    </section>
    <section class="kkkk company-mail pt-3 bg-gray">
      <div class="container">
        <div class="row text-center justify-content-center">
          <div class="col-12 col-md-8 col-lg-7">
            <p class="text-h2">support@website.com</p>
            <p class="text-h3">Fusce dapibus, tellus ac cursus commodo, tortor
              mauris condimentum nibh, ut fermentum massa justo sit amet risus.
            </p>
          </div>
        </div>
      </div>
    </section>
  </footer>
</div>
</html>

