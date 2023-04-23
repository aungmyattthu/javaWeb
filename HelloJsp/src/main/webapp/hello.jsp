<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="title">Hello JSP</div>
	<%
	date = new Date();
		out.println(formatDate(date));
	%>
	<ul>
	<%
		for(var i = 0;i<3;i++){
			%>
			<li>
				<%=doUpper("hello") %>
			</li>
			
			<% 
		}
	%></ul>
	<%!Date date = new Date();%>
	<%!String formatDate(Date date) {
		var df = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
		return df.format(date);

	}%>
	<%! String doUpper(String str){
		return str.toUpperCase();
	} %>
</body>
</html>