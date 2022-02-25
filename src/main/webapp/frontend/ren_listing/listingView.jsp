<%@page import="ezs.ren_roomtype.model.RenRoomtypeVO"%>
<%@page import="ezs.ren_roomtype.model.RenRoomtypeService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ren_listing.model.*"%>
<%@ page import="ezs.ren_roomtype.model.*"%>
<%@ page import="ezs.ren_location.model.*"%>
<%@ page import="ezs.ren_listing_pic.model.*"%>
<%@ page import="ezs.ren_location.model.RenLocationVO"%>
<%@ page import="ezs.ren_location.model.RenLocationService"%>


<%
	RenListingService renListingSvc = new RenListingService();
	List<RenListingVO> renListinglist = renListingSvc.getAll();
	pageContext.setAttribute("renListinglist",renListinglist);
	
	RenListingPicService renListingPicSvc = new RenListingPicService();
	List<RenListingPicVO> renListingPiclist = renListingPicSvc.getEachListingFirstPic();
	pageContext.setAttribute("renListingPiclist", renListingPiclist);

%>

<jsp:useBean id="renRoomtypeSvc" scope="page" class="ezs.ren_roomtype.model.RenRoomtypeService" />
<jsp:useBean id="renLocationSvc" scope="page" class="ezs.ren_location.model.RenLocationService" />
<jsp:useBean id="renLandlordSvc" scope="page" class="ezs.ren_landlord.model.RenLandlordService" />
<jsp:useBean id="memberSvc" scope="page" class="ezs.member.model.MemberService" />

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
        margin-top: 1
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
    </style>
  </head>
<body>
<%--   	<jsp:include page="/frontend/EZ_nav.jsp"/> --%>
    <jsp:include page="/frontend/EZ_LoginHeader.jsp" />
    <aside class="probootstrap-aside js-probootstrap-aside aside">
      <a href="#" class="probootstrap-close-menu js-probootstrap-close-menu d-md-none"><span class="oi oi-arrow-left"></span> Close</a>
      <div class="probootstrap-site-logo probootstrap-animate" data-animate-effect="fadeInLeft">
        
        <a href="<%=request.getContextPath() %>/frontend/ren_listing/listingView.jsp" class="mb-2 d-block probootstrap-logo">找租屋</a>
<!--         <p class="mb-0">這是說明文字這是說明文字這是說明文字這是說明文字 </p> -->
      </div>
      <div class="probootstrap-overflow">
        <nav class="probootstrap-nav">
          <ul>
            <li class="probootstrap-animate active" data-animate-effect="fadeInLeft"><a href="<%=request.getContextPath() %>/frontend/ren_listing/listingView.jsp">瀏覽租屋案件</a></li>
            <li>
      <FORM METHOD="post" ACTION="GetOneRenListingServlet.do">
      	<b>輸入房源ID:</b>
      	<input type="text" name="lisID">
      	<input type="hidden" name="action" value="getOne_For_Display_A">
        <input type="submit" name="送出">
        <%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red"></font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>      
      </FORM>
     </li>
     
     
	    <li>
     	<FORM METHOD="post" ACTION="RenLocationServlet.do">     	
     	  <b>選擇區域:</b>
     	  <select size="1" name="lisAreaID">
     		<c:forEach var="renLocationVO" items="${renLocationSvc.all}">
     		  <option value="${renLocationVO.locID}"${(renListingVO.lisAreaID == renLocationVO.locID)? 'selected':'' } >${renLocationVO.locCity}${renLocationVO.locDist}
     		</c:forEach>
     	  </select>
     	  <input type="hidden" name="action" value="listLocations_BylisAreaID">
     	  <input type="submit" value="送出">
     	  <%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red"></font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
       </FORM>
	</li>
	
          </ul>
        </nav>
      </div>
    </aside>


      <div class="probootstrap-bar">
        <a href="#" class="probootstrap-toggle js-probootstrap-toggle" style="margin-left:20px;"><span class="oi oi-menu"></span></a>
        <div class="probootstrap-main-site-logo"></div>
      </div>
    <main class="main">
		<ul class="item_list" id="item_list">

			<c:forEach var="renListingVO" items="${renListinglist}">
				<li style="list-style: none;">
					<a href="<%=request.getContextPath()%>/frontend/ren_listing/GetOneRenListingServlet.do?lisID=${renListingVO.lisID}&action=getOne_For_Display_A">
						<div class="img_block">
							<img src="<%=request.getContextPath()%>/ren_listing/RenListing_pic_ReaderServlet.do?LIS_ID=${renListingVO.lisID}" width = 200px>
						</div> 
								<span class="item_text">房源編號:${renListingVO.lisID}</span>
								<span class="item_text">${renListingVO.lisTitle}</span>
								<span class="item_text"><c:forEach var="renRoomtypeVO" items="${renRoomtypeSvc.all}">
                    										<c:if test="${renListingVO.lisRtID==renRoomtypeVO.rtID}">
	                    												${renRoomtypeVO.rtType}
                    										</c:if>
                										</c:forEach>
                				</span>
                				<span class="item_text"><c:forEach var="renLocationVO" items="${renLocationSvc.all}">
                    											<c:if test="${renListingVO.lisAreaID==renLocationVO.locID}">
	                    												${renLocationVO.locCity}${renLocationVO.locDist}
                    											</c:if>
                										</c:forEach>
                				</span>
								<span class="item_text">地址:${renListingVO.lisAddress}</span>
								<span class="item_text">坪數:${renListingVO.lisSqft}</span>
								<span class="item_text">樓層:${renListingVO.lisFlr}</span>
								<span class="item_text">${renListingVO.lisRmNo}房</span>
								<span class="item_text">${renListingVO.lisCmnArea}廳</span>
								<span class="item_text">${renListingVO.lisBrNo}衛</span>
								<span class="item_price">租金${renListingVO.lisRent}</span>
							
					</a> 
					
				</li>
			</c:forEach>

		</ul>
		
		
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

</body>
</html>