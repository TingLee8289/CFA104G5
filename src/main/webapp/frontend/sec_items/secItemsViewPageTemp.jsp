<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.sec_items.model.*"%>
<%@ page import="ezs.sec_pics.model.*"%>
<%@ page import="ezs.sec_category.model.*"%>

<%
	Integer shCateID = Integer.valueOf(request.getParameter("shCateID"));
	SecPicsService secPicsSvc = new SecPicsService();
	List<SecPicsVO> secPicslist = secPicsSvc.getByShCateID(shCateID);
	pageContext.setAttribute("secPicslist", secPicslist);
	
	SecCategoryService secCategorySvc = new SecCategoryService();
	List<SecCategoryVO> secCategorylist = secCategorySvc.getAll();
	pageContext.setAttribute("secCategorylist", secCategorylist);
	
	
	SecItemsService secItemsSvc = new SecItemsService();
	List<SecItemsVO> secItemslist = secItemsSvc.getByCategory2(shCateID);
	pageContext.setAttribute("secItemslist", secItemslist);

%>

<!DOCTYPE html>
<html>
  <head>
    <title>EASY SPACE</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Free HTML5 Website Template by ProBootstrap.com" />
    <meta name="keywords" content="free bootstrap 4, free bootstrap 4 template, free website templates, free html5, free template, free website template, html5, css3, mobile first, responsive" />
    <meta name="author" content="ProBootstrap.com" />
    
<!--  版面css import 開始-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/icomoon.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/animate.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/viewPage.css">
<!--  版面css import 結束-->
<!--  版面css 開始-->    
<style>
      *{
        box-sizing: border-box;
      }
      :root{
        --header-height: 100px;
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
<!--  版面css 結束-->   
<!--     sweetAlert -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
<!--     sweetAlert -->

  </head>
  <body>
  	<jsp:include page="/frontend/EZ_nav.jsp"/>
    <jsp:include page="/frontend/EZ_LoginHeader.jsp" />
    <aside class="probootstrap-aside js-probootstrap-aside aside">
      <a href="#" class="probootstrap-close-menu js-probootstrap-close-menu d-md-none"><span class="oi oi-arrow-left"></span> Close</a>
      <div class="probootstrap-site-logo probootstrap-animate" data-animate-effect="fadeInLeft">
        
        <a href="<%=request.getContextPath() %>/frontend/sec_items/secItemsViewPage.jsp" class="mb-2 d-block probootstrap-logo">二手家電</a>
<!--         <p class="mb-0">這是說明文字這是說明文字這是說明文字這是說明文字 </p> -->
      </div>
      <div class="probootstrap-overflow">
        <nav class="probootstrap-nav">
          <ul>
            <li class="probootstrap-animate active" data-animate-effect="fadeInLeft"><a href="<%=request.getContextPath() %>/frontend/sec_items/secItemsViewPage.jsp">瀏覽全部商品</a></li>
            <c:forEach var="secCategoryVO" items="${secCategorylist}">
	         	 <li class="probootstrap-animate" data-animate-effect="fadeInLeft">
						<form>
	         	 			<a style="text-decoration:none;" href="<%=request.getContextPath() %>/frontend/sec_items/secItemsViewPageTemp.jsp?shCateID=${secCategoryVO.shCateID}">${secCategoryVO.shCateName}
	         	 			</a>
	         	 		</form>

	         	 </li>  
	        </c:forEach>
	        
          </ul>
        </nav>
      </div>
    </aside>

<!-- 	側邊欄 結束-------------------------------------------------------- -->
<!-- 	main 開始-------------------------------------------------------- -->
      <div class="probootstrap-bar">
        <a href="#" class="probootstrap-toggle js-probootstrap-toggle" style="margin-left:20px;"><span class="oi oi-menu"></span></a>
        <div class="probootstrap-main-site-logo"></div>
      </div>
    <main role="main" class="main">
		<ul class="item_list" id="item_list">
			<c:forEach var="secPicsVO" items="${secPicslist}">
				<li style="list-style: none;">
					<a href="<%=request.getContextPath()%>/sec_items/GetSecItemsServlet.do?shID=${secPicsVO.shID}&action=getOneItem_For_Display">
						<div class="img_block">
							<img style="margin: 0px auto;"
								src="<%= request.getContextPath()%>/sec_pics/SecPicsReader.do?sh_id=${secPicsVO.shID}">
						</div> <c:forEach var="secItemsVO" items="${secItemslist}">
							<c:if test="${secItemsVO.shID==secPicsVO.shID}">
								<span class="item_text">${secItemsVO.shName}</span>
								<span class="item_price">$${secItemsVO.shPrice}</span>
							</c:if>
						</c:forEach>
					</a> 
					<c:forEach var="secItemsVO" items="${secItemslist}">
						<c:if test="${secItemsVO.shID==secPicsVO.shID}">
							<form method="post" action="<%=request.getContextPath()%>/sec_items/ShoppingServlet.do">
								<input type="submit" value="加入購物車" class="btn btn-outline-success text-nowrap" id="btn1">
								<input type="hidden" name="shID" value="${secItemsVO.shID}">
								<input type="hidden" name="shName" value="${secItemsVO.shName}">
								<input type="hidden" name="shPrice" value="${secItemsVO.shPrice}">
								<input type="hidden" name="shQTY" value="1">
								<input type="hidden" name="action" value="ADD">
							</form>
						</c:if>
					</c:forEach>
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

<!-- 	main 結束-------------------------------------------------------- -->

 <!--     jQuery&AJAX -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!--     jQuery&AJAX -->   

    <script src="<%=request.getContextPath() %>/js/jquery-3.2.1.slim.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/popper.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery.waypoints.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/imagesloaded.pkgd.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/imagesloaded.pkgd.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/main.js"></script>



<script>
		$('#Cate1').click(function() {
			$.ajax({
				type: "get",
				url: "<%= request.getContextPath()%>/frontend/sec_items/secItemsViewPageAJAX.jsp",
				data: {"shCateID": 1},
				success: function(data){
					showItems(data);
				}
			});
		});
		$('#Cate2').click(function() {
			$.ajax({
				type: "get",
				url: "<%= request.getContextPath()%>/frontend/sec_items/secItemsViewPageAJAX.jsp",
				data: {"shCateID": 2},
				success: function(data){
					showItems(data);
				}
			});
		});
		$('#Cate3').click(function() {
			$.ajax({
				type: "get",
				url: "<%= request.getContextPath()%>/frontend/sec_items/secItemsViewPageAJAX.jsp",
				data: {"shCateID": 3},
				success: function(data){
					showItems(data);
				}
			});
		});
		$('#Cate4').click(function() {
			$.ajax({
				type: "get",
				url: "<%= request.getContextPath()%>/frontend/sec_items/secItemsViewPageAJAX.jsp",
				data: {"shCateID": 4},
				success: function(data){
					showItems(data);
				}
			});
		});
		$('#Cate5').click(function() {
			$.ajax({
				type: "get",
				url: "<%= request.getContextPath()%>/frontend/sec_items/secItemsViewPageAJAX.jsp",
				data: {"shCateID": 5},
				success: function(data){
					showItems(data);
				}
			});
		});
		function showItems(data){
// 				console.log(data)
			$("#item_list").html("");
			$("#item_list").html(data);
		}
</script>
  <script src="js/jquery-3.2.1.slim.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/imagesloaded.pkgd.min.js"></script>
  <script src="js/main.js"></script>
    
    
    
  </body>
</html>