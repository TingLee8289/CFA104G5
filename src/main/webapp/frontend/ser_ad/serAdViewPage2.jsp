<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ser_vdr.model.*"%>
<%@ page import="ezs.ser_ad.model.*"%>
<%@ page import="ezs.ser_cla.model.*"%>
<%
SerVdrService serVdrSvc = new SerVdrService();
List<SerVdrVO> serVdrList = serVdrSvc.getAll();
pageContext.setAttribute("serVdrList", serVdrList);

SerAdService serAdSvc = new SerAdService();
List<SerAdVO> serAdList = serAdSvc.getAll();
pageContext.setAttribute("serAdList", serAdList);

SerClaService serClaSvc = new SerClaService();
List<SerClaVO> serClaList = serClaSvc.getAll();
pageContext.setAttribute("serClaList", serClaList);

%>



<!DOCTYPE html>
<html>
  <head>
    <!-- 
    More Templates Visit ==> ProBootstrap.com
    Free Template by ProBootstrap.com under the License Creative Commons 3.0 ==> (probootstrap.com/license)

    IMPORTANT: You can do whatever you want with this template but you need to keep the footer link back to ProBootstrap.com
    -->
    <title>EASY SPACE</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Free HTML5 Website Template by ProBootstrap.com" />
    <meta name="keywords" content="free bootstrap 4, free bootstrap 4 template, free website templates, free html5, free template, free website template, html5, css3, mobile first, responsive" />
    <meta name="author" content="ProBootstrap.com" />
    
    <!-- <link href="https://fonts.googleapis.com/css?family=Work+Sans" rel="stylesheet"> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/open-iconic-bootstrap.min.css">
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/owl.theme.default.min.css">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/icomoon.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/animate.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/viewPage.css">
<style>
      *{
        box-sizing: border-box;
      }
      :root{
        --header-height: 60px;
        --aside-width: 180px;
      }
      body{
        margin: 0;
      }
      img{
        max-width: 100%;
        max-height:100%
      }

      /* ==================== header 區域 ==================== */
      header.header{
        border: 1px solid black;
        width: 100%;
        position: sticky;
        top: 0;
        height: var(--header-height);
        background-color: lightgray;
      }
      header.header button.btn_hamburger{
        display: none;
      }
      /* ==================== aside 區域 ==================== */
      aside.aside{
/*         border: 1px solid blue; */
        position: fixed;
        top: var(--header-height)+100px; 
        left: 0;
        height: calc(100% - var(--header-height));
        width: var(--aside-width);
        background-color: #efefef;
        overflow-y: auto;
        padding: 20px 0;
        transition: all 1s;
      }
      aside.aside button.btn_hamburger{
        display: none;
      }
      @media screen and (max-width: 767px){
        aside.aside{
          top: 0;
          height: 100%;
          transform: translateX(-100%);
        }
        aside.aside.-on{
          transform: translateX(0%);
        }
        header.header button.btn_hamburger, aside.aside button.btn_hamburger{
          display: inline-block;
        }
      }

      aside.aside > nav.nav > ul.nav_list{
        margin: 0;
        padding: 0;
        list-style: none;
      }
      aside.aside > nav.nav > ul.nav_list > li > a{
        display: inline-block;
/*         border: 1px solid lightblue; */
        width: 100%;
        padding: 3px 10px;
      }

      /* ==================== main 區域 ==================== */
      main.main{
/*         border: 1px solid red; */
        margin-left: var(--aside-width);
        width: calc(100% - var(--aside-width));
        padding: 20px;
        background-color: white;
        min-height: calc(100vh - var(--header-height));
        transition: all 1s;
        margin-top: 80px;
      }
      @media screen and (max-width: 767px){
        main.main{
          width: 100%;
          margin-left: 0;
        }
      }
      main.main ul.item_list{
        margin: 0;
        padding: 0;
        list-style:none;
        display: flex;
        flex-wrap: wrap;
      }
      main.main ul.item_list > li{
        width: calc((100% - 60px) / 4);
        margin-bottom:20px;
        margin-right: 20px;
      }
      @media screen and (max-width: 767px){
        main.main ul.item_list > li{
          width: calc((100% - 20px) / 2);
        }
      }
      main.main ul.item_list > li:nth-child(4n){
        margin-right: 0;
      }
      @media screen and (max-width: 767px){
        main.main ul.item_list > li:nth-child(2n){
          margin-right: 0;
        }
      }
      main.main ul.item_list > li > a{
        display: inline-block;
/*         border: 1px solid red;  */
        text-decoration: none;
        width: 100%;
      }
      main.main ul.item_list > li > a div.img_block{
        border: 1px solid #e1e1e1;
        font-size: 0;
        height: 200px;
        display: flex;
      }
      main.main ul.item_list > li > a span.item_text{
/*         border: 1px solid blue;  */
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        display: block;
        width: 100%;
      }
      main.main ul.item_list > li > a span.item_price{
/*         border: 1px solid blue;  */
        display: block;
        width: 100%;
      }
      
      #nav{
			background-color: lightgrey;
			z-index: 9999;
			padding: 0px;
			height: 40px;
			width:100%;
			
			
		}
				body{
			margin: 0;
		}
		
		*{
        box-sizing: border-box;
   		}
		
		.header{
/* 			position: fixed; */
			margin-top: 0px;
			background-color: rgb(239,239,239);
			z-index:995;
			width:100%;		
/*  			margin-top: 19px;	  */
/* 			border:1px solid black; */

		}
		
		a{
			margin: 0px;
		}
		
		.brand-text{
			margin: auto 0px;
			display: inline-block; 
			font-size: 30px; 
			font-family: sans-serif;
			color: rgb(187,122,68);
		}
		
		#logo{
			max-height: 60px;
			margin: auto 20px;
		}
		
    </style>
  </head>
  <body>
