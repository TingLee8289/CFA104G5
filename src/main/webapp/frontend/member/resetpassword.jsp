<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="ezs.member.model.*"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>EASY SPACE</title>
    <link rel="stylesheet" href="/css/style.css" >
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
</head>
<body>

     
    <div align="center">
        <h2>重設密碼</h2>
        <p>
        請重新輸入註冊時信箱，我們將寄發重新設定密碼驗證信給您:
        </p>
         
        <form id="resetForm" ACTION="<%=request.getContextPath()%>/member/ForgetPasswordServlet.do" method="post">
            <table>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="email" id="email" size="50"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="submit">送出</button>
                        <input type="hidden" name="action"	value="reset_Password_Email">
                    </td>
                </tr>    
            </table>
        </form>
    </div>
     

     
<script type="text/javascript">
 
    $(document).ready(function() {
        $("#resetForm").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                }      
            },
             
            messages: {
                email: {
                    required: "請輸入信箱",
                    email: "請輸入有效信箱格式"
                }
            }
        });
 
    });
</script>
</body>
</html>