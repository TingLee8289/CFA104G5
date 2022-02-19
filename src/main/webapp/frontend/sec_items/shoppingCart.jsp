<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.* , ezs.sec_items.model.*" %>
<html>
<head>
 <title>EASY SPACE</title>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ShoppingCart.css">
</head>
<body><br>
   <% @SuppressWarnings("unchecked")
   Vector<SecItem> buylist = (Vector<SecItem>) session.getAttribute("shoppingcart");%>
<%if (buylist != null && (buylist.size() > 0)) {%>

<font size="+3">目前購物車的內容如下：（ShoppingCart.jsp）</font>

<table id="table-1">
    <tr> 
      <th width="200">商品ID</th>
      <th width="100">商品名稱</th>
      <th width="100">商品價格</th>
      <th width="100">數量</th>
      <th width="120">操作</th>
    </tr>
</table>
    
<table>

	<%
	 for (int index = 0; index < buylist.size(); index++) {
		 SecItem order = buylist.get(index);
	%>
	<tr>
		<td width="200"><%=order.getShID()%>     </td>
		<td width="100"><%=order.getShName()%>   </td>
		<td width="100"><%=order.getShPrice()%></td>
		<td width="100"><%=order.getShQTY()%>    </td>
		
        <td width="120">
          <form name="deleteForm" action="<%= request.getContextPath() %>/sec_items/ShoppingServlet.do" method="POST">
              <input type="hidden" name="action"  value="DELETE">
              <input type="hidden" name="del" value="<%= index %>">
              <input type="submit" value="刪 除" class="button">
          </form></td>
	</tr>
	<%}%>
</table>
<p>
          <form name="checkoutForm" action="<%= request.getContextPath() %>/sec_items/ShoppingServlet.do" method="POST">
              <input type="hidden" name="action"  value="CHECKOUT"> 
              <input type="submit" value="付款結帳" class="button">
          </form>
<%}%>

	<p><a href="<%= request.getContextPath() %>/frontend/sec_items/secItemsViewPage.jsp"><font size="+1"> 繼 續 購 物</font></a>
</body>
</html>