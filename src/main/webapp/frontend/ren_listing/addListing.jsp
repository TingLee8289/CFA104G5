<%@page import="ezs.ren_landlord.model.RenLandlordService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<%@ page import="ezs.ren_listing.model.*"%>
<%@ page import="ezs.ren_listing_pic.model.*" %>
<%@ page import="ezs.ren_landlord.model.*" %>
<%@ page import="java.util.List" %>

<%-- <%--  <%  Integer memID = (Integer) session.getAttribute("memID");   --%> 
<!-- //  	Integer lddMemId = Integer.valueOf(request.getParameter("lddMemId")); -->
<!-- //    	RenLandlordService renLandlordSvc = new RenLandlordService(); -->
<!-- //    	List<RenLandlordVO>  OneMenDmdList = renLandlordSvc.getOneLandlordbymemid(lddMemId);  -->
<!-- //   	pageContext.setAttribute("OneMenDmdList",OneMenDmdList); -->
<!-- //   	pageContext.setAttribute("lddMemId",lddMemId);  	 -->
<%-- <%--  %> --%> 

<%-- <%-- <% --%> 
<!-- // RenFavoritesVO renFavoritesVO = (RenFavoritesVO) request.getAttribute("renFavoritesVO"); -->
<!-- // Integer memID = (Integer)session.getAttribute("memID"); -->
<!-- // RenFavoritesService renFavSvc = new RenFavoritesService(); -->
<!-- // String favLisId = (String) request.getParameter("favLisId"); -->
<!-- // pageContext.setAttribute("favLisId", favLisId); -->
<%-- <%-- %> --%> 

<%--  <% List<RenLandlordVO>  OneMenDmdList = renLandlordSvc.getOneLandlordbymemid(lddMemId); --%>
<%--   pageContext.setAttribute("OneMenDmdList",OneMenDmdList);%>  --%>

<% 
   RenListingVO renListingVO = (RenListingVO) request.getAttribute("renListingVO");
   %>
<%-- <%-- <% --%> 
<!-- // Integer memID = (Integer)session.getAttribute("memID"); -->
<!-- //  RenListingService renListingSvc = new RenListingService(); -->
<!-- //  Integer lisLddID = Integer.valueOf( request.getParameter("lisLddID")); -->
<!-- //  pageContext.setAttribute(name, value); -->
<%-- <%--  %>  --%> 
<%= renListingVO == null %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>EASY SPACE</title>
<style>
  table#table-1 {
	background-color: #c27f29;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>出租刊登 - addEmp.jsp</h3></td><td>
		 <h4><a href="listing_select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<h3>房屋基本資料:<font color = red><b>*</b></font>為必填</h3>


<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" enctype="multipart/form-data" ACTION="RenListingServlet.do" name="form1">

