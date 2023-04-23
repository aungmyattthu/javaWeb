<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/style.css" />
<title>FORWARD JSP</title>
</head>
<body>
	<jsp:include page="/resources/nav-bar.jsp">
		<jsp:param value="actions" name="page"/>
	</jsp:include>
	<main>
	<h1>Forward JSP</h1>
	<p>
	<%=request.getParameter("message")%>
	</p>
	</main>
</body>
</html>