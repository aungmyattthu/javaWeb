<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.jdc.shop.model.entity.Vouncher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!String formatDateTime(LocalDateTime date) {
		return date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	}%>
	<%
	var vouncher = (Vouncher) request.getAttribute("data");
	%>
	<!-- Title -->
	<h1>Sale Details</h1>
	<!-- sale summary -->
	<table>
		<tr>
			<td>Vouncher ID</td>
			<td><%=vouncher.getId()%></td>
		</tr>
		<tr>
			<td>Customer Name</td>
			<td><%=vouncher.getCustomer()%></td>
		</tr>
		<tr>
			<td>Sale Date Time</td>
			<td><%=formatDateTime(vouncher.getSaleTime())%></td>
		</tr>
	</table>
	<!-- sale item table -->

	<h3>Sale Items</h3>
	<table>
		<thead>
			<tr>
				<td>Product</td>
				<td>Category</td>
				<td>Unit Price</td>
				<td>Qty</td>
				<td>Total</td>
			</tr>
		</thead>
		<tbody>
		<%
			for(var item : vouncher.getSales()){
		%>
			<tr>
				<td><%=item.getProduct().getName() %></td>
				<td><%=item.getProduct().getCategory() %></td>
				<td><%=item.getProduct().getPrice() %></td>
				<td><%=item.getCount() %></td>
				<td><%=item.getTotal() %></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>