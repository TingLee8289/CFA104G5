<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="ezs.sec_ord.model.*" %>
<%
	SecOrdVO secOrdVO = (SecOrdVO) request.getAttribute("secOrdVO");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
 	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  
<!--     寄送資訊css -->
	<style>
        @import url("https://rsms.me/inter/inter.css");

        :root {
        --color-gray: #737888;
        --color-lighter-gray: #e3e5ed;
        --color-light-gray: #f7f7fa;
        }

        *,
        *:before,
        *:after {
        box-sizing: inherit;
        }

        html {
        font-family: "Inter", sans-serif;
        font-size: 14px;
        box-sizing: border-box;
        }

        @supports (font-variation-settings: normal) {
        html {
            font-family: "Inter var", sans-serif;
        }
        }

        body {
        margin: 0;
        }

        h1 {
        margin-bottom: 1rem;
        }

        p {
        color: var(--color-gray);
        }

        hr {
        height: 1px;
        width: 100%;
        background-color: var(--color-light-gray);
        border: 0;
        margin: 2rem 0;
        }

        .container {
        max-width: 40rem;
        padding: 10vw 2rem 0;
        margin: 0 auto;
        height: 100vh;
        display: inline-block;
        }

        .form {
        display: grid;
        grid-gap: 1rem;
        }

        .field {
        width: 100%;
        display: flex;
        flex-direction: column;
        border: 1px solid var(--color-lighter-gray);
        padding: .5rem;
        border-radius: .25rem;
        }

        .field__label {
        color: var(--color-gray);
        font-size: 0.6rem;
        font-weight: 300;
        text-transform: uppercase;
        margin-bottom: 0.25rem
        }

        .field__input {
        padding: 0;
        margin: 0;
        border: 0;
        outline: 0;
        font-weight: bold;
        font-size: 1rem;
        width: 100%;
        -webkit-appearance: none;
        appearance: none;
        background-color: transparent;
        }
        .field:focus-within {
        border-color: #000;
        }

        .fields {
        display: grid;
        grid-gap: 1rem;
        }
        .fields--2 {
        grid-template-columns: 1fr 1fr;
        }
        .fields--3 {
        grid-template-columns: 1fr 1fr 1fr;
        }

        .button {
        background-color: #000;
        text-transform: uppercase;
        font-size: 0.8rem;
        font-weight: 600;
        display: block;
        color: #fff;
        width: 100%;
        padding: 1rem;
        border-radius: 0.25rem;
        border: 0;
        cursor: pointer;
        outline: 0;
        }
        .button:focus-visible {
        background-color: #333;
        }
    </style>
<!--     付款資訊css -->
    <style>
        body { margin-top:20px; }
        .container2 { display: inline-block;}
        .panel-title {display: inline;font-weight: bold;}
        .checkbox.pull-right { margin: 0; }
        .pl-ziro { padding-left: 0px; }
        
    </style>
</head>
<body>
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
    <form method="post" action="<%=request.getContextPath()%>/sec_ord/SecOrdServlet.do">
<!--  寄送資訊-------------------------------------------------------------- -->
		<div class="container">
	        <h1>寄送資訊</h1>
		        <div class="form">
		          <div class="fields fields--2">
		            <label class="field">
		              <span class="field__label" for="shBuyerID">買家會員編號</span>
		              <input class="field__input" type="text" id="shBuyerID" name="shBuyerID" value="<%=(secOrdVO == null) ? "" : secOrdVO.getShBuyerID()%>" />
		            </label>
		            <label class="field">
		              <span class="field__label" for="phone">收件人電話號碼</span>
		              <input class="field__input" type="text" id="phone" value="" />
		            </label>
		          </div>
		          <div class="fields fields--3">
		            <label class="field">
		              <span class="field__label" for="shCounty">縣市</span>
		              <input class="field__input" type="text" id="shCounty" name="shCounty" value="<%=(secOrdVO == null) ? "" : secOrdVO.getShCounty()%>"/>
		            </label>
		            <label class="field">
		              <span class="field__label" for="shDist">區域</span>
		              <input class="field__input" type="text" id="shDist" name="shDist" value="<%=(secOrdVO == null) ? "" : secOrdVO.getShDist()%>"/>
		            </label>
		            <label class="field">
		              <span class="field__label" for="shPostcode">郵遞區號</span>
		              <input class="field__input" type="text" id="shPostcode" name="shPostcode" value="<%=(secOrdVO == null) ? "" : secOrdVO.getShPostcode()%>"/>
		            </label>
		          </div>
		          <label class="field">
		            <span class="field__label" for="shRoad">地址</span>
		            <input class="field__input" type="text" id="shRoad" name="shRoad" value="<%=(secOrdVO == null) ? "" : secOrdVO.getShRoad()%>"/>
		          </label>
		          <label class="field">
		            <span class="field__label" for="shNotes">備註</span>
		            <input class="field__input" type="text" id="shNotes" name="shNotes" value="<%=(secOrdVO == null) ? "" : secOrdVO.getShNotes()%>"/>
		          </label>
		        	<button class="button">產生訂單</button>
		        </div>
	     </div>
	      <input type="hidden" name="action" value="insert">
      </form>
<!--  信用卡資訊-------------------------------------------------------------- -->
	      <div class="container2">
	        <div class="row">
	            <div class="col-xs-12 col-md-4">
	                <div class="panel panel-default">
	                    <div class="panel-heading">
	                        <h3 class="panel-title">
	                            Payment Details
	                        </h3>
	                        <div class="checkbox pull-right">
	                            <label>
	                                <input type="checkbox" />
	                                Remember
	                            </label>
	                        </div>
	                    </div>
	                    <div class="panel-body">
				<!--     <form role="form"> -->
	                        <div class="form-group">
	                            <label for="cardNumber">信用卡卡號</label>
	                            <div class="input-group">
	                                <input type="text" class="form-control" id="cardNumber" placeholder="Valid Card Number"
	                                    required autofocus />
	                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-xs-7 col-md-7">
	                                <div class="form-group">
	                                    <label for="expityMonth">信用卡有效月年</label>
	                                    <div class="col-xs-6 col-lg-6 pl-ziro">
	                                    	<input type="text" class="form-control" id="expityMonth" placeholder="MM" required />
	                                    </div>
	                                    <div class="col-xs-6 col-lg-6 pl-ziro">
	                                        <input type="text" class="form-control" id="expityYear" placeholder="YY" required />
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-xs-5 col-md-5 pull-right">
	                                <div class="form-group">
	                                    <label for="cvCode">信用卡驗證碼</label>
	                                    <input type="password" class="form-control" id="cvCode" placeholder="CV" required />
	                                </div>
	                            </div>
	                        </div>
						<!-- </form> -->
	                    </div>
	                </div>
	                <ul class="nav nav-pills nav-stacked">
	                    <li class="active"><a href="#"><span class="badge pull-right"><span class="glyphicon glyphicon-usd"></span>4200</span> Final Payment</a>
	                    </li>
	                </ul>
	                <br/>
	                <a href="#" class="btn btn-success btn-lg btn-block" role="button">Pay</a>
	            </div>
	        </div>
	   	 </div>
	   	
 
   	 
</body>
</html>