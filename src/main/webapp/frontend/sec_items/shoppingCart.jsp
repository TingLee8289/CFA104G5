<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
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

<font size="+3">�ثe�ʪ��������e�p�U�G�]ShoppingCart.jsp�^</font>

<table id="table-1">
    <tr> 
      <th width="200">�ӫ~ID</th>
      <th width="100">�ӫ~�W��</th>
      <th width="100">�ӫ~����</th>
      <th width="100">�ƶq</th>
      <th width="120">�ާ@</th>
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
              <input type="submit" value="�R ��" class="button">
          </form></td>
	</tr>
	<%}%>
</table>
<p>
          <form name="checkoutForm" action="<%= request.getContextPath() %>/sec_items/ShoppingServlet.do" method="POST">
              <input type="hidden" name="action"  value="CHECKOUT"> 
              <input type="submit" value="�I�ڵ��b" class="button">
          </form>
<%}%>

	<p><a href="<%= request.getContextPath() %>/frontend/sec_items/secItemsViewPage.jsp"><font size="+1"> �~ �� �� ��</font></a>
</body>
</html>