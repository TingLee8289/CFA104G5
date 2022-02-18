<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
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
    <meta charset="utf-8">
    <title>EASY SPACE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
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
        border: 1px solid blue;
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
        border: 1px solid lightblue;
        width: 100%;
        padding: 3px 10px;
      }

      /* ==================== main 區域 ==================== */
      main.main{
        border: 1px solid red;
        margin-left: var(--aside-width);
        width: calc(100% - var(--aside-width));
        padding: 20px;
        background-color: hsl(34, 100%, 84%);
        min-height: calc(100vh - var(--header-height));
        transition: all 1s;
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
        border: 1px solid red;
        text-decoration: none;
        width: 100%;
      }
      main.main ul.item_list > li > a div.img_block{
        border: 1px solid blue;
        font-size: 0;
        height: 200px;
      }
      main.main ul.item_list > li > a span.item_text{
        border: 1px solid blue;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        display: block;
        width: 100%;
      }
    </style>
</head>
<body>
<!-- 	header 開始------------------------------------------------------ -->
    <header class="header">
      <button type="button" class="btn_hamburger">按鈕</button>這是 header
    </header>
<!-- 	header 結束------------------------------------------------------ -->
<!-- 	側邊欄 開始-------------------------------------------------------- -->
    <aside class="aside">
      <nav class="nav">
        <button type="button" class="btn_hamburger">按鈕</button>
        <ul class="nav_list">
	        <c:forEach var="serClaVO" items="${serClaList}">
	         	 <li>
	         	 	<form method="get" action="<%=request.getContextPath() %>/frontend/sec_items/secItemsViewPageAJAX.jsp">
		         	 	<button type="button" id="Cla${serClaVO.serClaID}">${serClaVO.serClaName}</button>
		         	 	<input type="hidden" name="serClaID" value="${serClaVO.serClaID}">
	         	 	</form>
	         	 </li>  
	        </c:forEach>
        </ul>
      </nav>
    </aside>
<!-- 	側邊欄 結束-------------------------------------------------------- -->
<!-- 	main 開始-------------------------------------------------------- -->

    <main class="main">
		
			<c:forEach var="serAdVO" items="${serAdList}">
				<div style="width: 500px; border:solid 1px red">
				<div >
				<img src="<%=request.getContextPath()%>/ser_ad/DBGifReader4.do?ad_vdr_id=${serAdVO.adVdrID}&ad_ser_cla_id=${serAdVO.adSerClaID}">
				</div>
					
				<div>
				</div>
					
					
							
								
								
								<span class="item_text" style="">${serVdrVO.vdrName}</span>
								<span class="item_price">${serVdrVO.vdrTel}</span>
								<span class="item_price">${serVdrVO.vdrCounty}</span>
								<span class="item_price">${serVdrVO.vdrDist}</span>
								<span class="item_price">${serVdrVO.vdrAddr}</span>
								<span class="item_price">${serVdrVO.vdrOpen}</span>
								<div class="item_price" style="width:100px">${serVdrVO.vdrIntro}</div>
								<span class="item_price">${serVdrVO.vdrOpen}</span>
							
						
					
					<c:forEach var="secVO" items="${serAdList}">
						<c:if test="${secItemsVO.shID==secPicsVO.shID}">
							<a class="btn btn-buy"
								href="<%=request.getContextPath()%>/sec_items/ShoppingServlet.do?shID=${secItemsVO.shID}&shName=${secItemsVO.shName}&shPrice=${secItemsVO.shPrice}&shQTY=1&action=ADD">加入購物車</a>
						</c:if>
					</c:forEach>
			</div>
			</c:forEach>
		
		
		
		
		
		

			
	
	</main>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
      $(function(){

        $("button.btn_hamburger").on("click", function(){
          $("aside.aside").toggleClass("-on");
        });

      });
</script>
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
			
		//		console.log(data)
			$("#item_list").html("");
			$("#item_list").html(data);
		}


	

	
// 	$.ajax({
// 	    // 進行要求的網址(URL)
<%-- 	    url: '<%= request.getContextPath()%>/sec_items/GetSecItemsServlet.do', --%>
// 	    // 要送出的資料 (會被自動轉成查詢字串)
// 	    data: {
// 	        shCateID: 
// 	    },
// 	    // 要使用的要求method(方法)，POST 或 GET
// 	    type: 'GET',
// 	    // 資料的類型
// 	    dataType : 'json',
// 	})
// 	  // 要求成功時要執行的程式碼
// 	  // 回應會被傳遞到回調函式的參數
// 	  .done(function( json ) {
// 	     $( '<h1>' ).text( json.title ).appendTo( 'body' );
// 	     $( '<div class=\'content\'>').html( json.html ).appendTo( 'body' );
// 	  })
// 	  // 要求失敗時要執行的程式碼
// 	  // 狀態碼會被傳遞到回調函式的參數
// 	  .fail(function( xhr, status, errorThrown ) {
// 	    console.log( '出現錯誤，無法完成!' )
// 	    console.log( 'Error: ' + errorThrown )
// 	    console.log( 'Status: ' + status )
// 	    console.dir( xhr )
// 	  })
// 	  // 不論成功或失敗都會執行的回調函式
// 	  .always(function( xhr, status ) {
// 	    console.log( '要求已完成!' )
// 	  })
</script>



<!-- 	main 結束-------------------------------------------------------- -->
</body>
</html>