<%--   <jsp:include page="/frontend/EZ_nav.jsp"/> --%>

<div class="navbar navbar-expand-lg navbar-dark" id="nav">
		<div class="container" style= "margin-left: 790px;">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03"
				aria-controls="navbarTogglerDemo03" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
				<ul class="navbar-nav ms-auto me-sm-2 mt-2 mt-lg-0">
					<li class="nav-item active me-3"><a class="nav-link text-dark" href="<%= request.getContextPath()%>/frontend/EZ_home.jsp">首頁
					</a></li>
					<li class="nav-item me-3"><a class="nav-link text-dark" href="<%=request.getContextPath()%>/frontend/ren_listing/listingView.jsp">租賃服務</a>
					</li>
					<li class="nav-item me-3"><a class="nav-link text-dark" href="<%= request.getContextPath()%>/frontend/sec_items/secItemsViewPage.jsp">二手家電</a>
					</li>
					<li class="nav-item me-3"><a class="nav-link text-dark" href="<%= request.getContextPath()%>/frontend/ser_ad/serAdViewPage.jsp">居家服務</a>
					</li>
					
					<% 
					String memUsername = (String) session.getAttribute("memUsername");
						
						if (memUsername!=null){%>
							<li class="nav-item dropdown"><a class="nav-link text-dark" href="<%= request.getContextPath()%>"
								id="navbarDropdown" role="button" data-bs-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> 
								<img class="rounded-circle u-box-shadow-sm me-2 text-dark" width="25"
									height="25" src=" https://dummyimage.com/100/007bff/efefef"
									alt="Htmlstream"> ${memUsername} <i class="fa fa-angle-down   "></i></a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="<%= request.getContextPath()%>/frontend/member/memberCenter/buyerMemberCenter.jsp">會員中心</a> 
									<a class="dropdown-item" href="<%= request.getContextPath()%>/frontend/member/memberCenter/sellerMemberCenter.jsp">賣家中心</a> 
									<a class="dropdown-item" href="<%=request.getContextPath()%>/frontend/chat/index.jsp">聊聊</a>
									<a class="dropdown-item" href="<%=request.getContextPath()%>/frontend/sec_items/shoppingCart.jsp">購物車</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="<%=request.getContextPath()%>/member/MemberServlet.do?action=logout">登出</a>
								</div>
							</li>
						<%} else {%>
							<li class="nav-item me-3"><a class="nav-link text-dark" href="<%= request.getContextPath()%>/frontend/member/login.jsp">登入</a></li>
						<% }%>
				</ul>

			</div>
		</div>
	</div>
<%--     <jsp:include page="/frontend/EZ_LoginHeader.jsp" /> --%>
    
    <div class="header">
		<div class="header">
			<div class="col-2 pl-md-0 text-left" style="display: inline-block; width:100px">
				<a href="<%=request.getContextPath()%>/frontend/EZ_home.jsp"> 
				<img src="<%=request.getContextPath()%>/images/cmn/index/EASYSPACE.png" alt="image" id="logo">
				</a>
			</div>
			<div class="brand-text">| EASY SPACE</div>
		</div>
	</div>
    
    <aside class="probootstrap-aside js-probootstrap-aside aside">
      <a href="#" class="probootstrap-close-menu js-probootstrap-close-menu d-md-none"><span class="oi oi-arrow-left"></span> Close</a>
      <div class="probootstrap-site-logo probootstrap-animate" data-animate-effect="fadeInLeft">
        
        <a href="<%=request.getContextPath() %>/frontend/sec_items/secItemsViewPage.jsp" class="mb-2 d-block probootstrap-logo">居家服務</a>
       
      </div>
      <div class="probootstrap-overflow">
<!--         <nav class="probootstrap-nav"> -->
          <ul>
          	 <c:forEach var="serClaVO" items="${serClaList}">
				<li>
					<form method="get" action="<%=request.getContextPath() %>/ser_ad/getAdBySerClaID.do">
						<button type="submit" id="Cla${serClaVO.serClaID}">${serClaVO.serClaName}</button>
							<input type="hidden" name="serClaID" value="${serClaVO.serClaID}">
					</form>
					</li>
			</c:forEach>
	        
          </ul>
