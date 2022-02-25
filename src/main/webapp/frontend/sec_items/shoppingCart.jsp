<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.* , ezs.sec_items.model.* , java.math.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EASY SPACE</title>
    <link rel="icon" href="images/logo.ico" type="image/x-icon"/>    <!--     幫網頁標題欄title加上logo(icon)圖示 -->
    <style>
       @import url(https://fonts.googleapis.com/css?family=Droid+Serif:400,400italic|Montserrat:400,700);
        html, body, div, span, applet, object, iframe,
        h1, h2, h3, h4, h5, h6, p, blockquote, pre,
        a, abbr, acronym, address, big, cite, code,
        del, dfn, em, img, ins, kbd, q, s, samp,
        small, strike, strong, sub, sup, tt, var,
        b, u, i, center,
        dl, dt, dd, ol, ul, li,
        fieldset, form, label, legend,
        table, caption, tbody, tfoot, thead, tr, th, td,
        article, aside, canvas, details, embed,
        figure, figcaption, footer, header, hgroup,
        menu, nav, output, ruby, section, summary,
        time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            font: inherit;
            font-size: 100%;
            vertical-align: baseline;
        }
        
        *{
        	box-sizing: border-box;
      	}

        html {
            line-height: 1;
        }

        ol, ul {
            list-style: none;
        }

        table {
        border-collapse: collapse;
        border-spacing: 0;
        }

        caption, th, td {
        text-align: left;
        font-weight: normal;
        vertical-align: middle;
        }

        q, blockquote {
        quotes: none;
        }
        q:before, q:after, blockquote:before, blockquote:after {
        content: "";
        content: none;
        }

        a img {
        border: none;
        }

        article, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section, summary {
        display: block;
        }

        * {
        box-sizing: border-box;
        }

        body {
        color: #333;
        -webkit-font-smoothing: antialiased;
        font-family: "Droid Serif", serif;
        }

        img {
        max-width: 100%;
        }

        .cf:before, .cf:after {
        content: " ";
        display: table;
        }

        .cf:after {
        clear: both;
        }

        .cf {
        *zoom: 1;
        }

        .wrap {
        width: 75%;
        max-width: 960px;
        margin: 0 auto;
        padding: 5% 0;
        margin-bottom: 5em;
        }

        .projTitle {
        font-family: "Montserrat", sans-serif;
        font-weight: bold;
        text-align: center;
        font-size: 2em;
        padding: 1em 0;
        border-bottom: 1px solid #dadada;
        letter-spacing: 3px;
        text-transform: uppercase;
        }
        .projTitle span {
        font-family: "Droid Serif", serif;
        font-weight: normal;
        font-style: italic;
        text-transform: lowercase;
        color: #777;
        }

        .heading {
        padding: 1em 0;
        border-bottom: 1px solid #D0D0D0;
        }
        .heading h1 {
        font-family: "Droid Serif", serif;
        font-size: 2em;
        float: left;
        }
        .heading a.continue:link, .heading a.continue:visited {
        text-decoration: none;
        font-family: "Montserrat", sans-serif;
        letter-spacing: -.015em;
        font-size: .75em;
        padding: 1em;
        color: #fff;
        background: #82ca9c;
        font-weight: bold;
        border-radius: 50px;
        float: right;
        text-align: right;
        -webkit-transition: all 0.25s linear;
        -moz-transition: all 0.25s linear;
        -ms-transition: all 0.25s linear;
        -o-transition: all 0.25s linear;
        transition: all 0.25s linear;
        }
        .heading a.continue:after {
        content: "\276f";
        padding: .5em;
        position: relative;
        right: 0;
        -webkit-transition: all 0.15s linear;
        -moz-transition: all 0.15s linear;
        -ms-transition: all 0.15s linear;
        -o-transition: all 0.15s linear;
        transition: all 0.15s linear;
        }
        .heading a.continue:hover, .heading a.continue:focus, .heading a.continue:active {
        background: #f69679;
        }
        .heading a.continue:hover:after, .heading a.continue:focus:after, .heading a.continue:active:after {
        right: -10px;
        }

        .tableHead {
        display: table;
        width: 100%;
        font-family: "Montserrat", sans-serif;
        font-size: .75em;
        }
        .tableHead li {
        display: table-cell;
        padding: 1em 0;
        text-align: center;
        }
        .tableHead li.prodHeader {
        text-align: left;
        }

        .cart {
        padding: 1em 0;
        }
        .cart .items {
        display: block;
        width: 100%;
        vertical-align: middle;
        padding: 1.5em;
        border-bottom: 1px solid #fafafa;
        }
        .cart .items.even {
        background: #fafafa;
        }
        .cart .items .infoWrap {
        display: table;
        width: 100%;
        }
        .cart .items .cartSection {
        display: table-cell;
        vertical-align: middle;
        }
        .cart .items .cartSection .itemNumber {
        font-size: .75em;
        color: #777;
        margin-bottom: .5em;
        }
        .cart .items .cartSection h3 {
        font-size: 1em;
        font-family: "Montserrat", sans-serif;
        font-weight: bold;
        text-transform: uppercase;
        letter-spacing: .025em;
        overflow: hidden;
        }
        .cart .items .cartSection p {
        display: inline-block;
        font-size: .85em;
        color: #777777;
        font-family: "Montserrat", sans-serif;
        }
        .cart .items .cartSection p .quantity {
        font-weight: bold;
        color: #333;
        }
        .cart .items .cartSection p.stockStatus {
        color: #82CA9C;
        font-weight: bold;
        padding: .5em 0 0 1em;
        text-transform: uppercase;
        }
        .cart .items .cartSection p.stockStatus.out {
        color: #F69679;
        }
        .cart .items .cartSection .itemImg {
        width: 4em;
        float: left;
        }
        .cart .items .cartSection.qtyWrap, .cart .items .cartSection.prodTotal {
        text-align: center;
        }
        .cart .items .cartSection.qtyWrap p, .cart .items .cartSection.prodTotal p {
        font-weight: bold;
        font-size: 1.25em;
        }
        .cart .items .cartSection input.qty {
        width: 2em;
        text-align: center;
        font-size: 1em;
        padding: .25em;
        margin: 1em .5em 0 0;
        }
        .cart .items .cartSection .itemImg {
        width: 8em;
        display: inline;
        padding-right: 1em;
        }

        .special {
        display: block;
        font-family: "Montserrat", sans-serif;
        }
        .special .specialContent {
        padding: 1em 1em 0;
        display: block;
        margin-top: .5em;
        border-top: 1px solid #dadada;
        }
        .special .specialContent:before {
        content: "\21b3";
        font-size: 1.5em;
        margin-right: 1em;
        color: #6f6f6f;
        font-family: helvetica, arial, sans-serif;
        }

        .remove {
        text-decoration: none;
        font-family: "Montserrat", sans-serif;
        color: #ffffff;
        font-weight: bold;
        background: #e0e0e0;
        padding: .5em;
        font-size: .75em;
        display: inline-block;
        border-radius: 100%;
        line-height: .85;
        -webkit-transition: all 0.25s linear;
        -moz-transition: all 0.25s linear;
        -ms-transition: all 0.25s linear;
        -o-transition: all 0.25s linear;
        transition: all 0.25s linear;
        }
        .remove:hover {
        background: #f30;
        }

        .promoCode {
        border: 2px solid #efefef;
        float: left;
        width: 35%;
        padding: 2%;
        }
        .promoCode label {
        display: block;
        width: 100%;
        font-style: italic;
        font-size: 1.15em;
        margin-bottom: .5em;
        letter-spacing: -.025em;
        }
        .promoCode input {
        width: 85%;
        font-size: 1em;
        padding: .5em;
        float: left;
        border: 1px solid #dadada;
        }
        .promoCode input:active, .promoCode input:focus {
        outline: 0;
        }
        .promoCode a.btn {
        float: left;
        width: 15%;
        padding: .75em 0;
        border-radius: 0 1em 1em 0;
        text-align: center;
        border: 1px solid #82ca9c;
        }
        .promoCode a.btn:hover {
        border: 1px solid #f69679;
        background: #f69679;
        }

        .btn:link, .btn:visited {
        text-decoration: none;
        font-family: "Montserrat", sans-serif;
        letter-spacing: -.015em;
        font-size: 1em;
        padding: 1em 3em;
        color: #fff;
        background: #82ca9c;
        font-weight: bold;
        border-radius: 50px;
        float: right;
        text-align: right;
        -webkit-transition: all 0.25s linear;
        -moz-transition: all 0.25s linear;
        -ms-transition: all 0.25s linear;
        -o-transition: all 0.25s linear;
        transition: all 0.25s linear;
        }
        .btn:after {
        content: "\276f";
        padding: .5em;
        position: relative;
        right: 0;
        -webkit-transition: all 0.15s linear;
        -moz-transition: all 0.15s linear;
        -ms-transition: all 0.15s linear;
        -o-transition: all 0.15s linear;
        transition: all 0.15s linear;
        }
        .btn:hover, .btn:focus, .btn:active {
        background: #f69679;
        }
        .btn:hover:after, .btn:focus:after, .btn:active:after {
        right: -10px;
        }
        .promoCode .btn {
        font-size: .85em;
        padding: .5em 2em;
        }

        /* TOTAL AND CHECKOUT  */
        .subtotal {
        float: right;
        width: 35%;
        }
        .subtotal .totalRow {
        padding: .5em;
        text-align: right;
        }
        .subtotal .totalRow.final {
        font-size: 1.25em;
        font-weight: bold;
        }
        .subtotal .totalRow span {
        display: inline-block;
        padding: 0 0 0 1em;
        text-align: right;
        }
        .subtotal .totalRow .label {
        font-family: "Montserrat", sans-serif;
        font-size: .85em;
        text-transform: uppercase;
        color: #777;
        }
        .subtotal .totalRow .value {
        letter-spacing: -.025em;
        width: 35%;
        }

        @media only screen and (max-width: 39.375em) {
        .wrap {
            width: 98%;
            padding: 2% 0;
        }

        .projTitle {
            font-size: 1.5em;
            padding: 10% 5%;
        }

        .heading {
            padding: 1em;
            font-size: 90%;
        }

        .cart .items .cartSection {
            width: 90%;
            display: block;
            float: left;
        }
        .cart .items .cartSection.qtyWrap {
            width: 10%;
            text-align: center;
            padding: .5em 0;
            float: right;
        }
        .cart .items .cartSection.qtyWrap:before {
            content: "QTY";
            display: block;
            font-family: "Montserrat", sans-serif;
            padding: .25em;
            font-size: .75em;
        }
        .cart .items .cartSection.prodTotal, .cart .items .cartSection.removeWrap {
            display: none;
        }
        .cart .items .cartSection .itemImg {
            width: 25%;
        }

        .promoCode, .subtotal {
            width: 100%;
        }

        a.btn.continue {
            width: 100%;
            text-align: center;
        }
        }
        
        .product-name {
        	width: 400px;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
        }
        
        #checkoutbtn{
		    font-family: "Montserrat", sans-serif;
		    letter-spacing: -.015em;
		    font-size: .75em;
		    padding: 1em;
		    color: #fff;
		    background: #82ca9c;
		    font-weight: bold;
		    border-radius: 50px;
		    float: right;
		    text-align: right;
		    -webkit-transition: all 0.25s linear;
		    -moz-transition: all 0.25s linear;
		    -ms-transition: all 0.25s linear;
		    -o-transition: all 0.25s linear;
		    transition: all 0.25s linear;
		    text-decoration: none;
		}
    </style>
