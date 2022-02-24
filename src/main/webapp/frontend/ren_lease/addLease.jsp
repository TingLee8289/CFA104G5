<%@page import="org.eclipse.jdt.internal.compiler.ast.IfStatement"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ren_lease.model.*"%>
<%@ page import="ezs.member.model.*"%>
<%@ page import="ezs.ren_listing.model.*"%>
<%@ page import="java.util.*"%>

<% request.setAttribute("memID", 6); 
//測試用，之後get方法要改成session.get...
%>


 <%	RenLeaseService renLeaseSvc = new RenLeaseService();
    List<RenLeaseVO> list = renLeaseSvc.getAll();
    pageContext.setAttribute("list",list);
    
	RenLeaseVO renLeaseVO =new RenLeaseVO(); 
	MemberService memberSvc = new MemberService();
	
	Integer memID = (Integer)(request.getAttribute("memID"));//6
	MemberVO memberVO= memberSvc.getOneMember(memID); //6
	pageContext.setAttribute("memberVO", memberVO);
	
 	for(RenLeaseVO renLeaseVO1 : list) {
		int lseMemId = (Integer) renLeaseVO1.getLseMemId();
		int lseId = (Integer) renLeaseVO1.getLseId();
		if(lseMemId == memID){
		renLeaseVO = renLeaseSvc.getOneRenLease(lseId);
		pageContext.setAttribute("renLeaseVO", renLeaseVO);
	}
} 
%>
<% 
RenListingService renListingService = new RenListingService();
 List<RenListingVO> list1 = renListingService.getAll();
pageContext.setAttribute("list1", list1);

%>



<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>EASY SPACE</title>
</head>

<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>新增租賃單 - addLease.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/frontend/ren_lease/select_page.jsp"><img src="<%=request.getContextPath()%>/images/ren/back_icon.png" width="60" height="60" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ren_lease/RenLeaseServlet.do" name="form1" enctype="multipart/form-data">
<table>
	 <tr>
		<td>房客會員編號</td>
		<td><input type="TEXT" name="lseLeaseMemId"></td>
	</tr>
		 <tr>
	</tr>
	<tr>
		<td>房東編號</td>
		<td><%=renLeaseVO.getLseLddId()%></td>
 	</tr>
 	<tr>
 		<td>房東姓名</td>
 		<td><%=memberVO.getMemName() %></td>
 	</tr>
 	<tr>
 		<td>地址</td>
 		<td><%=memberVO.getMemAddress() %></td>
 	</tr>
 	<tr>
 		<td>電子信箱</td>
 		<td><%=memberVO.getMemEmail() %></td>
 	</tr>
	<tr>
	
	<jsp:useBean id="renListingService2" scope="page" class="ezs.ren_listing.model.RenListingService" />
	
		<td>房源編號</td>
		<td>
			<select size="1" name="lseLisId">
				<option value="">請選擇</option>
 				<c:forEach var="renListingVO" items="${renListingService2.all}">
 				 <c:if test="${renLeaseVO.lseLddId == renListingVO.lisLddID}">
 				  	 <option value="${renListingVO.lisID}">${renListingVO.lisID}</option>
 				 	</c:if>
 				</c:forEach>
 			</select></td>
	</tr>
	<tr>
		<td>租金</td>
		<td><input type="TEXT" name="lsePrice"></td>
	</tr>
	<tr>
		<td>租賃開始時間</td>
		<td><input name="lseStart" id="f_date1" type="text"></td>
	</tr>
	<tr>
		<td>租賃結束時間:</td>
		<td><input name="lseEnd" id="f_date2" type="text"></td>
	</tr>
 	<tr>
		<td>上傳合約照片:</td>
		 <td>
			<div id="wrapper">
				<input id="put1" class="btn btn-light btn--m btn--inline selectimg"
				type="file" accept="image/*" style="display: block;"
				name="lsePic" value="<%= (renLeaseVO==null)? "" : renLeaseVO.getLsePic()%>">
			</div>
		</td>
	</tr> 
	
</table>
<br>
<input type="hidden" name="lseMemId" value="${renLeaseVO.lseMemId}">
<input type="hidden" name="lseLisId" value="${renLeaseVO.lseLisId}">
<input type="hidden" name="lseLddId" value="${renLeaseVO.lseLddId}">
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</body>

<% 
  java.sql.Date lseStart = null;
  try {
	  lseStart = renLeaseVO.getLseStart();
   } catch (Exception e) {
	   lseStart = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=lseStart%>', value:   new Date(),
        });</script>
<% 
  java.sql.Date lseEnd = null;
  try {
	  lseEnd = renLeaseVO.getLseEnd();
   } catch (Exception e) {
	   lseEnd = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date2').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '<%=lseEnd%>',value:   new Date(),
           minDate:               '-1970-01-01',  // 去除今日(不含)之前
        });</script>

	<script>
        let blockArray = [];

        const wrapper = document.querySelector('#wrapper');
        const block1 = genSelectImgBlock1();
        wrapper.appendChild(block1);

        function genSelectImgBlock1() {
            const div = document.createElement('div');
            const inputBtn = document.querySelector('#put1');
            const img = document.createElement('img');
            const hr = document.createElement('hr');

            img.setAttribute('style', 'display:block;max-height:300px;position:absolute;');

            div.appendChild(img);

            inputBtn.addEventListener('input', (e) => {
                const url = URL.createObjectURL(inputBtn.files[0]);
                console.log(url);
                if (url) { 
                    img.setAttribute('src', url);
                    if (blockArray[blockArray.length - 1] === div) {
                        const block = genSelectImgBlock();
                        wrapper.appendChild(block);
                    }
                }
            });

            return div;
        }
    
        
    </script>
</html>