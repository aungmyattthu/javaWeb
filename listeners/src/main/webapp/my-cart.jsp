<%@page import="java.awt.event.ItemEvent"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.jdc.shop.model.ShoppingCart"%>
<%@page import="com.jdc.shop.model.entity.SaleItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr />
	<a href="index.jsp">Home</a>
	<hr/>
	<h1>My Cart</h1>
	<p>Item details in Shopping Cart.</p>
	<%! ShoppingCart cart; %>
	<%! String format(int data){
		return new DecimalFormat("#,##0").format(data);	
	}%>
	
	<% 
	ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
	
%>
	<table style="width : 75%">
		<tr>
			<td>Product</td>
			<td>Category</td>
			<td>Unit Price</td>
			<td></td>
			<td>Count</td>
			<td></td>
			<td>Total</td>
		</tr>
		<%
			for(SaleItem item : cart.items()){
				%>
			<tr>
				<td><%=item.getProduct().getName() %></td>
				<td><%=item.getProduct().getCategory() %></td>
				<td><%=item.getProduct().getPrice()%></td>
				<td>
					<a href="cart-minus?product=<%=item.getProduct().getId() %>" >-</a>
				</td>
				<td style ="text-align:center"><%=item.getCount()%></td>
				<td><a href="cart-plus?product=<%=item.getProduct().getId() %>">+</a></td>
				<td><%=item.getTotal()%></td>
			</tr>
		<%
			}
		%>
		<tr>
			<td colspan="3">Total</td>
			<td colspan="3" style ="text-align:center"><%=cart.itemCount() %></td>
			<td ><%=format(cart.total()) %></td>
		</tr>
	</table>
	<hr/>
	<h3>Check Out</h3>
	<form action="checkout" method="post">
		<label for="">Customer Name</label>
		<input type="text" placeholder="Enter Customer Name" name="customer"/>
		<button type = "submit">Check out</button>
	</form>
</body>
</html>