</head>
<body>

<jsp:include page="/frontend/EZ_nav.jsp" />
	<% @SuppressWarnings("unchecked")
	Vector<SecItem> buylist = (Vector<SecItem>) session.getAttribute("shoppingcart");%>
	

	<div class="wrap cf">
        <div class="heading cf">
          <h1>EASY SPACE | 購物車</h1>
          <a href="<%= request.getContextPath() %>/frontend/sec_items/secItemsViewPage.jsp" class="continue">繼續購物</a>
        </div>
        <div class="cart">
          <ul class="cartWrap">
          
          
          	<%
				BigDecimal total = new BigDecimal(BigInteger.ZERO,0);
          	if (buylist!=null){
				for (int index = 0; index < buylist.size(); index++) {
				 SecItem order = buylist.get(index);
				 BigDecimal subtotal = order.getShPrice().multiply(new BigDecimal(order.getShQTY()));
				 total = total.add(order.getShPrice().multiply(new BigDecimal(order.getShQTY())));
			%>
				<li class="items even">
	            	<div class="infoWrap"> 
	              		<div class="cartSection info">
	             			<img src="#" alt="" class="itemImg" />
<!-- 			                <p class="itemNumber">#QUE-007544-002</p> -->
			                <h3 class="product-name"><%=order.getShName()%></h3>
			                <p> <input type="text"  class="qty" placeholder="<%=order.getShQTY()%>"/> x $<%=order.getShPrice()%></p>
			                <p class="stockStatus"> In Stock</p>
	              		</div>  
		             	<div class="prodTotal cartSection">
		                	<p>$<%=subtotal %></p>
		              	</div>
	          
	                  	<div class="cartSection removeWrap">
	                		<form class="deleteForm" name="deleteForm" action="<%= request.getContextPath() %>/sec_items/ShoppingServlet.do" method="POST">
					              <input type="hidden" name="action"  value="DELETE">
					              <input type="hidden" name="del" value="<%= index %>">
<!-- 					              <input type="submit" class="remove" value="x"> -->
					              <a href="#" class="remove" onclick="myFunction(this)">x</a>
		          			</form>
	            		</div>
	               </div>
	            </li>
			<%	}
			  }	%>
