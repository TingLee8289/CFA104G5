<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.sec_items.model.*"%>
<%@ page import="ezs.sec_pics.model.*"%>
<%@ page import="ezs.sec_category.model.*"%>

<%
SecPicsService secPicsSvc = new SecPicsService();
List<SecPicsVO> secPicslist = secPicsSvc.getEachFirst();
pageContext.setAttribute("secPicslist", secPicslist);

SecCategoryService secCategorySvc = new SecCategoryService();
List<SecCategoryVO> secCategorylist = secCategorySvc.getAll();
pageContext.setAttribute("secCategorylist", secCategorylist);

SecItemsService secItemsSvc = new SecItemsService();
List<SecItemsVO> secItemslist = secItemsSvc.getAll();
pageContext.setAttribute("secItemslist", secItemslist);

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

      /* ==================== header �ϰ� ==================== */
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
      /* ==================== aside �ϰ� ==================== */
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

      /* ==================== main �ϰ� ==================== */
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
<!-- 	header �}�l------------------------------------------------------ -->
    <header class="header">
      <button type="button" class="btn_hamburger">���s</button>�o�O header
    </header>
<!-- 	header ����------------------------------------------------------ -->
<!-- 	������ �}�l-------------------------------------------------------- -->
    <aside class="aside">
      <nav class="nav">
        <button type="button" class="btn_hamburger">���s</button>
        <ul class="nav_list">
	        <c:forEach var="secCategoryVO" items="${secCategorylist}">
	         	 <li>
	         	 	<form method="get" action="<%=request.getContextPath() %>/frontend/sec_items/secItemsViewPageAJAX.jsp">
		         	 	<input type="submit" value="${secCategoryVO.shCateName}">
		         	 	<input type="hidden" name="shCateID" value="${secCategoryVO.shCateID}">
	         	 	</form>
	         	 </li>  
	        </c:forEach>
        </ul>
      </nav>
      <select id="test"></select>
    </aside>
<!-- 	������ ����-------------------------------------------------------- -->
<!-- 	main �}�l-------------------------------------------------------- -->

    <main class="main">
		<ul class="item_list" id="item_list">

			<c:forEach var="secPicsVO" items="${secPicslist}">
				<li>
					<a href="<%=request.getContextPath()%>/sec_items/GetSecItemsServlet.do?shID=${secPicsVO.shID}&action=getOne_For_Display">
						<div class="img_block">
							<img
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
							<a class="btn btn-buy"
								href="<%=request.getContextPath()%>/sec_items/ShoppingServlet.do?shID=${secItemsVO.shID}&shName=${secItemsVO.shName}&shPrice=${secItemsVO.shPrice}&shQTY=1&action=ADD">�[�J�ʪ���</a>
						</c:if>
					</c:forEach>
				</li>
			</c:forEach>

		</ul>
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
	$.ajax({
		url: "<%=request.getContextPath()%>/frontend/sec_items/secItemsViewPageAJAX.jsp",
		type: "GET",
		success: function(data) {
			showNames(data);
		}
	});
	
	function showNames(data){
		var names = data.split(",");
		$("#test").html("");
		for (i in names){
			var opt = $("<option>").val(names[i]).text(names[i]);
			$("#test").append(opt);
		}
	}
	
	const select = document.getElementById("test");
	console.log(select);

	
// 	$.ajax({
// 	    // �i��n�D�����}(URL)
<%-- 	    url: '<%= request.getContextPath()%>/sec_items/GetSecItemsServlet.do', --%>
// 	    // �n�e�X����� (�|�Q�۰��ন�d�ߦr��)
// 	    data: {
// 	        shCateID: 
// 	    },
// 	    // �n�ϥΪ��n�Dmethod(��k)�APOST �� GET
// 	    type: 'GET',
// 	    // ��ƪ�����
// 	    dataType : 'json',
// 	})
// 	  // �n�D���\�ɭn���檺�{���X
// 	  // �^���|�Q�ǻ���^�ը禡���Ѽ�
// 	  .done(function( json ) {
// 	     $( '<h1>' ).text( json.title ).appendTo( 'body' );
// 	     $( '<div class=\'content\'>').html( json.html ).appendTo( 'body' );
// 	  })
// 	  // �n�D���Ѯɭn���檺�{���X
// 	  // ���A�X�|�Q�ǻ���^�ը禡���Ѽ�
// 	  .fail(function( xhr, status, errorThrown ) {
// 	    console.log( '�X�{���~�A�L�k����!' )
// 	    console.log( 'Error: ' + errorThrown )
// 	    console.log( 'Status: ' + status )
// 	    console.dir( xhr )
// 	  })
// 	  // ���צ��\�Υ��ѳ��|���檺�^�ը禡
// 	  .always(function( xhr, status ) {
// 	    console.log( '�n�D�w����!' )
// 	  })
</script>



<!-- 	main ����-------------------------------------------------------- -->
</body>
</html>