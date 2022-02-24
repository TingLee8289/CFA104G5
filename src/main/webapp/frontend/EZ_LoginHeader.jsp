<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
	<title>EASY SPACE</title>
	
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" href="favicon.ico">
	<style>
		
		body{
			margin: 0;
		}
		
		*{
        box-sizing: border-box;
   		}
		
		.header{
			position: fixed;
			margin-top: 0px;
			background-color: rgb(239,239,239);
			z-index:995;
			width:100%;		
 			margin-top: 19px;	 
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

<!-- Plugins -->
</head>

<body>

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





</body>

</html>