<!-- ---------------------------------------------------------------------------- -->
<!-- 			<li class="items odd"> -->
<!--             	<div class="infoWrap">  -->
<!--             		<div class="cartSection"> -->
<!-- 		            	<img src="#" alt="" class="itemImg" /> -->
<!--                 		<p class="itemNumber">#QUE-007544-002</p> -->
<!--                 		<h3>Item Name 1</h3> -->
<!--                  		<p> <input type="text"  class="qty" placeholder="3"/> x $5.00</p> -->
<!--                 		<p class="stockStatus out"> Out of Stock</p> -->
<!-- 					</div>   -->
<!-- 					<div class="prodTotal cartSection"> -->
<!--                			<p>$15.00</p> -->
<!--               		</div> -->
<!--                     <div class="cartSection removeWrap"> -->
<!--                  		<a href="#" class="remove">x</a> -->
<!--             		</div> -->
<!-- 				</div> -->
<!--             </li> -->
            
<!-- ---------------------------------------------------------------------------- -->
<!--             <li class="items even"> -->
<!--             	<div class="infoWrap">  -->
<!--               		<div class="cartSection info"> -->
<!--              			<img src="#" alt="" class="itemImg" /> -->
<!-- 		                <p class="itemNumber">#QUE-007544-002</p> -->
<!-- 		                <h3>Item Name 1</h3> -->
<!-- 		                <p> <input type="text"  class="qty" placeholder="3"/> x $5.00</p> -->
<!-- 		                <p class="stockStatus"> In Stock</p> -->
<!--               		</div>   -->
<!-- 	             	<div class="prodTotal cartSection"> -->
<!-- 	                	<p>$15.00</p> -->
<!-- 	              	</div> -->
          
