<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="java.util.* , ezs.sec_items.model.* , java.math.*" %>
<html>
<head>
 <title>EASY SPACE</title>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ShoppingCart.css">
 </head>
<body>
<font size="+3">�����ӫ� - ���b�G�]Checkout.jsp�^</font>
<hr><p>

<table id="table-1" style="margin: auto;">
	<tr>
		<th width="200">�ӫ~ID</th>
		<th width="100">�ӫ~�W��</th>
		<th width="100">�ӫ~����</th>
		<th width="100">�ӫ~�ƶq</th>
		<th width="120"><h3>�`��</h3></th>
	</tr></table><table style="margin: auto;">

	<%  @SuppressWarnings("unchecked")
		Vector<SecItem> buylist = (Vector<SecItem>) session.getAttribute("shoppingcart");
		String amount =  (String) request.getAttribute("amount");
	%>	
	<%	for (int i = 0; i < buylist.size(); i++) {
		SecItem order = buylist.get(i);
			Integer shID = order.getShID();
			String shName = order.getShName();
			BigDecimal shPrice = order.getShPrice();
			Integer shQTY = order.getShQTY();
			
	%>
	<tr>
		<td width="200"><%=shID%>     </td>
		<td width="100"><%=shName%>   </td>
		<td width="100"><%=shPrice%></td>
		<td width="100"><%=shQTY%>    </td>
	</tr>
	<%
		}
	%>
	 
	
	<tr>
		<td colspan="5" style="text-align:right;"> 
		   <font size="+2">�`���B�G <h4>$<%=amount%></h4> </font>
	    </td>
	</tr>
</table>
       
       
       <p><a href="<%= request.getContextPath() %>/frontend/sec_items/secItemsViewPage.jsp"><font size="+1"> �O �_ �~ �� �� ��</font></a>

</body>
</html>