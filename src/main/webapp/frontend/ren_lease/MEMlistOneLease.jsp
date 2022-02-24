<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ezs.ren_lease.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>


<%
	Integer lseMemId = (Integer)session.getAttribute("memID");
	System.out.println(lseMemId);
	RenLeaseService renLeaseSvc = new RenLeaseService();
    List<RenLeaseVO> list = renLeaseSvc.getAllMEM(lseMemId);
    pageContext.setAttribute("list",list);

%>

<html>
<head>
<title>會員租賃單管理</title>

<body bgcolor='white'>
<div class="container-fluid m-3 mx-auto">
	<main>
		<div id="data-panel" class="table-responsive ">
			<table class="table table-striped table-hover align-middle text-center caption-top">
				<caption><h2>所有租賃預約單</h2></caption>
					<thead class="table-success">
					<tr class="text-nowrap">
					<!--   insert data         -->
						<th>租賃訂單編號</th>
						<th>會員編號</th>
						<th>房源編號</th>
						<th>房東編號</th>
<!-- 						<th>房客評價房東星數</th>	 -->
<!-- 						<th>房客評價房東內容</th> -->
<!-- 						<th>房東評價房客星數</th> -->
<!-- 						<th>房東評價房客內容</th> -->
						<th>租賃訂單狀態</th>
						<th>租賃訂單成立時間</th>
						<th>租賃開始時間</th>
						<th>租賃結束時間</th>						
					</tr>
					</thead>
					<tbody id="show-list">		
					<c:forEach var="renLeaseVO" items="${list}" >
					<tr>
						<td>${renLeaseVO.lseId}</td>
		<td>${renLeaseVO.lseMemId}</td>
		<td>${renLeaseVO.lseLddId}</td>
		<td>${renLeaseVO.lseLisId}</td>
		<td>${renLeaseVO.lseStatus}</td>
		<td>${renLeaseVO.lseStart}</td>
		<td>${renLeaseVO.lseEnd}</td>
		<td>${renLeaseVO.lseTimestamp}</td>
					</tr>		
					</c:forEach>
					</tbody>
				</table>
			</div>
		</main>
	</div>
</body>
</html>