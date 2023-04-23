<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>legacy</title>
</head>
<body>
	<h1>Legacy Configuration</h1>
	<%
	if (response.getStatus() == 404) {
	%>
	<p>Bad Request. There is no page for request. </p>
	<%
	}
	%>
	<%
	if (request.getAttribute("message") != null) {
	%>
	<p>
		<%=request.getAttribute("message")%>
	</p>
	<%
	}
	%>
	<ul>
		<li><a href="hello">hello servlet</a></li>
		<li><a href="count-up">count up</a></li>
		<li><a href="greeting">greeting</a></li>
	</ul>

</body>
</html>