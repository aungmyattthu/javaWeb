<%@page import="com.jdc.counter.Counter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Scope Counter</h1>
	<p>This is Demonstration to learn Servlet Scopes!</p>
	<table>
		<tr>
			<td>Request</td>
			<td>
				<%
					Counter c1 = (Counter)request.getAttribute("counter");
					out.append(c1 == null? "0": c1.getCount().toString());					
				%>
			</td>
		</tr>
		<tr>
			<td>Session</td>
			<td>
			<%
					Counter c2= (Counter)session.getAttribute("counter");
					out.append(c2 == null? "0": c2.getCount().toString());
				%>
			</td>
		</tr>
		<tr>
			<td>Application</td>
			<td>
			<%
					Counter c3 = (Counter)application.getAttribute("counter");
					out.append(c3 == null? "0": c3.getCount().toString());
				%>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
			<a href="counter">Count Up</a>
			</td>
		</tr>
	</table>
</body>
</html>