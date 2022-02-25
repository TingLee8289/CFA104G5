<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<%@ page import="ezs.ser_quo.model.*"%>

<%
SerQuoVO serQuoVO = (SerQuoVO) request.getAttribute("serQuoVO"); 
// UpdateSerQuoServlet.java (Concroller) 存入req的serQuoVO物件 (包括幫忙取出的serDmdVO, 也包括輸入資料錯誤時的serDmdVO物件)
%>
<jsp:useBean id="serDmdSvc" scope="page" class="ezs.ser_dmd.model.SerDmdService" />
<!DOCTYPE html>

<html>
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

</head>
<body class="sb-nav-fixed">
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
								 <a class="nav-link" href="layout-static.html">申請成為房東</a>
                                    <a class="nav-link" href="layout-static.html">房源管理</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ren_appointment/listRenAppByLDD.jsp">預約單管理</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">租賃單管理</a>
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
                                    <a class="nav-link" href="<%=request.getContextPath()%>/frontend/ser_vdr/addSerVdr.jsp">成為廠商</a>
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
<!-- main 開始--------------------------------------------------------------------------------- -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
<!-- 塞頁面從這裡開始--------------------------------------------------------------------------------- -->


<div style="text-align: center">
<h2>回覆報價</h2>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ser_quo/UpdateQuoByVdrServlet.do" name="form1">
<table>
	<tr>
		<td>需求單編號：</td>
		<td>
			<c:forEach var="serDmdVO" items="${serDmdSvc.all}">
                    <c:if test="${serQuoVO.quoDmdID==serDmdVO.dmdID}">
	                    ${serDmdVO.dmdID}
                    </c:if>
            </c:forEach>
		</td>
	</tr>
	<tr>
		<td>需求人姓名:</td>
		<td>
			<c:forEach var="serDmdVO" items="${serDmdSvc.all}">
                    <c:if test="${serQuoVO.quoDmdID==serDmdVO.dmdID}">
	                    ${serDmdVO.dmdName}
                    </c:if>
            </c:forEach>
		</td>
	</tr>
	<tr>
		<td>需求人電話:</td>
		<td>
			<c:forEach var="serDmdVO" items="${serDmdSvc.all}">
                    <c:if test="${serQuoVO.quoDmdID==serDmdVO.dmdID}">
	                    ${serDmdVO.dmdTel}
                    </c:if>
            </c:forEach>
		</td>
	</tr>
	<tr>
		<td>需求人信箱:</td>
		<td>
			<c:forEach var="serDmdVO" items="${serDmdSvc.all}">
                    <c:if test="${serQuoVO.quoDmdID==serDmdVO.dmdID}">
	                    ${serDmdVO.dmdMail}
                    </c:if>
            </c:forEach>
		</td>
	</tr>
	<tr>
		<td>案場縣市:</td>
		<td>
			<c:forEach var="serDmdVO" items="${serDmdSvc.all}">
                    <c:if test="${serQuoVO.quoDmdID==serDmdVO.dmdID}">
	                    ${serDmdVO.dmdCounty}
                    </c:if>
            </c:forEach>
		</td>
	</tr>
	<tr>
		<td>案場地區:</td>
		<td>
			<c:forEach var="serDmdVO" items="${serDmdSvc.all}">
                    <c:if test="${serQuoVO.quoDmdID==serDmdVO.dmdID}">
	                    ${serDmdVO.dmdRegion}
                    </c:if>
            </c:forEach>
		</td>
	</tr>
	<tr>
		<td>案場詳細地址:</td>
		<td>
			<c:forEach var="serDmdVO" items="${serDmdSvc.all}">
                    <c:if test="${serQuoVO.quoDmdID==serDmdVO.dmdID}">
	                    ${serDmdVO.dmdAddress}
                    </c:if>
            </c:forEach>
		</td>
	</tr>
	<tr>
		<td>空間類別:</td>
		<td>
			<c:forEach var="serDmdVO" items="${serDmdSvc.all}">
                    <c:if test="${serQuoVO.quoDmdID==serDmdVO.dmdID}">
	                    ${serDmdVO.dmdSpaceClass}
                    </c:if>
            </c:forEach>
		</td>
	</tr>
	<tr>
		<td>坪數:</td>
		<td>
			<c:forEach var="serDmdVO" items="${serDmdSvc.all}">
                    <c:if test="${serQuoVO.quoDmdID==serDmdVO.dmdID}">
	                    ${serDmdVO.dmdSquare}
                    </c:if>
            </c:forEach>
		</td>
	</tr>
	<tr>
		<td>預算:</td>
		<td>
			<c:forEach var="serDmdVO" items="${serDmdSvc.all}">
                    <c:if test="${serQuoVO.quoDmdID==serDmdVO.dmdID}">
	                    ${serDmdVO.dmdBudget}
                    </c:if>
            </c:forEach>
		</td>
	</tr>
	<tr>
		<td>需求簡介:</td>
		<td>
		<table>
			<c:forEach var="serDmdVO" items="${serDmdSvc.all}">
                    <c:if test="${serQuoVO.quoDmdID==serDmdVO.dmdID}">
	                    ${serDmdVO.dmdIntro}
                    </c:if>
            </c:forEach>
            </table>
		</td>
	</tr>
	<tr>
		<td>照片:</td>
		<td>
		<table>
			<c:forEach var="serDmdVO" items="${serDmdSvc.all}">
                    <c:if test="${serQuoVO.quoDmdID==serDmdVO.dmdID}">
	                  <td> <img src="<%=request.getContextPath()%>/ser_dmd/DBGifReader4?dmdID=${serDmdVO.dmdID}"width=200px></td>
                    </c:if>
            </c:forEach>
            </table>
		</td>
	</tr>
		
			<tr>
				<td>估價單日期:</td>
				<td><input name="quoDate" id="quoDate1" type="text" ></td>
			</tr>
			<tr>
				<td>估價單到期日:</td>
				<td><input name="quoExpiryDate" id="quoExpiryDate1" type="text"></td>
			</tr>
			<tr>
				<td>估價項目:</td>
				<td>
				<textarea name="quoItem"rows="4" cols="50" >${serQuoVO.quoItem}</textarea>
				
				</td>
			</tr>
			<tr>
				<td>估價總金額:</td>
				<td><input type="TEXT" name="quoTotalPrice"
					value="<%=serQuoVO.getQuoTotalPrice()%>" /></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="送出修改" >
				</td>
			</tr>




		</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="quoID" value="<%=serQuoVO.getQuoID()%>">
<input type="hidden" name="quoDmdID" size="50" value="<%= serQuoVO.getQuoDmdID()%>" />
<input type="hidden" name="quoStatus" size="8" value=1 />
<input type="hidden" name="quoVdrID" size="50" value="<%= serQuoVO.getQuoVdrID()%>" />
</FORM>

<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->


<% 
  java.sql.Date quoDate = null;
  try {
	  quoDate = serQuoVO.getQuoDate();
   } catch (Exception e) {
	   quoDate = new java.sql.Date(System.currentTimeMillis());
   }
%>
<% 
  java.sql.Date  quoExpiryDate= null;
  try {
	  quoExpiryDate = serQuoVO.getQuoExpiryDate();
   } catch (Exception e) {
	   quoExpiryDate = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#quoDate1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=quoDate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        $.datetimepicker.setLocale('zh');
        $('#quoExpiryDate1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=quoExpiryDate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });


</script>





<!-- 塞頁面從這裡結束--------------------------------------------------------------------------------- -->
				</div>
			</main>
		</div>
<!-- main 結束--------------------------------------------------------------------------------- -->
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
</html>