<table>
	<tr>
		<td>房東ID<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisLddID" maxlength="25" size="45"
			value="${lddMemId}"/>
		
		</td>
	</tr>
	<jsp:useBean id= "renRoomtypeSvc" scope="page" class="ezs.ren_roomtype.model.RenRoomtypeService"/>
	<tr>
		<td>房屋類型<font color = red><b>*</b></font></td>
			<td><select size="1" name="lisRtID">
			<c:forEach var="renRoomtypeVO" items="${renRoomtypeSvc.all}">
				<option value="${renRoomtypeVO.rtID}" ${(renListingVO.lisRtID == renRoomtypeVO.rtID)? 'selected':'' } >${renRoomtypeVO.rtType}
			</c:forEach>
		</select></td>
	<tr>
		<td>廣告標題<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisTitle" maxlength="25" size="45"
			value="<%= (renListingVO==null)? "範例:吉屋出租，請速與我聯絡!": renListingVO.getLisTitle() %>"/></td>
	</tr>
	<jsp:useBean id= "renLocationSvc" scope="page" class="ezs.ren_location.model.RenLocationService"/>
	<tr>
		<td>區域<font color = red><b>*</b></font></td>
			<td><select size="1" name="lisAreaID">
				<c:forEach var="renLocationVO" items="${renLocationSvc.all}">
					<option value="${renLocationVO.locID}" ${(renListingVO.lisAreaID == renLocationVO.locID)? 'selected':'' } >${renLocationVO.locCity}${renLocationVO.locDist}
				</c:forEach>
		</select></td>
	</tr>
	
	<tr>
		<td>詳細地址<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisAddress" size="45"	
			value="<%= (renListingVO==null)? "範例:中北路200號": renListingVO.getLisAddress() %>"/></td>
	</tr>
	<tr>
		<td>樓層<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisFlr" size="45"
			value="<%= (renListingVO==null)? "範例:3樓/5樓": renListingVO.getLisFlr() %>"/></td>
	</tr>
	<tr>
		<td>坪數<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisSqft" size="45"
			value="<%= (renListingVO==null)? "4.5": renListingVO.getLisSqft() %>"/>  請填數字</td>
	</tr>
	
	<tr>
		<td>房屋格局<font color = red><b>*</b></font></td>
		<td>房間數<input type="TEXT" name="lisRmNo" size="1"
			value="<%= (renListingVO==null)? "3": renListingVO.getLisRmNo() %>"/>  請填整數</td>
	</tr>
	<tr>
		<td></td>
		<td>廳數		<input type="TEXT" name="lisCmnArea" size="1"
			value="<%= (renListingVO==null)? "2": renListingVO.getLisCmnArea() %>"/>  請填整數</td>
	</tr>		
	<tr><td></td>
		<td>衛數		<input type="TEXT" name="lisBrNo" size="1"
			value="<%= (renListingVO==null)? "2": renListingVO.getLisBrNo() %>"/>  請填整數</td>
	</tr>
	<tr>
		<td>租金<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisRent" size="1"
			value="<%= (renListingVO==null)? "1000": renListingVO.getLisRent() %>"/>  元/月</td>
	</tr>
	<tr>
		<td>管理費<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisMngFee" size="1"
			value="<%= (renListingVO==null)? "1000": renListingVO.getLisMngFee() %>"/>  元/月，無請填0</td>
	</tr>
	<tr>
		<td>停車費<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisPfee" size="1"
			value="<%= (renListingVO==null)? "1000": renListingVO.getLisPfee() %>"/>  元/月，無請填0</td>
	</tr>
	<tr>
		<td>詳細地址<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisAddress" size="45"	
			value="<%= (renListingVO==null)? "範例:中北路200號": renListingVO.getLisAddress() %>"/></td>
	</tr>
	<tr> 

      
		<td>房源介紹<font color = red><b>*</b></font></td>
		<td><input type="TEXT" name="lisAbt" size="45"	
			value="<%= (renListingVO==null)? "範例:中北路200號": renListingVO.getLisAbt() %>"/></td>
	
      </tr>
      <tr>
      	<td>房屋其他條件<font color = red><b>*</b></font></td>
			<td>寬頻網路<select  name="lisEthernet" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisEthernet() %>'  selected >無</option>
				
				<option value='1' >有</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>Wifi<select  name="lisWifi" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisWifi() %>'  selected >無</option>
				
				<option value='1' >有</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>熱水器<select  name="lisWh" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisWh() %>'  selected >無</option>
				
				<option value='1' >有</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>乾溼分離<select  name="lisShenc" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisShenc() %>'  selected >無</option>
				
				<option value='1' >有</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>冷氣<select  name="lisAc" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisAc() %>'  selected >無</option>
			
				<option value='1' >有</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>冰箱<select  name="lisFridge" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisFridge() %>'  selected >無</option>
				
				<option value='1' >有</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>電視<select  name="lisTv" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisTv() %>'  selected >無</option>
				
				<option value='1' >有</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>洗衣機<select  name="lisWasher" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisWasher() %>'  selected >無</option>
				
				<option value='1' >有</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>烘衣機<select  name="lisDryer" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisDryer() %>'  selected >無</option>
				
				<option value='1' >有</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
			桌椅<select  name="lisTc" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisTc() %>'  selected >無</option>
				
				<option value='1' >有</option>
				</select>
			
			<br>
			床<select  name="lisBed" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisBed() %>'  selected >無</option>
				
				<option value='1' >有</option>
				</select>
			<br>
			櫃子<select  name="lisCabinet" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisCabinet() %>'  selected >無</option>
				
				<option value='1' >有</option>
				</select>
			<br>
			沙發<select  name="lisSofa" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisSofa() %>'  selected >無</option>
				
				<option value='1' >有</option>
				</select>
			<br>
			車位<select  name="lisParking" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisParking() %>'  selected >無</option>
				
				<option value='1' >有</option>
				</select>
			<br>
			開伙<select  name="lisCook" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisCook() %>'  selected >不可以</option>
				
				<option value='1' >可以</option>
				</select>
			<br>
			養寵物<select  name="lisPet" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisPet() %>'  selected >不可以</option>
				
				<option value='1' >可以</option>
				</select>
			<br>
			吸菸<select  name="lisSmoking" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisSmoking() %>'  selected >否</option>
				
				<option value='1' >可以</option>
				</select>
			<br>
			限男性<select  name="lisMonly" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisMonly() %>'  selected >否</option>
				
				<option value='1' >是</option>
				</select>
			<br>
			限女性<select  name="lisFonly" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisFonly() %>'  selected >否</option>
				
				<option value='1' >有</option>
				</select>
			<br>
			限學生<select  name="lisSonly" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisSonly() %>'  selected >否</option>
				
				<option value='1' >有</option>
				</select>
				
                 <td>商品圖片:</td>
				<td><input type="file" id="upfiles" name="lspPic"
					accept="image/gif, image/jpeg, image/png" multiple="multiple" />
					<div id="previews">
						<p>圖片預覽</p>
					</div>
			
			<br>
			<tr>
			 <td></td>
