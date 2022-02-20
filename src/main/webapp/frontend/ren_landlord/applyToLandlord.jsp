<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="ezs.ren_landlord.model.*"%>
<%@ page import="ezs.member.model.*"%>
<%
request.setAttribute("memID", 1); // 測試用，之後get方法要改成session.get...
%>
<%
Integer memID = (Integer) request.getAttribute("memID");
RenLandlordVO renLandlordVO = new RenLandlordVO();
MemberService memSvc = new MemberService();
RenLandlordService renLandlordSvc = new RenLandlordService();
MemberVO memVO = memSvc.getOneMember(memID);
%>

<%-- <%= fMemVO==null %> --%>
<!DOCTYPE html>
<html lang="zh-Hant">

<head>

<title>申請成為房東</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/frontend/ren_landlord/2825.51680d86fe84cd4ddf65.css">
</head>

<body style="" class="nt-s nl-l">
<%-- 	<jsp:include page="/front-end/home/header.jsp" flush="true"/> --%>	
									<h1 class="_3iiDCN">申請成為房東</h1>
									<div class="TQG40c">上傳身分證以供審核</div>
									<div style="height: 36px;">
										<%-- 錯誤表列 --%>
										<c:if test="${not empty errorMsgs}">
											<font style="color: red">請修正以下錯誤:</font>
											<ul>
												<c:forEach var="message" items="${errorMsgs}">
													<li style="color: red">${message}</li>
												</c:forEach>
											</ul>
										</c:if>
									</div>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ren_landlord/RenLandlordServlet.do" name="form1" enctype="multipart/form-data" style="width:587px;">
									<div class="goiz2O">
										<div class="pJout2">
											<div id="wrapper" style="height:400px; width:700px; position:abslute;">
												<h1 class="_3iiDCN">身分證正面</h1>
												<input id="put1" class="btn btn-light btn--m btn--inline selectimg"
													type="file" accept="image/*" style="display: block;"
													name="lddPic" value="<%= (renLandlordVO==null)? "" : renLandlordVO.getLddPic() %>">
											</div>
											<!-- 這邊控制傳送至Servlet -->
											<input type="hidden" name="action" value="insert">
											<input type="hidden" name="lddMemId" value= "<%= memID %>">
											<div class="_31PFen">
												<button style="background-color:#b9d4b3;" type="submit" id="demo4"
													class="btn btn-solid-primary btn--m btn--inline"
													aria-disabled="false">送出審核</button>
											</div>
										</div>
										</div>
								</FORM>
	<!--    新增已更改的圖片用，動態生成選擇的圖片， -->
	<script>
        let blockArray = [];

        const wrapper = document.querySelector('#wrapper');
        const block1 = genSelectImgBlock1();
        wrapper.appendChild(block1);

        function genSelectImgBlock1() {
            const div = document.createElement('div');
            const inputBtn = document.querySelector('#put1');
            const img = document.createElement('img');
            const hr = document.createElement('hr');

            img.setAttribute('style', 'display:block;max-height:300px;position:absolute;');

            div.appendChild(img);

            inputBtn.addEventListener('input', (e) => {
                const url = URL.createObjectURL(inputBtn.files[0]);
                console.log(url);
                if (url) { 
                    img.setAttribute('src', url);
                    if (blockArray[blockArray.length - 1] === div) {
                        const block = genSelectImgBlock();
                        wrapper.appendChild(block);
                    }
                }
            });

            return div;
        }
        
        const wrapper2 = document.querySelector('#wrapper2');
        const block2 = genSelectImgBlock2();
        wrapper2.appendChild(block2);

        function genSelectImgBlock2() {
            const div2 = document.createElement('div');
            const inputBtn2 = document.querySelector('#put2');
            const img2 = document.createElement('img');
            const hr2 = document.createElement('hr');

            img2.setAttribute('style', 'display:block;max-height:300px;position:absolute;');

            div2.appendChild(img2);

            inputBtn2.addEventListener('input', (e) => {
                const url = URL.createObjectURL(inputBtn2.files[0]);
                console.log(url);
                if (url) { 
                    img2.setAttribute('src', url);
                    if (blockArray[blockArray.length - 1] === div2) {
                        const block = genSelectImgBlock();
                        wrapper2.appendChild(block);
                    }
                }
            });

            return div2;
        }
        
    </script>

</body>

</html>