<%@page import="org.eclipse.jdt.internal.compiler.ast.IfStatement"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ezs.ren_lease.model.*"%>
<%@ page import="ezs.member.model.*"%>
<%@ page import="ezs.ren_listing.model.*"%>
<%@ page import="java.util.*"%>

<%-- <% request.setAttribute("memID", 6); 
%> --%>


 <%	RenLeaseService renLeaseSvc = new RenLeaseService();
    List<RenLeaseVO> list = renLeaseSvc.getAll();
    pageContext.setAttribute("list",list);
    
	RenLeaseVO renLeaseVO =new RenLeaseVO(); 
	MemberService memberSvc = new MemberService();
	
	Integer memID = (Integer)(session.getAttribute("memID"));
	MemberVO memberVO= memberSvc.getOneMember(memID); 
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



<!DOCTYPE html>
<html lang="zh-Hant">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>EASY SPACE</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/member.center.styles.css"	rel="stylesheet" />
<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<link rel="stylesheet"href=" https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css ">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">

<style>
#nav {
	background-color: lightgrey;
	z-index: 9999;
	padding: 0px;
	height: 40px;
	width: 100%;
	position: fixed;
}
</style>
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
<script src="https://kit.fontawesome.com/1c2ccc4859.js" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/frontend/ren_landlord/2825.51680d86fe84cd4ddf65.css">
</head>

<body style="" class="sb-nav-fixed">
<!-- 上端導覽列開始--------------------------------------- -->
	<div class="navbar navbar-expand-lg navbar-dark" id="nav">
		<div class="container">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03"
				aria-controls="navbarTogglerDemo03" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
				<ul class="navbar-nav ms-auto me-sm-2 mt-2 mt-lg-0">
					<li class="nav-item active me-3"><a class="nav-link text-dark"
						href="<%=request.getContextPath()%>/frontend/EZ_home.jsp">首頁 </a></li>
					<li class="nav-item me-3"><a class="nav-link text-dark"
						href="#">租賃服務</a></li>
					<li class="nav-item me-3"><a class="nav-link text-dark"
						href="<%=request.getContextPath()%>/frontend/sec_items/secItemsViewPage.jsp">二手家電</a>
					</li>
					<li class="nav-item me-3"><a class="nav-link text-dark"
						href="<%=request.getContextPath()%>/frontend/ser_ad/serAdViewPage.jsp">居家服務</a>
					</li>

					<%
					String memUsername = (String) session.getAttribute("memUsername");

					if (memUsername != null) {
					%>
					<li class="nav-item dropdown"><a class="nav-link text-dark"
						href="#" id="navbarDropdown" role="button"
						data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <img
							class="rounded-circle u-box-shadow-sm me-2 text-dark" width="25"
							height="25" src=" https://dummyimage.com/100/007bff/efefef"
							alt="Htmlstream"> ${memUsername} <i
							class="fa fa-angle-down   "></i></a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/frontend/member/memberCenter/buyerMemberCenter.jsp">會員中心</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/frontend/member/memberCenter/sellerMemberCenter.jsp">賣家中心</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/frontend/chat/index.jsp">聊聊</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/frontend/sec_items/shoppingCart.jsp">購物車</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/member/MemberServlet.do?action=logout">登出</a>
						</div></li>
					<%
					} else {
					%>
					<li class="nav-item me-3"><a class="nav-link text-dark"
						href="<%=request.getContextPath()%>/frontend/member/login.jsp">登入</a></li>
					<%
					}
					%>
				</ul>

			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<!-- 上端導覽列結束--------------------------------------- -->

	<!-- 側邊導覽列開始--------------------------------------- -->

	

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<!-- ------------------------------------------------------------------------------------------------- -->
						<div class="sb-sidenav-menu-heading">賣家管理專區</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-home"></i>
							</div> 租賃相關管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								 <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ren_landlord/applyToLandlord.jsp">申請成為房東</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ren_listing/listingView.jsp">房源管理</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ren_appointment/listRenAppByLDD.jsp">預約單管理</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ren_lease/select_page.jsp">租賃單管理</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-couch"></i>
							</div> 二手相關管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								  <a class="nav-link" href="<%=request.getContextPath()%>/frontend/sec_items/select_page.jsp">商品管理</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/sec_ord/listAllSecOrd.jsp">訂單管理</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages2" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-wrench"></i>
							</div> 服務相關管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages2"
							aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_vdr/update_SerVdr_input.jsp">成為廠商</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_vdr/listOneSerVdr.jsp">檢視廠商基本資料</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_ad/addSerAd.jsp">刊登服務</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_ad/listAllSerAd.jsp">檢視服務</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_quo/getQuoByVdrID.jsp">需求單管理</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_ord/findQuoBeforeByVdrID.jsp">新增訂單</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_ord/getOrdByVdrID.jsp">檢視訂單</a>
							</nav>
						</div>
						<!-- ------------------------------------------------------------------------------------------------- -->
					</div>
				</div>

			</nav>
		</div>

<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">

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
</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
	<script src="js/datatables-simple-demo.js"></script>

	<!-- 側邊導覽列結束--------------------------------------- -->
	<main></main>
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

            img.setAttribute('style', 'display:block;max-height:150px;max-weight:200px;position:relative;');
            
       
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