<!--         </nav> -->
<!--         <footer class="probootstrap-aside-footer probootstrap-animate" data-animate-effect="fadeInLeft"> -->
<!--           <p>&copy; 2022 <a href="#">EASY SPACE</a>. <br> All Rights Reserved.</p> -->
<!--         </footer> -->
      </div>
      <div class="probootstrap-bar">
        <a href="#" class="probootstrap-toggle js-probootstrap-toggle" style="margin-left:20px;"><span class="oi oi-menu"></span></a>
        <div class="probootstrap-main-site-logo"></div>
      </div>
    </aside>


   <main class="main">

		<c:forEach var="serAdVO" items="${serAdVO}">
			<c:if test="${serAdVO.adStatus==1}">
			<div class="container">
				<div class="card d-flex row flex-row p-4" style="min-width: 800px;">
					<div class="company-img col-3">
						
						<img class="img img-fluid"
							<c:forEach var="serVdrVO" items="${serVdrList}">
							 <c:if test="${serAdVO.adVdrID==serVdrVO.vdrID}">
							 src="<%=request.getContextPath()%>/ser_vdr/DBGifReader4.do?vdr_id=${serVdrVO.vdrID}"
                    		</c:if>
						</c:forEach >
							
							alt="company-logo">
					</div>
					<div class="right-side col-9 d-flex flex-column">
						<div
							class="upper p-2 mb-5 d-flex flex-row justify-content-between">
							<div class="company-info fs-5">
								<h2 class="text-nowrap">
									<c:forEach var="serVdrVO" items="${serVdrList}">
							 			<c:if test="${serAdVO.adVdrID==serVdrVO.vdrID}">
	                   						 ${serVdrVO.vdrName}
                    					</c:if>
									</c:forEach >
								</h2>
								<!-- ${companies[0].companyName} -->
								<div>
									<span class="me-1"><strong>5.0</strong></span> <i
										class="bi bi-star-fill" style="color: Gold;"></i> <i
										class="bi bi-star-fill" style="color: Gold;"></i> <i
										class="bi bi-star-fill" style="color: Gold;"></i> <i
										class="bi bi-star-fill" style="color: Gold;"></i> <i
										class="bi bi-star-fill" style="color: Gold;"></i> <i
										class="bi bi-star-fill" style="color: Gold;"></i> <span
										class="ms-1">(27)</span>
								</div>
								<div>
									<i class="bi bi-trophy">服務地區:${serAdVO.adDist}</i> 
								</div>
								<div>
									<i>
									<c:forEach var="serVdrVO" items="${serVdrList}">
							 			<c:if test="${serAdVO.adVdrID==serVdrVO.vdrID}">
	                   						 聯絡電話:${serVdrVO.vdrTel}
                    					</c:if>
									</c:forEach >
									</i><br>
									<i class="bi bi-check-circle-fill" style="color: DodgerBlue;">
									<c:forEach var="serVdrVO" items="${serVdrList}">
							 			<c:if test="${serAdVO.adVdrID==serVdrVO.vdrID}">
	                   						 服務時間:${serVdrVO.vdrOpen}
                    					</c:if>
									</c:forEach >
									</i>
								</div>
								<span class="badge rounded-pill bg-info">活躍專家</span>
							</div>
							<div class="contact fs-5 text-end">
								<div>
									<i class="bi bi-chat bg-light"></i>
								</div>
								<p class="text-nowrap">
									
								
								</p>
							</div>
						</div>
						<div
							class="bottom p-2 d-flex flex-row align-items-end justify-content-between">
							<div class="p-2 w-70 company-profile d-inline-block" style="max-width: 580px;">
								<p>
								<c:forEach var="serVdrVO" items="${serVdrList}">
							 			<c:if test="${serAdVO.adVdrID==serVdrVO.vdrID}">
	                   						 廠商簡介:${serVdrVO.vdrIntro}
                    					</c:if>
									</c:forEach >
<%-- 									${serAdVO.adTxt} --%>
								</p>
								
							</div>
<!-- 							<button type="button" class="btn btn-outline-success text-nowrap">投遞需求單</button> -->
							<a href="<%=request.getContextPath()%>/frontend/ser_quo/addSerQuo.jsp?quoVdrID=${serAdVO.adVdrID}" class="btn btn-outline-success text-nowrap">投遞需求單</a>
						</div>

					</div>
				</div>
			</div>
				</c:if>
			</c:forEach>
		












      <div class="container-fluid d-md-none">
        <div class="row">
          <div class="col-md-12">
            <p>&copy; 2022 <a href="#">EASY SPACE</a> <br> All Rights Reserved. Designed by CFA104G5</p>
          </div>
        </div>
      </div>

    </main>

    

    <script src="<%=request.getContextPath() %>/js/jquery-3.2.1.slim.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery.waypoints.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/imagesloaded.pkgd.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/imagesloaded.pkgd.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/main.js"></script>

	
	<script>
      $(function(){

        $("button.btn_hamburger").on("click", function(){
          $("aside.aside").toggleClass("-on");
        });
		
        console.log(location.href.indexOf('serAdViewPage2.jsp'));
        if(location.href.indexOf('serAdViewPage2.jsp') > -1) {
        	$("#Cla1").trigger('click');
        }
      });
</script>
    
  </body>
</html>