<!-- 			 <td>房源上架狀態</td> -->
<!-- 			 <td> -->
<%-- 			<select  name="lisStatus" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisStatus() %>'  selected >否</option> --%>
				
<!-- 				<option value='1' >已下架</option> -->
<!-- 				</select> -->
<!-- 			</td> -->
<!-- 			<td>房源申請審核狀態<td> -->
<!-- 			<td> -->
<%-- 			<select  name="lisApproval" ><option value='<%= (renListingVO==null)? "0": renListingVO.getLisApproval() %>'  selected >否</option> --%>
<!-- 				<option value='0' >審核中</option> -->
<!-- 				<option value='1' >已審核</option> -->
<!-- 				<option value='2' >審核未過</option> -->
<!-- 				</select> -->
<!-- 			</td> -->
			<br>			
			
	<tr>
		<td></td>
		<td>
			<input type="hidden" name="action" value="insert">
			<input type="submit" value="送出新增">
		<td>
		</td>
	</tr>	
</table>
</FORM>



</body>
<script>
	// 	// // change這個event有只代表改變，並不代表有檔案。
	// 	// 	如果要FileReader去讀檔案，必須給他一個檔案Object。
	// 	// 	它拿到檔案Object後會驅動onload事件
	// 	// 	藉由 FileReader 物件，Web 應用程式能以非同步（asynchronously）方式讀取儲存在用戶端的檔案（或原始資料暫存）內容
	// 	// 裡面的input 就是我們丟進去的this，也就是<input type="file">，
	// 	// 當<input type="file">被DOM變成Object的時候，如果他有選擇到檔案，
	// 	// 會被放在input.files裡面，而且是一個Array(因為input如果寫成 <input type="file" multiple> 的時候是可以複選的)
	$("#upfiles").change(function() {
		$("#previews").html(""); // 清除預覽
		readURL(this);
	});
	function readURL(input) {
		if (input.files && input.files.length >= 0) {
			for (var i = 0; i < input.files.length; i++) {
				var reader = new FileReader();
				reader.onload = function(e) {
					var img = $("<img width='300' height='200'>").attr('src',
							e.target.result);
					$("#previews").append(img);
				}
				reader.readAsDataURL(input.files[i]);
			}
		} else {
			var noPictures = $("<p>目前沒有圖片</p>");
			$("#previews").append(noPictures);
		}
	}
</script>

</html>