<!--                   	<div class="cartSection removeWrap"> -->
<!--                 		<a href="#" class="remove">x</a> -->
<!--             		</div> -->
<!--                </div> -->
<!-- ---------------------------------------------------------------------------- -->  
<!--                <div class="special"> -->
<!--                		<div class="specialContent"> -->
<!--                			Free gift with purchase!, gift wrap, etc!! -->
<!--                		</div> -->
<!--                </div> -->
<!--             </li> -->
<!-- ---------------------------------------------------------------------------- -->       
          </ul>
        </div>
        
        
        <div class="subtotal cf">
          <ul>
            <li class="totalRow"><span class="label">總價</span><span class="value">$<%=total%></span></li>
                <li class="totalRow"><span class="label">運費</span><span class="value">$0</span></li>
                <li class="totalRow final"><span class="label">總金額</span><span class="value">$<%=total%></span></li>
          		<li class="totalRow">
          		
          		<%
          			if (total.compareTo(new BigDecimal(0))==1){
          		%>
          		
              	<form name="checkoutForm" action="<%= request.getContextPath() %>/sec_items/ShoppingServlet.do" method="POST">
		        	<input type="hidden" name="action"  value="CHECKOUT"> 
		            <input type="submit" value="前往結帳" id="checkoutbtn">
		        </form>
		        
		        <%
          			}
		        %>
		        </li>
          </ul>
        </div>
      </div>

	<script>
	        // Remove Items From Cart
	    $('.remove').click(function(){
	    event.preventDefault();
	    $( this ).parent().parent().parent().parent().hide( 400 );
	    
	    })
	
	    // Just for testing, show all items
	    $('a.btn.continue').click(function(){
	        $('li.items').show(400);
	    })
	    
	    function myFunction(dom) {
	    	dom.closest('.deleteForm').submit();
	    }
	</script>
</body>
</html>